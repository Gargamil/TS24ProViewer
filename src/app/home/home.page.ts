import { Api } from 'src/app/providers';
import { Component } from '@angular/core';
import { Commons, FileSystems } from '../services';
import { TS24PRO_PROGRAM } from '../providers/api_parent_01';
@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(
    protected commons: Commons,
    protected fileSystem: FileSystems,
    private api: Api
  ) {

  }
  ngOnInit() {
  }

  openFile() {
    this.fileSystem.openFileAndroid("xml").then(uri => {
      console.log(uri);
    });
  }
}
