import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AppSettings } from 'src/app/services';

@Component({
  selector: 'ts24-no-data-image',
  templateUrl: './no-data-image.component.html',
  styleUrls: ['./no-data-image.component.scss']
})
export class NoDataImageComponent implements OnInit {
  @Input() text: string = null;
  @Input() showLogin: boolean = false;
  @Output() clicked: EventEmitter<number> = new EventEmitter<number>();
  appSetting = AppSettings;
  constructor() { }

  ngOnInit() {
  }

  onClick() {
    this.clicked.emit();
  }
}
