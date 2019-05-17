import { Component, ViewChild, ElementRef } from '@angular/core';
import { Api } from 'src/app/providers';
import { ModalController, ActionSheetController } from '@ionic/angular';
import { FileSystems } from 'src/app/services';
import { File } from '@ionic-native/file/ngx';
import { FileListModel } from 'src/models/filelist-models';
@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  @ViewChild('html') html: ElementRef;
  xml: any;
  xsl: any;
  type: any;
  pageDemo: any = null;
  FileListModel: any;
  FileList: any = [];
  constructor(
    public api: Api,
    public modalController: ModalController,
    public actionSheetController: ActionSheetController,
    public fileSystems: FileSystems,
    public file: File
  ) {
    //this.CombineXML();
    this.FileList = FileListModel.getInstance().fileList;
  }
  ngOnInit() {

    //this.Init();
    // this.OpenFile();
  }
  async OpenFile() {
    let filepath = await this.fileSystems.openFileAndroid('xml');
    console.log('filepath', filepath);
    let result: any = await this.fileSystems.GetFileInfo(filepath);
    let FileModel = FileListModel.getInstance();
    FileModel.addFile(result, result.name);
    FileModel.saveLocal();
    console.log(FileModel.fileList);
    this.FileList = FileListModel.getInstance().fileList;
    this.ViewHTML(result.path);



  }
  async OpenSheet() {
    const actionSheet = await this.actionSheetController.create({
      // header: 'Albums',
      buttons: [{
        text: 'Mở File ',
        // role: 'destructive',
        icon: 'folder',
        handler: () => {
          this.OpenFile();
        }
      }, {
        text: 'Share',
        icon: 'share',
        handler: () => {
          console.log('Share clicked');
        }
      }, {
        text: 'Play (open modal)',
        icon: 'arrow-dropright-circle',
        handler: () => {
          console.log('Play clicked');
        }
      }, {
        text: 'Favorite',
        icon: 'heart',
        handler: () => {
          console.log('Favorite clicked');
        }
      }, {
        text: 'Cancel',
        icon: 'close',
        role: 'cancel',
        handler: () => {
          console.log('Cancel clicked');
        }
      }]
    });
    await actionSheet.present();
  }
  async ViewHTML(path) {
    let xml = await this.fileSystems.GetDocXMLFromDevice(path);
    let type = this.api.CheckXML(xml);
    xml = this.api.DeleteAtribute(type, xml);
    let id = this.api.GetIdXML(type, xml);
    let link = this.api.getFilePathXSL(type, id);
    console.log(link);
    //let xsl = this.api.loadXml('../../assets/file/thue.xsl');

    let xsl = this.api.loadXml(link);
    console.log(xsl);
    this.api.ViewHTML(this.html, xml, xsl);
  }

}
