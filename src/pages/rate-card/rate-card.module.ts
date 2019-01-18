import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { RateCardPage } from './rate-card';
import {SharedDirective} from '../../directives/shared/shared';

@NgModule({
  declarations: [
    RateCardPage,
  ],
  imports: [
  SharedDirective,
    IonicPageModule.forChild(RateCardPage),
  ],
})
export class RateCardPageModule {}
