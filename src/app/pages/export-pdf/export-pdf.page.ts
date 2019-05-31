import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { FileSystems, PdfService, Commons, NavControllerService, ConvertFileService } from 'src/app/services';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { PdfListModel } from 'src/models/pdf-list-models';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { Platform, PopoverController, AlertController } from '@ionic/angular';
import { CustomeAlertDialogPage } from './custome-alert-dialog/custome-alert-dialog.page';
import { Api } from 'src/app/providers';
import { FileListModel } from 'src/models/filelist-models';
@Component({
  selector: 'app-export-pdf',
  templateUrl: './export-pdf.page.html',
  styleUrls: ['./export-pdf.page.scss'],
})
export class ExportPDFPage implements OnInit {

  readonly URI = "uri"; // content://;
  readonly PATH = "path"; // file:///storage/

  pdfListFile: Array<any> = [];
  PdfListModel: any;
  onWorkingPdfFile: any;
  //  = {
  //   size: null,
  //   path: null,
  //   name: null,
  //   date: new Date().getDay() + "/" + new Date().getMonth()
  //     + "/" + new Date().getFullYear(),
  //   isCreate: true,
  //   isError: false
  // };
  isExport: boolean = false;

  constructor(
    public translate: TranslateService,
    private fileSystems: FileSystems,
    private pdfService: PdfService,
    private androidPermissions: AndroidPermissions,
    private fileOpener: FileOpener,
    private common: Commons,
    private platform: Platform,
    public popoverController: PopoverController,
    private navCtrl: NavControllerService,
    private api: Api,
    private convert: ConvertFileService,
    public alertCtrl: AlertController,
  ) {
    this.initData();
  }


  ngOnInit() {
    let uri = this.navCtrl.get("convert_uri");
    if (uri) {
      console.log(uri);
      this.checkFileType(uri);
    }
    // this.convert.convertPrivateTofile("dsadsassadvasdadsasdas/private/var/mobile/Containers/Data/Application/595443B8-54D8-4CE2-9A16-2141D8F1B5D1/tmp/com.ts24corp.TS24ProViewer-Inbox/01GTKT0001PM18E_0304859192_0000081.xml")
  }

  /**
   * Lấy danh sách file pdf đã tạo
   */
  initData() {
    this.pdfListFile = PdfListModel.getInstance().fileList;
  }
  /**
   * Mở file pdf
   * @param filEntry Thông tin file 
   */
  onOpenConvertFile(filEntry) {
    console.log(filEntry);
    if (!filEntry.isError) {
      this.fileOpener.open(filEntry.path, this.fileSystems._converttoFileMIMEType("pdf"))
        .then((any) => {
          console.log(any);
        })
        .catch((err) => {
          console.log(err);
          this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.OPEN_FILE_ERROR"))
        });
    } else {
      this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.OPEN_FILE_ERROR"))
    }
  }

  // onSharePdf(item) {

  // }

  /**
   * Xóa file pdf khỏi danh sách 
   * @param item file pdf
   */
  onDeletePdf(item) {
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
      this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.EXPORT_WAIT"))
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
    let index = PdfListModel.getInstance().isExistUri(uri);
    if (index < 0) {
      let result: any = await this.fileSystems.GetFileInfo(uri);
      this.onWorkingPdfFile = result;
      this.onWorkingPdfFile.orginal_path = result.path;
      this.onWorkingPdfFile.isCreate = true;
      this.onWorkingPdfFile.isError = false;
      this.addFile(this.onWorkingPdfFile);
      let fileType = uri.substring(uri.lastIndexOf(".") + 1);
      switch (fileType) {
        case "xml":
          this.createPdfFromXml(uri);
          break;
        case "png":
        case "jpg":
        case "html":
          this.createPdf(this.URI, uri);
          break;
        default:
          this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.EXPORT_NO_SUPPORT"))
          break;
      }
    } else {
      this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.DUPLICATE_COVERT"))
    }
  }

  /**
   * Tạo file pdf tử uri
   * @param uri 
   */
  private async createPdf(from, uri) {
    switch (from) {
      case this.URI:
        this.pdfService.createPdfFromHtmlFileUri(uri,
          (folderpath, filename) => {
            this.onStart(folderpath, filename);
          },
          (filEntry) => {
            this.onSuccess(filEntry)
          }, (type, err) => {
            this.onError(type, err);
          });
        break
      case this.PATH: {
        let name = this.common.getFileNameFromPath(uri);
        name = name.substring(0, name.lastIndexOf(".")) + '.pdf';
        this.pdfService.createPdfFromHtmlFilePath(uri, name,
          (folderpath, filename) => {
            this.onStart(folderpath, filename);
          },
          (filEntry) => {
            this.onSuccess(filEntry)
          }, (type, err) => {
            this.onError(type, err);
          });
      }
        break;
    }

  }

  private onStart(folderpath, filename) {
    this.isExport = true;
  }

  /**
   * Xử lí khi tạo thành công
   * @param filEntry 
   */
  private async onSuccess(filEntry) {
    console.log(filEntry);
    PdfListModel.getInstance().removeFile(this.onWorkingPdfFile);
    let result: any = await this.fileSystems.GetFileInfo(filEntry.nativeURL);
    this.onWorkingPdfFile.name = result.name;
    this.onWorkingPdfFile.date = result.date;
    this.onWorkingPdfFile.path = result.path;
    this.onWorkingPdfFile.size = result.size;
    this.onWorkingPdfFile.isCreate = false;
    this.onWorkingPdfFile.isError = false;

    this.addFile(this.onWorkingPdfFile);
    this.isExport = false;
    this.navCtrl.remove();
  }

  /**
   * Xử lí khi xử lí lỗi
   * @param type 
   * @param err 
   */
  private onError(type, err) {
    console.log(err);
    switch (type) {
      case this.pdfService.FILE_SAVE_ERROR:
        break;

      default:
        console.log(err)
        break;
    }
    PdfListModel.getInstance().removeFile(this.onWorkingPdfFile);
    this.onWorkingPdfFile.isCreate = false;
    this.onWorkingPdfFile.isError = true;
    this.addFile(this.onWorkingPdfFile)

    this.isExport = false;
    this.navCtrl.remove();
  }

  private async createPdfFromXml(uri: string) {
    console.log(uri);
    let file = await this.fileSystems.convertUriToFileSystemUrl(uri);
    console.log(file)
    if (file) {
      let path = file.nativeURL;
      if (this.platform.is('android')) {
        path = await this.fileSystems._convertFilePathAndroid(path);
        path = this.convert.getAndroidSdcardPath(path, file.nativeURLl);
      }
      // if (this.platform.is('ios')) {
      //   path = this.convert.changeIOSFilePath(uri);
      // }
      let url = await this.api.ConvertXMLtoHTML(path)
      console.log(uri);
      this.createPdf(this.PATH, url);
    }
  }

  private addFile(fileInfo) {
    PdfListModel.getInstance().addFile(fileInfo, true);
    this.initData();
  }

  /**
   * Xóa file
   * @param fileUri 
   */
  private deleteFile(fileUri) {
    this.fileSystems.RemoveFile(fileUri).then(rs => {
      if (rs) {
        this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.ERROR_DELETE_SUCCESS"))
      } else {
        this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.ERROR_DELETE_ERROR"))
      }
    })
  }

  /**
   * Hiện hộp thoại xóa.
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
          PdfListModel.getInstance().removeFile(item, true);
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
            PdfListModel.getInstance().removeFile(file, true);
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
