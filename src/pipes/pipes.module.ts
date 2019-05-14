import { NgModule } from '@angular/core';
import { CurrencyFormatPipe } from './currency-format/currency-format';
import { SanitizingPipe } from './sanitizing/sanitizing';
@NgModule({
	declarations: [CurrencyFormatPipe,
    SanitizingPipe],
	imports: [],
	exports: [CurrencyFormatPipe,
	SanitizingPipe,
	]
})
export class PipesModule {}
