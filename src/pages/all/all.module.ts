import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { AllPage } from './all';
// import { SortprogramPipe } from "../../pipes/sortprogram/sortprogram";
import { CacheImgModule } from '../../global';
import { IonicImageLoader } from 'ionic-image-loader';
import {SharedDirective} from '../../directives/shared/shared';

@NgModule({
  declarations: [
    AllPage
  ],
  imports: [
  IonicImageLoader,
  SharedDirective,
    IonicPageModule.forChild(AllPage),
  ],
})
export class AllPageModule {}
