import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { FileSystems, PdfService, Commons } from 'src/app/services';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { PdfListModel } from 'src/models/pdf-list-models';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { Platform, PopoverController } from '@ionic/angular';
import { CustomeAlertDialogPage } from './custome-alert-dialog/custome-alert-dialog.page';
@Component({
  selector: 'app-export-pdf',
  templateUrl: './export-pdf.page.html',
  styleUrls: ['./export-pdf.page.scss'],
})
export class ExportPDFPage implements OnInit {

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
    public popoverController: PopoverController
  ) {
    this.initData();
  }


  ngOnInit() {
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
    // this.common.dialog.confirm(this.translate.instant("EXPORTPDF_PAGE.DELETE_MGS"), () => {
    //   this.deleteFile(item.path);
    //   PdfListModel.getInstance().removeFile(item, true);
    //   this.initData();
    // });
    this.showDeleteDialog(null, item);
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
      let fileType = uri.substring(uri.lastIndexOf(".") + 1);
      switch (fileType) {
        case "xml":
          this.createPdfFromXml(uri);
          break;
        case "png":
        case "jpg":
        case "html":
          this.createPdf(uri);
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
  private async createPdf(uri) {
    let result: any = await this.fileSystems.GetFileInfo(uri);
    this.onWorkingPdfFile = result;
    this.onWorkingPdfFile.orginal_path = result.path;
    this.onWorkingPdfFile.isCreate = true;
    this.onWorkingPdfFile.isError = false;
    this.addFile(this.onWorkingPdfFile);

    this.pdfService.createPdfFromHtmlFileUri(uri,
      (folderpath, filename) => {
        this.onStart(folderpath, filename);
      },
      (filEntry) => {
        this.onSuccess(filEntry)
      }, (type, err) => {
        this.onError(type, err);
      });
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
    this.onWorkingPdfFile.date = result.date;
    this.onWorkingPdfFile.path = result.path;
    this.onWorkingPdfFile.isCreate = false;
    this.onWorkingPdfFile.isError = false;

    this.addFile(this.onWorkingPdfFile);
    this.isExport = false;
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
  }

  private createPdfFromXml(uri: string) {
    console.log(uri)
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
      componentProps: { isRate: true }
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
}
