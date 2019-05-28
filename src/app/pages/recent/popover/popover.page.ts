import { Component, OnInit } from '@angular/core';
import { PopoverController, NavParams } from '@ionic/angular';

@Component({
    selector: 'app-popover',
    templateUrl: './popover.page.html',
    styleUrls: ['./popover.page.scss'],
})
export class PopoverPage implements OnInit {
    listItem: any = []
    constructor(
        public popCtrl: PopoverController,
        public navParam: NavParams
    ) {
        this.listItem = this.navParam.get('listItem');
    }

    ngOnInit() {
    }
    Item_Onclick(item) {
        this.popCtrl.dismiss(item);
    }
}
