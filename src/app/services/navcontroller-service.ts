import { Injectable } from '@angular/core';
import { NavController } from '@ionic/angular';
@Injectable()
export class NavControllerService {
    data: any;
    constructor(public navCtrl: NavController) {
    }
    push(url: string, data: any = '') {
        this.data = data;
        this.navCtrl.navigateForward('/' + url);
    }

    setRoot(url: string, data: any = '') {
        this.data = data;
        this.navCtrl.navigateRoot('/' + url);
    }

    pop(url, data: any = '') {
        this.data = data;
        this.navCtrl.navigateBack('/' + url);
    }
    popBack() {
        this.navCtrl.pop();
    }
    get(key: string) {
        if (this.data)
            return this.data[key];
        return null;
    }
    remove(data: any = '') {
        this.data = data;
    }
}