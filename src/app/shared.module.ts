import { NgModule } from '@angular/core';
import { ComponentsModule } from './components/components.module';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';
import { PipesModule } from 'src/pipes/pipes.module';
import { ActionSheetPage } from './pages/home/action-sheet/action-sheet.page';
export const shared_modal = [
];
@NgModule({
    declarations: [
        shared_modal,
        ActionSheetPage
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
