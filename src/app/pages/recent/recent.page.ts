import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { RecentModel } from 'src/models/recent-model';
import { FileSystems, Commons } from 'src/app/services';
import { Api } from 'src/app/providers';
import { Platform, IonItemSliding, AlertController, PopoverController } from '@ionic/angular';
import { File } from '@ionic-native/file/ngx';
import { TranslateService } from '@ngx-translate/core';
import { PopoverPage } from './popover/popover.page';
import { FileListModel } from 'src/models/filelist-models';
@Component({
    selector: 'app-recent',
    templateUrl: './recent.page.html',
    styleUrls: ['./recent.page.scss'],
})
export class RecentPage implements OnInit {
    RecentFiles: any = [];
    listFilter: any = [];
    RecentFiles_temp: any = [];
    constructor(
        public fileSystem: FileSystems,
        public common: Commons,
        public api: Api,
        private cd: ChangeDetectorRef,
        public platform: Platform,
        public translate: TranslateService,
        public alertCtrl: AlertController,
        public popoverController: PopoverController
    ) { }

    ngOnInit() {
        this.listFilter.push('Tất cả');
        this.RecentFiles = RecentModel.getInstance().fileList;
        this.RecentFiles.forEach(ele => {
            ele.open = true
            this.listFilter.push(ele.key.name);
        });
        this.RecentFiles_temp = this.RecentFiles;
        console.log(this.listFilter)
        console.log(this.RecentFiles);
    }
    Group_OnClick(group) {
        if (group.open)
            group.open = false
        else group.open = true
    }
    private _timer: any;
    async File_OnClick(item) {
        clearTimeout(this._timer);
        this._timer = setTimeout(async () => {
            //trường hợp combine thành công, check file còn tồn tại trong hệ thống, nếu còn thì lấy và hiện ra
            //đổi đuôi tên file để lưu vào bộ nhớ máy
            let nameHTML = item.name.substring(0, item.name.length - 3) + 'html';
            let directory = this.fileSystem.PATH_IOS_DIRECTORY();
            if (this.platform.is('android'))
                directory = this.fileSystem.PATH_ANDROID_DIRECTORY();
            let dirName = this.api.getKeyTS24PRO_PROGRAM(item.type);
            //kiểm tra file đã tồn tại trong hệ thống hay chưa, nếu có thì lấy file từ hệ thống để xem...
            let fileExist: any = await this.fileSystem.checkFileExist(directory + dirName, nameHTML)
            if (fileExist)
                this.fileSystem.viewHTMLFile(item.uri, () => {
                    this.api.shareFileHTML(item.uri)
                });
            //trường hợp ko còn file trong hệ thống, kiểm tra file gốc còn tồn tại hay không.
            else {
                //lấy filepath từ path
                let filepath = item.path;
                if (this.platform.is("android")) {
                    filepath = await this.fileSystem._convertFilePathAndroid(item.path);
                    if (filepath.includes('sdcard')) {
                        let fileName_Origin = this.common.getFileNameFromPath(item.path);
                        fileName_Origin = decodeURIComponent(fileName_Origin);
                        filepath = this.fileSystem.convertFileSerVice.getAndroidSdcardPathFromFileName(filepath, fileName_Origin);
                    }
                    var pos = filepath.lastIndexOf("/");
                }
                fileExist = await this.fileSystem.checkFileExist(filepath.substring(0, pos), filepath.substring(pos + 1, filepath.length))
                //nếu tồn tại thì xem file gốc dưới dạng xml
                if (fileExist)
                    this.fileSystem.viewHTMLFile(filepath, () => {
                        this.api.shareFileHTML(filepath)
                    });
                //không tồn tại, hiện thông báo file không tồn tại,alert xóa file
                else {
                    //this.common.toast.show(this.translate.instant('RECENT_PAGE.NOT_FOUND'));
                    this.ShowAlert(item, null, this.translate.instant("RECENT_PAGE.NOT_FOUND") + this.translate.instant("HOME_PAGE.DELETE_NOTIFICATION"));
                }
            }
        }, 300);
    }
    DeleteFile_OnClick(item, e: Event, slidingItem: IonItemSliding) {
        e.stopPropagation();
        console.log(e);
        this.ShowAlert(item, slidingItem, this.translate.instant("HOME_PAGE.DELETE_NOTIFICATION"));
    }
    async ShowAlert(file, slidingItem?: any, contentalert?: string) {
        // let slidingItem: IonItemSliding;
        let prompt = await this.alertCtrl.create({
            header: this.translate.instant("HOME_PAGE.CONFIRM"),
            message: contentalert,
            buttons: [
                {
                    text: this.translate.instant("HOME_PAGE.NO"),
                    handler: data => {
                        console.log("cancel clicked");
                        if (slidingItem) slidingItem.close();
                    }
                },
                {
                    text: this.translate.instant("HOME_PAGE.YES"),
                    handler: async data => {
                        console.log("Xóa clicked");
                        // if (data.length > 0) {
                        //     let rs: any = await this.fileSystem.RemoveFile(file.path);
                        //     if (rs == false)
                        //         this.common.toast.show(this.translate.instant("HOME_PAGE.ERR_DEL_FILE"))
                        //     console.log('ket qua xóa file', rs);
                        // }
                        let recentModel = RecentModel.getInstance();
                        recentModel.removeFile(file);
                        recentModel.saveLocal();
                        this.RecentFiles = recentModel.fileList;
                        //this.RecentFiles_temp = this.RecentFiles;
                        this.cd.detectChanges();
                        FileListModel.getInstance().removeFile(file);
                        FileListModel.getInstance().saveLocal();
                    }
                }]
        });
        prompt.present();
    }
    async ShareFile_OnClick(item, e: Event, slidingItem: IonItemSliding) {
        e.stopPropagation();
        clearTimeout(this._timer);
        this._timer = setTimeout(async () => {
            //đổi đuôi tên file để lưu vào bộ nhớ máy
            let nameHTML = item.name.substring(0, item.name.length - 3) + 'html';
            let directory = this.fileSystem.PATH_IOS_DIRECTORY;
            if (this.platform.is('android'))
                directory = this.fileSystem.PATH_ANDROID_DIRECTORY;
            let dirName = this.api.getKeyTS24PRO_PROGRAM(item.type);
            //kiểm tra file đã tồn tại trong hệ thống hay chưa, nếu có thì lấy file từ hệ thống để xem...
            let fileExist: any = await this.fileSystem.checkFileExist(directory + dirName, nameHTML)
            if (fileExist)
                this.api.shareFileHTML(item.uri)
            else {
                //this.common.toast.show(this.translate.instant('RECENT_PAGE.NOT_FOUND'));
                this.ShowAlert(item, null, this.translate.instant("RECENT_PAGE.NOT_FOUND") + this.translate.instant("HOME_PAGE.DELETE_NOTIFICATION"))
            }
            slidingItem.close();
        }, 300)
    }
    GetHTML(content) {
        let docFrag = document.createDocumentFragment();
        docFrag.appendChild(content);
        let doc = document.createElement("div");
        doc.appendChild(docFrag.cloneNode(true));
        return doc
    }
    async Filter_Onclick(ev) {
        const pop = await this.popoverController.create({
            component: PopoverPage,
            event: ev,
            componentProps: {
                listItem: this.listFilter,
            },
        });
        pop.onDidDismiss().then(result => {
            if (result.data) {
                if (result.data.trim().toLowerCase() === 'tất cả') {
                    this.RecentFiles = RecentModel.getInstance().fileList;
                }
                else {
                    this.RecentFiles = [];
                    RecentModel.getInstance().fileList.forEach(ele => {
                        if (ele.key.name === result.data) {
                            this.RecentFiles.push(ele);
                            return 0
                        }
                    });
                }
            }
        })
        return await pop.present();
    }
}
