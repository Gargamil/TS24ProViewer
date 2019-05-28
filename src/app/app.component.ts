import { Component } from '@angular/core';

import { Platform, Config, PopoverController } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { TranslateService } from '@ngx-translate/core';
import { MenuService, OpenWithService, FileSystems, NavControllerService, ConvertFileService } from './services';
import { FileListModel } from 'src/models/filelist-models';
import { CustomeAlertDialogPage } from './pages/export-pdf/custome-alert-dialog/custome-alert-dialog.page';
import { PdfListModel } from 'src/models/pdf-list-models';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html'
})
export class AppComponent {
  pages: any;
  activePage: any;
  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private translate: TranslateService,
    private menuService: MenuService,
    private config: Config,
    private openWith: OpenWithService,
    private fileSystems: FileSystems,
    private navCtrl: NavControllerService,
    public popoverController: PopoverController,
    private convert: ConvertFileService
  ) {
    this.initializeApp();
    this.initTranslate();
    this.loadMenu();
  }

  loadMenu(translate?: any) {
    translate = translate || this.translate;
    this.menuService.getTranslate(translate);
    this.menuService.getAllThemes((values) => { this.pages = values });
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
      this.openWith.setupOpenwith((intent) => {
        this.handleIntent(intent)
      });
    });
  }

  initTranslate() {
    let lang = null;
    if (localStorage.getItem("lang_key") != undefined || null) {
      lang = localStorage.getItem("lang_key");
    } else {
      lang = "vi"
    }
    this.translate.use(lang);
    this.translate.get(['BACK_BUTTON_TEXT']).subscribe(values => {
      this.config.set('backButtonText', values.BACK_BUTTON_TEXT);
    });
  }

  checkActive(page) {
    return page == this.activePage;
  }

  private async handleIntent(intent) {
    console.log(intent)
    if (intent) {
      if (intent.items && intent.items.length > 0) {

        this.fileTypeFlow(intent.items[0].uri);
      }
    }
  }

  /**
   * Chuyển hướng theo loại file
   * @param uri (file:///...)
   */
  private fileTypeFlow(uri: string) {
    let type = uri.substring(uri.lastIndexOf(".") + 1);
    console.log(uri);
    console.log(type)
    switch (type) {
      case "xml":
        this.saveFileToHome(uri);
        break;
      case "html":
        this.openConvertFileDialog(uri);
        break;
      case "pdf":
        this.viewPdf(uri)
        break;
      default:
        break;
    }
  }

  private async saveFileToHome(uri: string) {
    let result: any = await this.fileSystems.GetFileInfo(uri);
    if (result) {
      console.log(result);
      FileListModel.getInstance().addFile(result);
      FileListModel.getInstance().saveLocal();
    }
  }

  private openConvertFileDialog(uri: string) {
    this.showConvertDialog(null, uri);
  }

  private async viewPdf(uri) {
    let file = await this.fileSystems.convertUriToFileSystemUrl(uri);
    console.log(file)
    if (file) {
      let path = file.nativeURL;
      if (this.platform.is('android')) {
        path = await this.fileSystems._convertFilePathAndroid(path);
        path = this.convert.getAndroidSdcardPath(path, file.nativeURLl);
      }
      if (this.platform.is('ios')) {
        path = this.convert.convertPrivateTofile(path);
      }
      console.log(path);
      this.fileSystems.openFile(path, "pdf")
    } else {
      console.log("File null")
    }


  }

  private async showConvertDialog(ev: Event, uri: string) {
    const popover = await this.popoverController.create({
      component: CustomeAlertDialogPage,
      event: ev,
      componentProps: { type: "convert" }
    });
    popover.onDidDismiss().then((result) => {
      if (result.data) {
        console.log(result.data)
        let rs = result.data;
        switch (rs.conver_type) {
          case "pdf":
            this.navCtrl.push("export-pdf", { "convert_uri": uri });
            break;
          case "excel":
            this.navCtrl.push("export-excel", { "convert_uri": uri });
            break;
          default:
            break;
        }
      }
    });
    return await popover.present();
  }
}
