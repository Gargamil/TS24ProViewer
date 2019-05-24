import { Component } from '@angular/core';

import { Platform, Config } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { TranslateService } from '@ngx-translate/core';
import { MenuService, OpenWithService } from './services';

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
    private openWith : OpenWithService
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
      this.openWith.setupOpenwith(this.handleIntent)
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

  private handleIntent(intent){
    console.log(intent)
  }
}
