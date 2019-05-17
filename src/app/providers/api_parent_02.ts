import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons } from '../services';
import { Api_Parent_01, TS24PRO_PROGRAM } from './api_parent_01';
import { Api } from './api';
import { HTTP } from '@ionic-native/http/ngx';
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api_Parent_02 extends Api_Parent_01 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons,
        protected httpNavite: HTTP
        // private api: Api
    ) {
        super(http, Common, httpNavite);
    }
    //begin-hieu
    CombineXML(xml, element) {

    }
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
                if (xml.getElementsByTagName('inv:userDefines')[0]) {
                    let name: any;
                    let start: any;
                    let end: any;
                    let stringText = xml.getElementsByTagName('inv:userDefines')[0].childNodes[0].nodeValue;
                    start = stringText.indexOf('<inv:MauIn>');
                    if (start != -1) {
                        start = start + 11;
                        end = stringText.indexOf('</inv:MauIn>');
                    }
                    else {
                        start = stringText.indexOf('<MauIn>') + 5;
                        end = stringText.indexOf('<MauIn>');
                    }
                    name = stringText.substring(start, end)
                    return name
                }
                else return null
            default: return null
        }
    }

    CheckXML(xml) {
        if (xml.getElementsByTagName('HSoThueDTu')[0])
            return TS24PRO_PROGRAM.THUE
        else if (xml.getElementsByTagName('inv:transaction')[0])
            return TS24PRO_PROGRAM.INVOICE
        else return TS24PRO_PROGRAM.BHXH
    }
    /**
     * 
     * @param xml file xml 
     * @param xsl file xsl
     */
    transformXml(xml, xsl) {
        var xsltProcessor;
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        return xsltProcessor.transformToFragment(xml, document);
    }
    /**
     * 
     * @param element element Node name
     * @param xml file xml
     * @param xsl file xsl
     */
    ViewHTML(element, xml, xsl) {
        let content = this.transformXml(xml, xsl);
        console.log(content);
        element.nativeElement.appendChild(content);
    }
    /**
     * 
     * @param xml file
     * @param type type
     */
    DeleteAtribute(type, xml) {
        switch (type) {
            case TS24PRO_PROGRAM.THUE:
                if (xml.getElementsByTagName('HSoThueDTu')[0].namespaceURI) {
                    var x, i, attnode, old_att;
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
                if (xml.getElementsByTagName("inv:resend")[0]) {
                    x = xml.getElementsByTagName("inv:resend")[0];
                    x.parentNode.removeChild(x);
                }
                return xml;
            default:
                return xml;
        }
    }
}
