import { Component, ViewChild, ElementRef, ChangeDetectorRef } from '@angular/core';
import { Api } from 'src/app/providers';
import { ModalController, ActionSheetController, Platform, AlertController, IonItemSliding } from '@ionic/angular';
import { FileSystems, Commons } from 'src/app/services';
import { File } from '@ionic-native/file/ngx';
import { FileListModel } from 'src/models/filelist-models';
import { RecentModel } from 'src/models/recent-model';
@Component({
    selector: 'app-home',
    templateUrl: 'home.page.html',
    styleUrls: ['home.page.scss'],
})
export class HomePage {
    @ViewChild('html') html: ElementRef;
    xml: any;
    xsl: any;
    type: any;
    pageDemo: any = null;
    FileListModel: any;
    mytime: any = 0;
    FileList: any = [];
    constructor(
        public api: Api,
        public modalController: ModalController,
        public actionSheetController: ActionSheetController,
        public fileSystems: FileSystems,
        public file: File,
        public platform: Platform,
        public common: Commons,
        public alertCtrl: AlertController,
        private cd: ChangeDetectorRef,
    ) {
        //this.CombineXML();
        this.FileList = FileListModel.getInstance().fileList;
    }
    ngOnInit() {
        //this.Init();
        // this.OpenFile();
        this.api.getINFOCKSHDDT("MIIE6zCCA9OgAwIBAgIQVAEBCExAkq7CtXeh85iC4TANBgkqhkiG9w0BAQUFADBXMQswCQYDVQQGEwJWTjEkMCIGA1UEChMbU0FGRS1DQSBKb2ludCBTdG9jayBDb21wYW55MRAwDgYDVQQLEwdTQUZFLUNBMRAwDgYDVQQDEwdTQUZFLUNBMB4XDTE4MDYyNzA0MDczM1oXDTE5MDYyNzE2NTkwMFowgdsxIDAeBgkqhkiG9w0BCQEWEWhvdHJvQHRzMjQuY29tLnZuMS8wLQYDVQQDDCZDw5RORyBUWSBD4buUIFBI4bqmTiBUUzI0IChURVNUIENMT1VEKTEbMBkGA1UECgwSTVNUOjAzMDk0NzgzMDYtOTk5MVwwWgYDVQQHDFMyODUvOTRCIEPDoWNoIG3huqFuZyB0aMOhbmcgOCwgUGjGsOG7nW5nIDEyLCBRdeG6rW4gMTAsIFRow6BuaCBQaOG7kSBI4buTIENow60gTWluaDELMAkGA1UEBhMCVk4wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAOTdO0qaQrLreHmuj4V7C0SwQ7WWeqwrEuMOWR9wCSMP0yQRFH6izDMBsbh/2wlGj9i/Lj8SsnZx25/xYw69VSdRqiWOvXl6VhWlgYujJWacNE9tFGcNeJs+Bfie7Df/PUmE+LxXD4/uhwbq02SHzEGevdHN9sIfZA9UjJyiLO9nAgMBAAGjggGwMIIBrDCBtQYIKwYBBQUHAQEEgagwgaUwNwYIKwYBBQUHMAKGK2h0dHA6Ly9wdWJsaWMucm9vdGNhLmdvdi52bi9jcnQvbWljbnJjYS5jcnQwQAYIKwYBBQUHMAKGNGh0dHA6Ly93d3cuc2FmZWNlcnQuY29tLnZuL3d3dy9jZXJ0L1NBRkUtQ0EtMjAxNy5jZXIwKAYIKwYBBQUHMAGGHGh0dHA6Ly9vY3NwMS5zYWZlY2VydC5jb20udm4wHQYDVR0OBBYEFI/u3s/SQBRRuzz/JKOFevpBQlfrMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU9A0UeMBITNk62psaTV+Odws2i+QwRwYDVR0gBEAwPjA8BghghUADAQIDBDAwMC4GCCsGAQUFBwIBFiJodHRwOi8vd3d3LnNhZmVjZXJ0LmNvbS52bi93d3cvcnBhMCwGA1UdHwQlMCMwIaAfoB2GG2h0dHA6Ly9jcmwxLnNhZmVjZXJ0LmNvbS52bjAOBgNVHQ8BAf8EBAMCBPAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMA0GCSqGSIb3DQEBBQUAA4IBAQAYUmXR+gOiZ2B+0Ll9s56erUv3QWImYBd1S6jkUyrA+JSMUJn5X7bn8j0YFlI1Zf58gNMdUkMCH1u4GA4C+WEjyHRtLc2f5hwAazubzHJVTStYvYTH+PGQEF4gkvsIqoJetM5VewLUs182BaI/yu9mb53/nZ+JE+umBTmSV/8sBh8yzW0yrg7K5xUpVpT+3iivLG76prdtNCKdV6k/ShjGnqWTWoVBxywXEpr+db9afx+5zsKYF/UaqcFGf8XPnZxCVoG3d4d3m1kVH5jWJdPG3qDPDZjEYBsH1rzD9RpnILO6YX/ryi1YN2QN0vvoUSAytFd3SVppWkaGQfKAmeUk")
            .then(res => console.log(res));
    }
    async Init() {
        let xml = this.api.loadXml('../../../assets/file/thue.xml');
        let type = this.api.CheckXML(xml);
        let xml2 = await this.api.GetCKS(type, xml);
        console.log(xml2)
        // xml = this.api.DeleteAtribute(type, xml);
        // let id = this.api.GetIdXML(type, xml);
        // let link = await this.api.getFilePathXSL(type, id);
        // console.log(link);
        // //let xsl = await this.fileSystems.loadXMLNative(link);
        // let xsl = this.api.loadXml(link);
        // let content = await this.api.ConvertHTML(xml, xsl);
        // this.html.nativeElement.appendChild(content);


    }
    DeleteFile_OnClick(item, e: Event, slidingItem: IonItemSliding) {
        e.stopPropagation();
        console.log(e);
        this.ShowAlert(item, slidingItem);
    }
    private _timer: any;
    File_OnClick(item) {
        clearTimeout(this._timer);
        this._timer = setTimeout(() => {
            this.ViewHTML(item);
        }, 300);

    }
    async OpenFile() {
        let filepath: any;
        if (this.platform.is('android'))
            filepath = await this.fileSystems.openFileAndroid('xml');
        if (this.platform.is('ios'))
            filepath = await this.fileSystems.openFileIOS('xml');
        this.common.loadPanel.show('Đang tải file');
        console.log('filepath', filepath);
        let result: any = await this.fileSystems.GetFileInfo(filepath);
        let FileModel = FileListModel.getInstance();
        FileModel.addFile(result);
        FileModel.saveLocal();
        console.log(FileModel.fileList);
        this.FileList = FileModel.fileList;
        this.cd.detectChanges();
        this.common.loadPanel.hide();
    }
    async OpenSheet() {
        const actionSheet = await this.actionSheetController.create({
            // header: 'Albums',
            buttons: [{
                text: 'Mở File ',
                // role: 'destructive',
                icon: 'folder',
                handler: () => {
                    this.OpenFile();
                }
            }, {
                text: 'Cancel',
                icon: 'close',
                role: 'cancel',
                handler: () => {
                    console.log('Cancel clicked');
                }
            }]
        });
        await actionSheet.present();
    }
    /**
     * hiện thông báo xóa file,nếu đồng ý: xóa file và cập nhật lại local storage
     * @param item 
     */
    async ShowAlert(file, slidingItem) {
        // let slidingItem: IonItemSliding;
        let prompt = await this.alertCtrl.create({
            header: 'Xác nhận',
            message: 'bạn có muốn xóa file này không ??? ',
            inputs: [
                {
                    type: 'checkbox',
                    label: 'Xóa cả file gốc',
                    value: 'deleteAll',
                    checked: false
                }],
            buttons: [
                {
                    text: "Hủy",
                    handler: data => {
                        console.log("cancel clicked");
                        slidingItem.close();
                    }
                },
                {
                    text: "Xóa",
                    handler: async data => {
                        console.log("Xóa clicked");
                        if (data.length > 0) {
                            let rs: any = await this.fileSystems.RemoveFile(file.path);
                            if (rs == false)
                                this.common.toast.show('Có lỗi khi xóa file gốc, vui lòng thử lại sau!!!')
                            console.log('ket qua xóa file', rs);
                        }
                        let FileModel = FileListModel.getInstance();
                        FileModel.removeFile(file);
                        FileModel.saveLocal();
                        this.FileList = FileModel.fileList;
                        this.cd.detectChanges();
                    }
                }]
        });
        prompt.present();
    }
    async AlertViewXML(path) {
        let prompt = await this.alertCtrl.create({
            header: 'Thông báo',
            message: 'TS24ProViewer không hỗ trợ xem file này, bạn có muốn xem tiếp không ? ',
            buttons: [
                {
                    text: "Không",
                    handler: data => {
                        console.log("cancel clicked");
                    }
                },
                {
                    text: "Có",
                    handler: data => {
                        this.fileSystems.viewHTMLFile(path);
                    }
                }]
        });
        prompt.present();
    }
    async ViewHTML(item) {
        let path = item.path;
        let name = item.name;
        this.common.loadPanel.show('Đang tải file, vui lòng chờ...');
        //đổi đuôi tên file để lưu vào bộ nhớ máy
        let nameHTML = name.substring(0, name.length - 3) + 'html';
        //đọc file xml từ path 
        let xml = await this.fileSystems.GetDocXMLFromDevice(path);
        //lấy loại file (thuế, bảo hiểm hoặc hóa đơn) từ file xml
        let type = this.api.CheckXML(xml);
        let directory = this.file.dataDirectory;
        if (this.platform.is('android'))
            directory = this.file.externalCacheDirectory;
        let dirName = this.api.getKeyTS24PRO_PROGRAM(type);
        this.common.loadPanel.show('Đã tải xong, đang xử lý...');
        // console.log(directory + dirName);
        //kiểm tra file đã tồn tại trong hệ thống hay chưa, nếu có thì lấy file từ hệ thống để xem...
        let fileExist: any = await this.fileSystems.checkFileExist(directory + dirName, nameHTML)
        if (fileExist) {
            console.log(directory + dirName + '/' + nameHTML);
            this.common.loadPanel.hide();
            this.fileSystems.viewHTMLFile(directory + dirName + '/' + nameHTML);
        }
        else {
            //nếu chưa tồn tại, đọc file xml để combine với xsl từ server
            // lấy chữ kí số
            this.common.loadPanel.show('Đang xử lý chữ kí số...');
            let xml2: any = await this.api.GetCKS(type, xml);
            console.log(xml2);
            let objCallback = await this.api.ViewHTML(path, xml2, type);
            if (objCallback.content == null) {
                //hiện thông báo có muốn xem file xml trong trường hợp combine lỗi hoặc file ko đúng
                this.AlertViewXML(path)
                this.common.loadPanel.hide();
            }
            else {
                //lưu file html vừa combine vào bộ nhớ máy
                let docFrag = document.createDocumentFragment();
                docFrag.appendChild(objCallback.content);
                let doc = document.createElement("div");
                doc.appendChild(docFrag.cloneNode(true));
                let uri = await this.fileSystems.writeFile(nameHTML, doc.innerHTML, this.api.getKeyTS24PRO_PROGRAM(type));
                // this.html.nativeElement.appendChild(content);
                this.common.loadPanel.hide();
                this.fileSystems.viewHTMLFile(uri);
            }
        }
        item.type = type;
        let RecentFile = RecentModel.getInstance()
        RecentFile.addFile(item);
        RecentFile.saveLocal();
        console.log(RecentFile.fileList);

        // this.mytime = 0;
    }
}
