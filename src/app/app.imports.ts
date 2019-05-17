import { HttpClientModule, HttpClient } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { IonicModule } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { IonicStorageModule } from '@ionic/storage';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { Api } from './providers';
import { Commons, NavControllerService, MenuService, FileSystems } from './services';
import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { FileTransfer } from '@ionic-native/file-transfer/ngx';
import { File } from '@ionic-native/file/ngx';
import { FileChooser } from '@ionic-native/file-chooser/ngx';
import { PdfService } from './services/pdf-service';
import { HTTP } from '@ionic-native/http/ngx';
import { FilePath } from '@ionic-native/file-path/ngx';
import { OpenWithService } from './services/open-with-service';
export function createTranslateLoader(http: HttpClient) {
    return new TranslateHttpLoader(http, './assets/lang/', '.json');
}
export const MODULES = [
    BrowserModule,
    HttpClientModule,
    IonicModule.forRoot(),
    IonicStorageModule.forRoot(),
    TranslateModule.forRoot({
        loader: {
            provide: TranslateLoader,
            useFactory: (createTranslateLoader),
            deps: [HttpClient]
        }
    }),
];


export const PROVIDERS = [
    Api,
    Commons,
    NavControllerService,
    MenuService,
    FileSystems,
    // Ionic native specific providers
    StatusBar,
    SplashScreen,
    InAppBrowser,
    AndroidPermissions,
    File,
    FileTransfer,
    FileChooser,
    HTTP,
    PdfService,
    FilePath,
    OpenWithService
];