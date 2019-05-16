import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'home',
    loadChildren: './pages/home/home.module#HomePageModule'
  },
  {
    path: 'recent',
    loadChildren: './pages/recent/recent.module#RecentPageModule'
  },
  { path: 'export-pdf', loadChildren: './pages/export-pdf/export-pdf.module#ExportPDFPageModule' },
  { path: 'export-excel', loadChildren: './pages/export-excel/export-excel.module#ExportExcelPageModule' }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
