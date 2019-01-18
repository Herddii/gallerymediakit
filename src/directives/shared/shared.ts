import { NgModule, Directive,OnInit, EventEmitter, Output, OnDestroy, Input,ElementRef,Renderer } from '@angular/core';
import { CommonModule } from '@angular/common';
import {SortprogramPipe} from '../../pipes/sortprogram/sortprogram';

/**
 * Generated class for the SharedDirective directive.
 *
 * See https://angular.io/api/core/Directive for more info on Angular
 * Directives.
 */
@NgModule({
  imports: [
  ],
  declarations: [
  SortprogramPipe
  ],
  exports: [
   SortprogramPipe
  ]
})

export class SharedDirective {

  constructor() {
    console.log('Hello SharedDirective Directive');
  }

}
