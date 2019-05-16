import { Api } from 'src/app/providers';
import { Component } from '@angular/core';
import { Commons, FileSystems } from 'src/app/services';
import { TS24PRO_PROGRAM } from 'src/app/providers/api_parent_01';
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
    let xml = this.api.loadXml("/assets/test.xml");
    console.log(xml);
    xml = this.api.DeleteAtribute(TS24PRO_PROGRAM.THUE, xml);
  }

  openFile() {
    this.fileSystem.openFileAndroid("xml").then(uri => {
      console.log(uri);
    });
  }
}
