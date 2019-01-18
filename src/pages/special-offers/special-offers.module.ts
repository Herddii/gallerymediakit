import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { SpecialOffersPage } from './special-offers';
import {SharedDirective} from '../../directives/shared/shared';

@NgModule({
  declarations: [
    SpecialOffersPage,
  ],
  imports: [
  SharedDirective,
    IonicPageModule.forChild(SpecialOffersPage),
  ],
})
export class SpecialOffersPageModule {}
