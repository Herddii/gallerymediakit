import { Component, ViewChild } from "@angular/core";
import { Platform, Nav, NavController } from "ionic-angular";

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { Keyboard } from '@ionic-native/keyboard';

import { HomePage } from "../pages/home/home";
import { LoginPage } from "../pages/login/login";
import { TabsPage } from "../pages/tabs/tabs";
import { ImgcacheService } from '../global/services';
// import { LocalWeatherPage } from "../pages/local-weather/local-weather";
import { YoutubePage } from "../pages/youtube/youtube";
import { Storage } from '@ionic/storage';
// import {  CacheService } from 'ionic-cache';
// import { ImageLoaderConfig } from 'ionic-image-loader';
import { ImgCacheService } from '../global';

// import { BackgroundMode } from '@ionic-native/background-mode';
import { Diagnostic } from '@ionic-native/diagnostic';
import { ImageLoaderConfig } from 'ionic-image-loader';




export interface MenuItem {
    title: string;
    component: any;
    icon: string;
}

@Component({
  templateUrl: 'app.html'
})

export class MyApp {
  @ViewChild(Nav) nav: Nav;
  rootPage: any;
  appMenuItems: Array<MenuItem>;

  constructor(
    public platform: Platform,
    public statusBar: StatusBar,
    public splashScreen: SplashScreen,
    public keyboard: Keyboard,
    public Storage: Storage,
    public imageLoaderConfig: ImageLoaderConfig,

    // private imageLoaderConfig: ImageLoaderConfig,
    public diagnostic: Diagnostic,
    // imgCacheService: ImgCacheService

  ) {

    platform.ready().then(() => {

      this.diagnostic.requestExternalStorageAuthorization().then(()=>{
        console.log('oke');
      }).catch(error=>{
        console.log(error);
      });
      statusBar.styleDefault();

      this.Storage.get('token').then((val) => {
        if (val) {
          this.rootPage = TabsPage;
        } else {
          this.rootPage = LoginPage;
        }
      });
      this.initializeApp();
      splashScreen.hide();
      // disable spinners by default, you can add [spinner]="true" to a specific component instance later on to override this
    imageLoaderConfig.enableSpinner(false);
    
    // set the maximum concurrent connections to 10
    imageLoaderConfig.setConcurrency(10000);
       // imgCacheService.initImgCache()
       //  .subscribe((v) => console.log('init'), () => console.log('fail init'));

    });

  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.statusBar.overlaysWebView(false);
    });
  }

  openPage(page) {
    this.nav.setRoot(page.component);
  }

  logout() {
    this.nav.setRoot(LoginPage);
  }

}
