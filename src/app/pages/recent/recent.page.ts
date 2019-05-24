import { Component, OnInit } from '@angular/core';
import { RecentModel } from 'src/models/recent-model';

@Component({
    selector: 'app-recent',
    templateUrl: './recent.page.html',
    styleUrls: ['./recent.page.scss'],
})
export class RecentPage implements OnInit {
    RecentFiles: any = [];
    constructor() { }

    ngOnInit() {
        this.RecentFiles = RecentModel.getInstance().fileList;
        console.log(this.RecentFiles);
    }

}
