import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { ExportExcelPage } from './export-excel.page';
import { TranslateModule } from '@ngx-translate/core';
import { SharedModule } from 'src/app/shared.module';
import { CustomeAlertDialogPage } from '../export-pdf/custome-alert-dialog/custome-alert-dialog.page';

const routes: Routes = [
  {
    path: '',
    component: ExportExcelPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    TranslateModule.forChild(),
    SharedModule,
  ],
  declarations: [ExportExcelPage],
  entryComponents: [CustomeAlertDialogPage]
})
export class ExportExcelPageModule {}
