var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component, ViewChild } from "@angular/core";
import { Platform, Nav } from "ionic-angular";
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { Keyboard } from '@ionic-native/keyboard';
import { LoginPage } from "../pages/login/login";
import { TabsPage } from "../pages/tabs/tabs";
import { Storage } from '@ionic/storage';
// import { BackgroundMode } from '@ionic-native/background-mode';
import { Diagnostic } from '@ionic-native/diagnostic';
import { ImageLoaderConfig } from 'ionic-image-loader';
var MyApp = /** @class */ (function () {
    function MyApp(platform, statusBar, splashScreen, keyboard, Storage, imageLoaderConfig, 
    // private imageLoaderConfig: ImageLoaderConfig,
    diagnostic) {
        var _this = this;
        this.platform = platform;
        this.statusBar = statusBar;
        this.splashScreen = splashScreen;
        this.keyboard = keyboard;
        this.Storage = Storage;
        this.imageLoaderConfig = imageLoaderConfig;
        this.diagnostic = diagnostic;
        platform.ready().then(function () {
            _this.diagnostic.requestExternalStorageAuthorization().then(function () {
                console.log('oke');
            }).catch(function (error) {
                console.log(error);
            });
            statusBar.styleDefault();
            _this.Storage.get('token').then(function (val) {
                if (val) {
                    _this.rootPage = TabsPage;
                }
                else {
                    _this.rootPage = LoginPage;
                }
            });
            _this.initializeApp();
            splashScreen.hide();
            // disable spinners by default, you can add [spinner]="true" to a specific component instance later on to override this
            imageLoaderConfig.enableSpinner(false);
            // set the maximum concurrent connections to 10
            imageLoaderConfig.setConcurrency(10000);
            // imgCacheService.initImgCache()
            //  .subscribe((v) => console.log('init'), () => console.log('fail init'));
        });
    }
    MyApp.prototype.initializeApp = function () {
        var _this = this;
        this.platform.ready().then(function () {
            _this.statusBar.styleDefault();
            _this.statusBar.overlaysWebView(false);
        });
    };
    MyApp.prototype.openPage = function (page) {
        this.nav.setRoot(page.component);
    };
    MyApp.prototype.logout = function () {
        this.nav.setRoot(LoginPage);
    };
    __decorate([
        ViewChild(Nav),
        __metadata("design:type", Nav)
    ], MyApp.prototype, "nav", void 0);
    MyApp = __decorate([
        Component({
            templateUrl: 'app.html'
        }),
        __metadata("design:paramtypes", [Platform,
            StatusBar,
            SplashScreen,
            Keyboard,
            Storage,
            ImageLoaderConfig,
            Diagnostic])
    ], MyApp);
    return MyApp;
}());
export { MyApp };
//# sourceMappingURL=app.component.js.map