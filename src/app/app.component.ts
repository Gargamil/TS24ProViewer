import { Component } from '@angular/core';

import { Platform, Config } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { TranslateService } from '@ngx-translate/core';
import { MenuService, OpenWithService, FileSystems } from './services';
import { FileListModel } from 'src/models/filelist-models';

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
    private fileSystems: FileSystems
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
      this.openWith.setupOpenwith((intent) => {
        this.handleIntent(intent)
      });
      this.statusBar.styleDefault();
      this.splashScreen.hide();
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
        let result: any = await this.fileSystems.GetFileInfo(intent.items[0].uri);
        console.log(result);
        FileListModel.getInstance().addFile(result);
        FileListModel.getInstance().saveLocal();
      }
    }
  }
}
