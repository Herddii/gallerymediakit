import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { GalleryPage } from './gallery';
import { IonicImageLoader } from 'ionic-image-loader';
import { CacheImgModule } from '../../global';
import { SuperTabsModule } from 'ionic2-super-tabs';


@NgModule({
  declarations: [
    GalleryPage,
  ],
  imports: [
  	SuperTabsModule,
  	IonicImageLoader,
  	CacheImgModule,
    IonicPageModule.forChild(GalleryPage),
  ],
})
export class GalleryPageModule {}
