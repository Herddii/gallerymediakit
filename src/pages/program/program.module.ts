import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { ProgramPage } from './program';
import { SortprogramPipe } from "../../pipes/sortprogram/sortprogram";
import { CacheImgModule } from '../../global';
import { IonicImageLoader } from 'ionic-image-loader';
import {SharedDirective} from '../../directives/shared/shared';


@NgModule({
  declarations: [
    ProgramPage,
    // SortprogramPipe
  ],
  imports: [
  IonicImageLoader,
  SharedDirective,
    IonicPageModule.forChild(ProgramPage),
  ],
})
export class ProgramPageModule {}
