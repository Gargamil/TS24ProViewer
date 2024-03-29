import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ConvertFileService, FileSystems, Commons, NavControllerService } from 'src/app/services';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { Platform, PopoverController, AlertController } from '@ionic/angular';
import { ExcelListModel } from 'src/models/excel-list-models';
import { CustomeAlertDialogPage } from '../export-pdf/custome-alert-dialog/custome-alert-dialog.page';
import { Api } from 'src/app/providers';

@Component({
  selector: 'app-export-excel',
  templateUrl: './export-excel.page.html',
  styleUrls: ['./export-excel.page.scss'],
})
export class ExportExcelPage implements OnInit {
  readonly URI = "uri"; // content://;
  readonly PATH = "path"; // file:///storage/

  excelListFile: Array<any> = [];
  onWorkingExcelFile: any;
  isExport: boolean = false;

  constructor(
    public translate: TranslateService,
    private fileSystems: FileSystems,
    private excelService: ConvertFileService,
    private androidPermissions: AndroidPermissions,
    private fileOpener: FileOpener,
    private common: Commons,
    private platform: Platform,
    public popoverController: PopoverController,
    private navCtrl: NavControllerService,
    private api: Api,
    public alertCtrl: AlertController
  ) {
    this.initData();
  }


  ngOnInit() {
    let uri = this.navCtrl.get("convert_uri");
    if (uri) {
      console.log(uri);
      this.checkFileType(uri);
    }
  }

  /**
   * Lấy danh sách file excel đã tạo
   */
  initData() {
    this.excelListFile = ExcelListModel.getInstance().fileList;

  }
  /**
  * Mở file excel
  * @param filEntry Thông tin file 
  */
  onOpenConvertFile(filEntry) {
    console.log(filEntry);
    if (!filEntry.isError) {
      this.fileOpener.open(filEntry.path, this.fileSystems._converttoFileMIMEType("xls"))
        .then((any) => {
          console.log(any);
        })
        .catch((err) => {
          console.log(err);
          this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.OPEN_FILE_ERROR"))
        });
    } else {
      this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.OPEN_FILE_ERROR"))
    }
  }

  /**
   * Xóa file excel khỏi danh sách 
   * @param item file excel
   */
  onDeleteExcel(item) {
    // this.showDeleteDialog(null, item);
    this.showDeleteAlert(item);
  }

  /**
   * Mở hộp thoại chọn file
   */
  onOpenFile() {
    if (!this.isExport) {
      if (this.platform.is('android')) {
        // Kiểm tra android permission 
        this.androidPermissions.checkPermission(this.androidPermissions.PERMISSION.WRITE_EXTERNAL_STORAGE).then(
          (result) => {
            if (result.hasPermission) {
              this.openFile();
            }
            else {
              this.androidPermissions.requestPermissions([this.androidPermissions.PERMISSION.WRITE_EXTERNAL_STORAGE]);
            }
          },
          err => this.androidPermissions.requestPermission(this.androidPermissions.PERMISSION.WRITE_EXTERNAL_STORAGE)
        );
      } else {
        this.openFile();
      }
    } else {
      this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.EXPORT_WAIT"))
    }
  }

  /**
   * Mở chọn file
   */
  private openFile() {
    if (this.platform.is('android')) {
      this.fileSystems.openFileAndroid(null).then((uri) => {
        this.checkFileType(uri);
      });
    }
    if (this.platform.is('ios')) {
      this.fileSystems.openFileIOS(null).then((uri) => {
        this.checkFileType(uri);
      });
    }
  }

  /**
   * Kiểm tra định dãng file
   * @param uri 
   */
  private async checkFileType(uri) {
    console.log(uri);
    let index = ExcelListModel.getInstance().isExistUri(uri);
    if (index < 0) {
      let result: any = await this.fileSystems.GetFileInfo(uri);
      this.onWorkingExcelFile = result;
      this.onWorkingExcelFile.orginal_path = result.path;
      this.onWorkingExcelFile.isCreate = true;
      this.onWorkingExcelFile.isError = false;
      let fileType = uri.substring(uri.lastIndexOf(".") + 1);
      switch (fileType) {
        case "xml":
          this.createExcelromXml(uri);
          break;
        case "html":
          this.createExcel(this.URI, uri);
          break;
        default:
          this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.EXPORT_NO_SUPPORT"))
          break;
      }
    } else {
      this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.DUPLICATE_COVERT"))
    }
  }

  /**
   * Tạo file excel tử uri
   * @param uri 
   */
  private async createExcel(from, uri) {
    console.log(uri);
    this.addFile(this.onWorkingExcelFile);
    this.isExport = true;
    switch (from) {
      case this.URI:
        this.excelService.convertTableHtmlToExcelByUri(uri,
          (filEntry) => {
            this.onSuccess(filEntry)
          }, (type, err) => {
            this.onError(type, err);
          });
        break
      case this.PATH: {
        let name = uri.substring(uri.lastIndexOf("/") + 1, uri.length - 3) + 'pdf'
        this.excelService.convertTableHtmlToExcelByFilePath(uri, name,
          (filEntry) => {
            this.onSuccess(filEntry)
          }, (type, err) => {
            this.onError(type, err);
          });
      }
        break;
    }
  }

  /**
   * Xử lí khi tạo thành công
   * @param filEntry 
   */

  private async onSuccess(filEntry) {
    // console.log(filEntry);
    ExcelListModel.getInstance().removeFile(this.onWorkingExcelFile);
    let result: any = await this.fileSystems.GetFileInfo(filEntry.nativeURL);
    this.onWorkingExcelFile.name = result.name;
    this.onWorkingExcelFile.date = result.date;
    this.onWorkingExcelFile.path = result.path;
    this.onWorkingExcelFile.size = result.size;
    this.onWorkingExcelFile.isCreate = false;
    this.onWorkingExcelFile.isError = false;

    this.addFile(this.onWorkingExcelFile);
    this.isExport = false;
    this.navCtrl.remove();
  }

  /**
   * Xử lí khi xảy ra lỗi
   * @param type 
   * @param err 
   */
  private onError(type, err) {
    // console.log(err);
    switch (type) {
      case this.excelService.FILE_SAVE_ERROR:
        break;

      default:
        console.log(err)
        break;
    }
    ExcelListModel.getInstance().removeFile(this.onWorkingExcelFile);
    this.onWorkingExcelFile.isCreate = false;
    this.onWorkingExcelFile.isError = true;
    this.addFile(this.onWorkingExcelFile)

    this.isExport = false;
    this.navCtrl.remove();
  }

  private async createExcelromXml(uri) {
    console.log(uri);
    let file = await this.fileSystems.convertUriToFileSystemUrl(uri);
    console.log(file)
    if (file) {
      let path = file.nativeURL;
      if (this.platform.is('android')) {
        path = await this.fileSystems._convertFilePathAndroid(path);
        path = this.excelService.getAndroidSdcardPath(path, file.nativeURLl);
      }
      // if (this.platform.is('ios')) {
      //   path = this.excelService.convertPrivateTofile(uri);
      // }
      let url = await this.api.ConvertXMLtoHTML(path)
      console.log(uri);
      this.createExcel(this.PATH, url);
    }
  }
  /**
   * Thêm file vào danh sách excel
   * @param fileInfo 
   */
  private addFile(fileInfo) {
    ExcelListModel.getInstance().addFile(fileInfo, true);
    this.initData();
  }

  /**
   * Xóa file
   * @param fileUri 
   */
  private deleteFile(fileUri) {
    this.fileSystems.RemoveFile(fileUri).then(rs => {
      if (rs) {
        this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.ERROR_DELETE_SUCCESS"))
      } else {
        this.common.toast.show(this.translate.instant("EXPORTEXCEL_PAGE.ERROR_DELETE_ERROR"))
      }
    })
  }
  /**
   * Hiện hộp thoại xóa
   * @param ev 
   * @param item 
   */
  async showDeleteDialog(ev: Event, item) {
    const popover = await this.popoverController.create({
      component: CustomeAlertDialogPage,
      event: ev,
      componentProps: { type: "del" }
    });
    popover.onDidDismiss().then((result) => {
      if (result.data) {
        console.log(result.data)
        let rs = result.data;
        if (rs.del_confirm) {
          ExcelListModel.getInstance().removeFile(item, true);
          this.initData();
          if (rs.del_complete) {
            this.deleteFile(item.path);
          }
        }
      }
    });
    return await popover.present();
  }
  /**
     * hiện thông báo xóa file,nếu đồng ý: xóa file và cập nhật lại local storage
     * @param item 
     */
  async showDeleteAlert(file) {
    // let slidingItem: IonItemSliding;
    let prompt = await this.alertCtrl.create({
      header: this.translate.instant("EXPORTPDF_PAGE.TITLE_DIALOG"),
      message: this.translate.instant("EXPORTPDF_PAGE.DELETE_MGS"),
      inputs: [
        {
          type: 'checkbox',
          label: 'Xóa tập tin trong thư mục',
          value: 'deleteAll',
          checked: false
        }],
      buttons: [
        {
          text: this.translate.instant("CONFIRM.NO"),
          handler: data => {
            console.log("cancel clicked");
            console.log(data);
          }
        },
        {
          text: this.translate.instant("CONFIRM.YES"),
          handler: async data => {
            console.log("Xóa clicked");
            ExcelListModel.getInstance().removeFile(file, true);
            console.log(data);
            if (data) {
              this.deleteFile(file.path);
            }
          }
        }]
    });
    prompt.present();
  }
}
