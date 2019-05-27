import { Component, OnInit } from '@angular/core';
import { PopoverController } from '@ionic/angular';

@Component({
  selector: 'app-custome-alert-dialog',
  templateUrl: './custome-alert-dialog.page.html',
  styleUrls: ['./custome-alert-dialog.page.scss'],
})
export class CustomeAlertDialogPage implements OnInit {

  isCompleteDelete: boolean = false;

  constructor(
    private popoverController: PopoverController
  ) { }

  ngOnInit() {
  }

  onNoClick() {
    this.popoverController.dismiss({ "del_confirm": false, "del_complete": this.isCompleteDelete });
  }

  onYesClick() {
    this.popoverController.dismiss({ "del_confirm": true, "del_complete": this.isCompleteDelete });
  }

}
