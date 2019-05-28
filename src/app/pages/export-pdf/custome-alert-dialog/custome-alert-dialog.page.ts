import { Component, OnInit, Input } from '@angular/core';
import { PopoverController } from '@ionic/angular';

@Component({
  selector: 'app-custome-alert-dialog',
  templateUrl: './custome-alert-dialog.page.html',
  styleUrls: ['./custome-alert-dialog.page.scss'],
})
export class CustomeAlertDialogPage implements OnInit {

  isCompleteDelete: boolean = false;
  @Input("type") type: string = "del";


  constructor(
    private popoverController: PopoverController
  ) { }

  ngOnInit() {
  }

  onDelClick(text) {
    switch (text) {
      case "no":
        this.popoverController.dismiss({ "del_confirm": false, "del_complete": this.isCompleteDelete });
        break;
      case "yes":
        this.popoverController.dismiss({ "del_confirm": true, "del_complete": this.isCompleteDelete });
        break;
      default:
        break;
    }
  }

  onConvertClick(text) {
    switch (text) {
      case "pdf":
        this.popoverController.dismiss({ "conver_type": "pdf" });
        break;
      case "excel":
        this.popoverController.dismiss({ "conver_type": "excel" });
        break;
      default:
        this.popoverController.dismiss();
        break;
    }
  }

}
