import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { ShadowCSSDirective } from './shadow-css.directive';

@NgModule({
    declarations: [
        ShadowCSSDirective,
    ],
    exports: [
        ShadowCSSDirective
    ],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})

export class ShadowCssDirectiveModule { }
