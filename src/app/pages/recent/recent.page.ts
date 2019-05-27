import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { RecentModel } from 'src/models/recent-model';
import { FileSystems, Commons } from 'src/app/services';
import { Api } from 'src/app/providers';
import { Platform, IonItemSliding, AlertController } from '@ionic/angular';
import { File } from '@ionic-native/file/ngx';
import { TranslateService } from '@ngx-translate/core';
@Component({
    selector: 'app-recent',
    templateUrl: './recent.page.html',
    styleUrls: ['./recent.page.scss'],
})
export class RecentPage implements OnInit {
    RecentFiles: any = [];
    constructor(
        public fileSystem: FileSystems,
        public common: Commons,
        public api: Api,
        public file: File,
        private cd: ChangeDetectorRef,
        public platform: Platform,
        public translate: TranslateService,
        public alertCtrl: AlertController
    ) { }

    ngOnInit() {
        this.RecentFiles = RecentModel.getInstance().fileList;
        this.RecentFiles.forEach(ele => {
            ele.open = true
        });
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
            //đổi đuôi tên file để lưu vào bộ nhớ máy
            let nameHTML = item.name.substring(0, item.name.length - 3) + 'html';
            let directory = this.file.dataDirectory;
            if (this.platform.is('android'))
                directory = this.file.externalCacheDirectory;
            let dirName = this.api.getKeyTS24PRO_PROGRAM(item.type);
            //kiểm tra file đã tồn tại trong hệ thống hay chưa, nếu có thì lấy file từ hệ thống để xem...
            let fileExist: any = await this.fileSystem.checkFileExist(directory + dirName, nameHTML)
            if (fileExist)
                this.fileSystem.viewHTMLFile(item.uri, () => {
                    this.api.shareFileHTML(item.uri)
                });
            else {
                this.common.toast.show(this.translate.instant('RECENT_PAGE.NOT_FOUND'));
                this.ShowAlert(item)
            }
        }, 300);
    }
    DeleteFile_OnClick(item, e: Event, slidingItem: IonItemSliding) {
        e.stopPropagation();
        console.log(e);
        this.ShowAlert(item, slidingItem);
    }
    async ShowAlert(file, slidingItem?: any) {
        // let slidingItem: IonItemSliding;
        let prompt = await this.alertCtrl.create({
            header: this.translate.instant("HOME_PAGE.CONFIRM"),
            message: this.translate.instant("HOME_PAGE.DELETE_NOTIFICATION"),
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
                        this.cd.detectChanges();
                    }
                }]
        });
        prompt.present();
    }
}
