import { NgModule } from '@angular/core';
import { ShadowCssDirectiveModule } from './shadowCSS/shadow-css.module';
import { IonicModule } from '@ionic/angular';
import { ElasticHeaderModule } from './elastic-header/elastic-header.module';
import { SpinnerComponent } from './spinner/spinner';
import { CommonModule } from '@angular/common';
import { NoDataImageComponent } from './no-data-image/no-data-image.component';
import { TranslateModule } from '@ngx-translate/core';
import { HeaderTransparentModule } from './header-transparent/header-transparent.module';
import { RatingComponent } from './rating/rating';
export const components = [
    SpinnerComponent,
    NoDataImageComponent,
    RatingComponent
];

@NgModule({
    declarations: [components],
    imports: [
        IonicModule,
        CommonModule,
        TranslateModule.forChild()
    ],
    exports: [ShadowCssDirectiveModule,
        ElasticHeaderModule,
        HeaderTransparentModule,
        components,
    ]
})
export class ComponentsModule { }
