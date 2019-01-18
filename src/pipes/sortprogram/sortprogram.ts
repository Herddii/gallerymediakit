import { Pipe, PipeTransform } from '@angular/core';

/**
 * Generated class for the SortprogramPipe pipe.
 *
 * See https://angular.io/api/core/Pipe for more info on Angular Pipes.
 */
@Pipe({
  name: 'sortprogram',
  pure: false
})
export class SortprogramPipe implements PipeTransform {
transform(value: Array<any>, field: string): Array<any>{
  if(!value || !value.length) { 
    return value; 
  }
  const groupedObj = value.reduce((prev, cur)=> {
      if(!prev[cur[field]]) {
        prev[cur[field]] = [cur];
      } else {
        prev[cur[field]].push(cur);
      }
      return prev;
    }, {});
  return Object.keys(groupedObj).map(key => ({ key, value: groupedObj[key] }));
  }
}
