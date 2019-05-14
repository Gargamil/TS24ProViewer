import { Pipe, PipeTransform, Injectable } from '@angular/core';

/**
 * Generated class for the CurrencyFormatPipe pipe.
 *
 * See https://angular.io/api/core/Pipe for more info on Angular Pipes.
 */
@Pipe({
  name: 'currencyFormat',
})
@Injectable()
export class CurrencyFormatPipe implements PipeTransform {
  /**
   * Takes a value and makes it lowercase.
   */
  transform(item: any, replace?: any, replacement?: any): any {
    replace = replace || ',',
      replacement = replacement || '.';
    if (item == null) return "";
    item = item.replace(/[^\0-9]/g, '');
    let re = new RegExp(replace, "g");
    item = item.replace(re, replacement);
    if (item.length < 4)
      item = parseInt(item);
    return item;
  }
}
