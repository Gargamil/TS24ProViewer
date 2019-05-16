import { Api } from 'src/app/providers';
import { Component } from '@angular/core';
import { Commons, FileSystems } from 'src/app/services';
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
