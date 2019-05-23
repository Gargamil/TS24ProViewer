import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { FileSystems, PdfService, Commons } from 'src/app/services';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { PdfListModel } from 'src/models/pdf-list-models';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { Platform } from '@ionic/angular';
@Component({
  selector: 'app-export-pdf',
  templateUrl: './export-pdf.page.html',
  styleUrls: ['./export-pdf.page.scss'],
})
export class ExportPDFPage implements OnInit {

  pdfListFile: Array<any> = [];
  PdfListModel: any;

  constructor(
    public translate: TranslateService,
    private fileSystems: FileSystems,
    private pdfService: PdfService,
    private androidPermissions: AndroidPermissions,
    private fileOpener: FileOpener,
    private common: Commons,
    private platform: Platform,
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
    this.fileOpener.open(filEntry.path, this.fileSystems._converttoFileMIMEType("pdf"))
      .then((any) => {
        console.log(any);
      })
      .catch((err) => {
        console.log(err);
        this.common.toast.show(this.translate.instant("EXPORTPDF_PAGE.OPEN_FILE_ERROR"))
      });
  }

  // onSharePdf(item) {

  // }

  /**
   * Xóa file pdf khỏi danh sách 
   * @param item file pdf
   */
  onDeletePdf(item) {
    this.common.dialog.confirm(this.translate.instant("EXPORTPDF_PAGE.DELETE_MGS"), () => {
      PdfListModel.getInstance().removeFile(item);
      PdfListModel.getInstance().saveLocal();
      this.initData();
    })
  }

  /**
   * Mở hộp thoại chọn file
   */
  onOpenFile() {
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
  }

  /**
   * Mở chọn file
   */
  private openFile() {
    if (this.platform.is('android')) {
      this.fileSystems.openFileAndroid("html").then((uri) => {
        this.createPdf(uri);
      });
    }
    if (this.platform.is('ios')) {
      this.fileSystems.openFileIOS("html").then((uri) => {
        this.createPdf(uri);
      });
    }
  }

  /**
   * Tạo file pdf tử uri
   * @param uri 
   */
  private createPdf(uri) {
    console.log(uri);
    this.common.loadPanel.show();
    this.pdfService.createPdfFromHtmlFileUri(uri,
      (filEntry) => {
        this.onSuccess(filEntry)
      }, (type, err) => {
        this.onError(type, err);
      });
  }

  /**
   * Xử lí khi tạo thành công
   * @param filEntry 
   */
  private async onSuccess(filEntry) {
    // console.log(filEntry);
    let result: any = await this.fileSystems.GetFileInfo(filEntry.nativeURL);
    PdfListModel.getInstance().addFile(result);
    PdfListModel.getInstance().saveLocal();
    this.initData();
    this.common.loadPanel.hide();
  }

  /**
   * Xử lí khi xử lí lỗi
   * @param type 
   * @param err 
   */
  private onError(type, err) {
    switch (type) {
      case this.pdfService.FILE_SAVE_ERROR:
        break;

      default:
        console.log(err)
        break;
    }
    console.log(err);
    this.common.loadPanel.hide();
  }
}
