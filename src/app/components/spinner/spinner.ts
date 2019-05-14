import { Component,Input } from '@angular/core';
/**
 * Generated class for the SpinnerComponent component.
 *
 * See https://angular.io/api/core/Component for more info on Angular
 * Components.
 */

@Component({
  selector: 'ts24-spinner',
  templateUrl: 'spinner.html',
  styleUrls: ['./spinner.scss'],
})
export class SpinnerComponent {
  @Input() show: boolean = false;
  constructor() {
    //console.log('Hello SpinnerComponent Component');
    //this.text = 'Hello World';
  }

}
