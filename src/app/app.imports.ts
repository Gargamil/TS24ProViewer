import { HttpClientModule, HttpClient } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { IonicModule } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { IonicStorageModule } from '@ionic/storage';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { Api } from './providers';
import { Commons, NavControllerService, MenuService, FileSystems, PdfService, OpenWithService, ConvertFileService, ShareWithService } from './services';
import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { FileTransfer } from '@ionic-native/file-transfer/ngx';
import { File } from '@ionic-native/file/ngx';
import { FileChooser } from '@ionic-native/file-chooser/ngx';
import { HTTP } from '@ionic-native/http/ngx';
import { FilePath } from '@ionic-native/file-path/ngx';
import { IOSFilePicker } from '@ionic-native/file-picker/ngx';
import { DocumentViewer } from '@ionic-native/document-viewer/ngx';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { ThemeableBrowser } from '@ionic-native/themeable-browser/ngx';
import { SocialSharing } from '@ionic-native/social-sharing/ngx';
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
    //Service
    Api,
    Commons,
    NavControllerService,
    MenuService,
    FileSystems,
    PdfService,
    OpenWithService,
    ConvertFileService,
    ShareWithService,
    // Ionic native specific providers
    StatusBar,
    SplashScreen,
    InAppBrowser,
    AndroidPermissions,
    File,
    FileTransfer,
    FileChooser,
    HTTP,
    FilePath,
    IOSFilePicker,
    DocumentViewer,
    FileOpener,
    ThemeableBrowser,
    SocialSharing
];