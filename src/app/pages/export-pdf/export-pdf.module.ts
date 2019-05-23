import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { ExportPDFPage } from './export-pdf.page';
import { TranslateModule } from '@ngx-translate/core';
import { SharedModule } from 'src/app/shared.module';

const routes: Routes = [
  {
    path: '',
    component: ExportPDFPage
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
  declarations: [ExportPDFPage]
})
export class ExportPDFPageModule { }
