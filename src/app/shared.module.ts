import { NgModule } from '@angular/core';
import { ComponentsModule } from './components/components.module';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';
import { PipesModule } from 'src/pipes/pipes.module';
import { ActionSheetPage } from './pages/home/action-sheet/action-sheet.page';
import { CustomeAlertDialogPage } from './pages/export-pdf/custome-alert-dialog/custome-alert-dialog.page';
import { PopoverPage } from './pages/recent/popover/popover.page';

export const shared_modal = [
];
@NgModule({
    declarations: [
        shared_modal,
        ActionSheetPage,
        CustomeAlertDialogPage,
        PopoverPage
    ],
    imports: [IonicModule,
        CommonModule,
        FormsModule,
        TranslateModule.forChild(),
        ComponentsModule,
        PipesModule
    ],
    exports: [ComponentsModule,
        shared_modal,
        PipesModule
    ]
})

export class SharedModule { }
