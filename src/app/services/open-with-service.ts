import { Injectable } from '@angular/core';
import { Platform } from '@ionic/angular';

declare var window: any;

@Injectable()
export class OpenWithService {

    constructor(
        public platform: Platform
    ) { }
    setupOpenwith(handelItent) {

        // Increase verbosity if you need more logs
        //cordova.window.plugins.openwith.setVerbosity(cordova.window.plugins.openwith.DEBUG);
    
        // Initialize the plugin
    
        window.plugins.openwith.init(initSuccess, initError);
    
        function initSuccess() { 
            alert("true initsss");
            console.log('init success!'); }
        function initError(err) { console.log('init failed: ' + err); }
    
        // Define your file handler
        window.plugins.openwith.addHandler(handelItents);
    
        function handelItents(intent) {
            alert("ok");
          console.log('intent received', JSON.stringify(intent));
          // this.itent = JSON.stringify(intent);
          console.log('  action: ' + intent.action); // type of action requested by the user
          console.log('  exit: ' + intent.exit); // if true, you should exit the app after processing
    
          for (var i = 0; i < intent.items.length; ++i) {
            var item = intent.items[i];
            console.log('  type: ', item.type);   // mime type
            console.log('  uri:  ', item.uri);     // uri to the file, probably NOT a web uri
    
            // some optional additional info
            console.log('  text: ', item.text);   // text to share alongside the item, iOS only
            console.log('  name: ', item.name);   // suggested name of the image, iOS 11+ only
            console.log('  utis: ', item.utis);
            console.log('  path: ', item.path);   // path on the device, generally undefined
          }
    
          if (intent.items.length > 0) {
            window.plugins.openwith.load(intent.items[0], function (data, item) {
    
              // data is a long base64 string with the content of the file
              console.log("the item weights " + data.length + " bytes");
    
              // "exit" when done.
              // Note that there is no need to wait for the upload to finish,
              // the app can continue while in background.
              if (intent.exit) { window.plugins.openwith.exit(); }
            });
          }
          else {
            if (intent.exit) { window.plugins.openwith.exit(); }
          }
        }
      }
}