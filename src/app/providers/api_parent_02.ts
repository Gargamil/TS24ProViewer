import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons, FileSystems } from '../services';
import { Api_Parent_01, TS24PRO_PROGRAM } from './api_parent_01';
import { HTTP } from '@ionic-native/http/ngx';
import moment from "moment-timezone";
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api_Parent_02 extends Api_Parent_01 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons,
        protected httpNavite: HTTP,
        protected file: FileSystems,
        //public common: Commons
    ) {
        super(http, Common, httpNavite);
    }
    //begin-hieu
    /**
     * 
     * @param url path to xml file
     */
    loadXml(url) {
        var xhttp;
        xhttp = new XMLHttpRequest();
        xhttp.open("GET", url, false);
        xhttp.send();
        return xhttp.responseXML;
    }
    /**
     * Hàm lấy Id của file XML
     * Có 3 loại:
     * 1.Thuế - lấy nội dung của node 'maTKhai'
     * 2.Bảo hiểm xã hội - lấy TÊN NODE đầu tiên
     * 3.Hóa đơn: có 2 loại
     * 3.1: Hóa đơn công ty: lấy nội dung trong node <inv:MauIn>
     * 3.2 hóa đơn vnpt : lấy nội dung trong node <MauIn>
     *  @type loại file xml
     * @xml file xml
     */
    GetIdXML(type, xml) {
        let name: any;
        switch (type) {
            case TS24PRO_PROGRAM.THUE:
                if (xml.getElementsByTagName('maTKhai')[0])
                    return xml.getElementsByTagName('maTKhai')[0].childNodes[0].nodeValue
                else return null
            case TS24PRO_PROGRAM.BHXH:
                if (xml.firstChild.nodeName)
                    return xml.firstChild.nodeName;
                else return null;
            case TS24PRO_PROGRAM.INVOICE:
                if (xml.getElementsByTagName('inv:MauIn').length > 0)
                    return xml.getElementsByTagName('inv:MauIn')[0].childNodes[0].nodeValue;
                else return null
            case TS24PRO_PROGRAM.INVOICE_VNPT:
                if (xml.getElementsByTagName('MauIn').length > 0)
                    name = xml.getElementsByTagName('MauIn')[0].childNodes[0].nodeValue;
                else name = null;
                return name;

            default: return null
        }
    }
    /**
     * kiểm tra loại file xml (thuế, bảo hiểm hoặc hóa đơn/ hóa đơn vnpt)
     * @param xml 
     */
    CheckXML(xml) {
        if (xml.getElementsByTagName('HSoThueDTu').length > 0)
            return TS24PRO_PROGRAM.THUE
        else if (xml.getElementsByTagName('inv:transaction').length > 0)
            return TS24PRO_PROGRAM.INVOICE
        else if (xml.getElementsByTagName('Invoice').length > 0)
            return TS24PRO_PROGRAM.INVOICE_VNPT
        else return TS24PRO_PROGRAM.BHXH
    }
    /**
     * chuyển 2 file xml và xsl thành html fragment
     * @param xml file xml 
     * @param xsl file xsl
     */
    ConvertHTML(xml, xsl) {
        var xsltProcessor;
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        return xsltProcessor.transformToFragment(xml, document);
    }
    /**
     * Xem file html từ 
     * @param element element Node name
     * @param xml file xml
     * @param xsl file xsl
     */
    async ViewHTML(path, xmlParam?: any, typeParam?: any) {
        let xml, type;
        if (xmlParam && typeParam) {
            xml = xmlParam;
            type = typeParam;
        }
        let obj = {
            content: null,
            type: null
        }
        if (!xmlParam && !typeParam) {
            xml = await this.file.GetDocXMLFromDevice(path);
            type = this.CheckXML(xml);
        }
        obj.type = type;
        xml = this.DeleteAtribute(type, xml);
        let id = this.GetIdXML(type, xml);
        if (id == null)
            return obj
        else {
            let link = await this.getFilePathXSL(type, id);
            let xsl = await this.file.loadXMLNative(link);
            if (xsl == null)
            {
                console.log("xsl_null",obj);
                return obj
                }
            else {
                let content = this.ConvertHTML(xml, xsl);
                obj.content = content;
                return obj
            }
        }
    }
    /**
     * 
     * @param xml file
     * @param type type
     */
    DeleteAtribute(type, xml) {
        var x;
        switch (type) {
            case TS24PRO_PROGRAM.THUE:
                if (xml.getElementsByTagName('HSoThueDTu')[0].namespaceURI) {
                    xml.getElementsByTagName('HSoThueDTu')[0].removeAttribute("xmlns:xsi");
                    xml.getElementsByTagName('HSoThueDTu')[0].removeAttribute("xmlns:xsd");
                    let outer = xml.getElementsByTagName('HSoThueDTu')[0].outerHTML;
                    outer = outer.replace(/xmlns=\"(.*?)\"/g, '');
                    let parser = new DOMParser();
                    xml = parser.parseFromString(outer, "text/xml");
                    console.log(outer);
                    console.log(xml);
                }
                return xml;
            case TS24PRO_PROGRAM.INVOICE:
                if (xml.getElementsByTagName("inv:resend").length > 0) {
                    x = xml.getElementsByTagName("inv:resend")[0];
                    x.parentNode.removeChild(x);
                    let outer = xml.getElementsByTagName('inv:invoice')[0].outerHTML;
                    console.log(outer);
                    outer = outer.replace(/xmlns=\"(.*?)\"/g, "");
                    do {
                        outer = outer.replace('<![CDATA[', '');
                        outer = outer.replace(']]>', '');
                    }
                    while (outer.indexOf("![CDATA[") != -1)
                    console.log(outer.indexOf("![CDATA["), outer.indexOf(']]>'));
                    //outer = outer.replace(/<!\[CDATA\[(.*)]]>/, "");
                    let parser = new DOMParser();
                    xml = parser.parseFromString(outer, "text/xml");
                    console.log(outer);
                    console.log(xml);
                }
                return xml;
            default:
                return xml;
        }
    }
    async GetCKS(type, xml) {
        // return new Promise(async (resolve, reject) => {
        let id, value, objCKS, xmlEle, NodeCKS, TTCKYS;
        for (var i = 0; i < xml.getElementsByTagName("Signature").length; i++) {
            xmlEle = xml.getElementsByTagName("Signature")[i];
            //lấy id(seller, buyer,,,) và value của CKS
            id = xmlEle.getAttribute('Id');
            value = xmlEle.getElementsByTagName("X509Certificate")[0].childNodes[0].nodeValue;
            //đọc nội dung CKS
            objCKS = await this.getINFOCKSHDDT(value);
            switch (type) {
                case TS24PRO_PROGRAM.INVOICE:
                    //khởi tạo Node CKS nếu node CKS chưa tồn tại
                    if (!NodeCKS)
                        NodeCKS = xml.createElement('CKS');
                    //Thêm thông tin vào node nếu là seller
                    if (id == 'seller') {
                        var CKSNguoiBan = xml.createElement('CKSNguoiBan');
                        var NodeNguoiBan = this.InsertCKSHDCongTy(xml, CKSNguoiBan, objCKS);
                        NodeCKS.appendChild(NodeNguoiBan);
                    }
                    //Thêm thông tin vào node nếu ko phải seller
                    else {
                        var CKSNguoiMua = xml.createElement('CKSNguoiMua');
                        var NodeNguoiMua = this.InsertCKSHDCongTy(xml, CKSNguoiMua, objCKS);
                        NodeCKS.appendChild(NodeNguoiMua);
                    }
                    xml.getElementsByTagName('inv:invoice')[0].appendChild(NodeCKS);
                    break;
                case TS24PRO_PROGRAM.BHXH:
                    //khởi tạo Node CKS nếu node TTCKYS chưa tồn tại
                    if (!TTCKYS)
                        TTCKYS = xml.createElement('TTCKYS');
                    //Thêm thông tin vào node TTCKY
                    var TTCKY = xml.createElement('TTCKY');
                    var NodeTTCKY = this.InsertCKSBHXH(xml, TTCKY, objCKS, 'bhxh');
                    TTCKYS.appendChild(NodeTTCKY);
                    xml.getElementsByTagName(xml.firstChild.nodeName)[0].appendChild(TTCKYS);
                    break;
                case TS24PRO_PROGRAM.THUE:
                    //khởi tạo Node CKS nếu node TTCKYS chưa tồn tại
                    if (!TTCKYS)
                        TTCKYS = xml.createElement('TTCKYS');
                    //Thêm thông tin vào node TTCKY
                    var TTCKY = xml.createElement('TTCKY');
                    var NodeTTCKY = this.InsertCKSBHXH(xml, TTCKY, objCKS, 'thue');
                    TTCKYS.appendChild(NodeTTCKY);
                    xml.getElementsByTagName(xml.firstChild.nodeName)[0].appendChild(TTCKYS);
                    break;
                default: break
            }
        }
        console.log(xml);
        return xml
        //     resolve(xml)
        // })
        //     .then(rs => { rs })
    }
    InsertCKSHDCongTy(xml, CKSNguoiBan, objCKS) {
        var insertNode;
        for (var property1 in objCKS) {
            switch (property1) {
                case 'subjectDN':
                    insertNode = this.CreateChilNode(xml, 'Subject', objCKS.subjectDN);
                    CKSNguoiBan.appendChild(insertNode);
                    break;
                case 'serialToken':
                    insertNode = this.CreateChilNode(xml, 'Serial', objCKS.serialToken);
                    CKSNguoiBan.appendChild(insertNode);
                    break;
                default:
                    break;
            }
        }
        insertNode = this.CreateChilNode(xml, 'Time', '');
        CKSNguoiBan.appendChild(insertNode);
        return CKSNguoiBan;
    }
    InsertCKSBHXH(xml, TTCKY, objCKS, type?: any) {
        var insertNode;
        for (var property1 in objCKS) {
            switch (property1) {
                case 'subjectDN':
                    insertNode = this.CreateChilNode(xml, 'SI', objCKS.subjectDN);
                    TTCKY.appendChild(insertNode);
                    break;
                case 'serialToken':
                    insertNode = this.CreateChilNode(xml, 'SN', objCKS.serialToken);
                    TTCKY.appendChild(insertNode);
                    break;
                default:
                    break;
            }
        }
        if (type == 'bhxh') {
            //lấy time trong SigningTime và công thêm GMT+7
            let time = xml.getElementsByTagName('SigningTime')[0].childNodes[0].nodeValue;
            // console.log(time);
            let time2 = moment(time).tz('Asia/Ho_Chi_Minh').format('YYYY-MM-DD HH:mm:ss');
            // console.log(time2);
            insertNode = this.CreateChilNode(xml, 'ST', time2);
        }
        TTCKY.appendChild(insertNode);
        return TTCKY
    }
    CreateChilNode(xml, NodeName, txt) {
        var parrentNode = xml.createElement(NodeName);
        var textNode = xml.createTextNode(txt);
        parrentNode.appendChild(textNode);
        return parrentNode
    }
    /**
     * 
     * @param path path
     */
    async ConvertXMLtoHTML(path) {
        let objCallback = await this.ViewHTML(path);
        if (objCallback.content == null)
            return null
        let doc = this.GetHTML(objCallback.content);
        let namexml: any = path.substring(path.lastIndexOf("/") + 1, path.length);
        let nameHTML = namexml.substring(0, namexml.length - 3) + 'html';
        let uri = await this.file.writeFile(nameHTML, doc.innerHTML, this.getKeyTS24PRO_PROGRAM(objCallback.type));
        return uri
    }
    private GetHTML(content) {
        let docFrag = document.createDocumentFragment();
        docFrag.appendChild(content);
        let doc = document.createElement("div");
        doc.appendChild(docFrag.cloneNode(true));
        return doc
    }
}

