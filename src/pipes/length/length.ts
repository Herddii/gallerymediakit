import { Pipe, PipeTransform } from '@angular/core';

/**
 * Generated class for the LengthPipe pipe.
 *
 * See https://angular.io/api/core/Pipe for more info on Angular Pipes.
 */
@Pipe({
  name: 'length',
  pure: false
})
export class LengthPipe implements PipeTransform {
  /**
   * Takes a value and makes it lowercase.
   */
  transform(value: any, args: any[] = null): any {
        return Object.keys(value)//.map(key => value[key]);
    }
}