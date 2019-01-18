var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from "@angular/core";
import { NavController, AlertController } from "ionic-angular";
import { LoginProvider } from '../../providers/login/login';
import { Http } from '@angular/http';
import { IonicPage, LoadingController, Events } from 'ionic-angular';
import { TabsPage } from '../tabs/tabs';
import { Storage } from '@ionic/storage';
/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */
var LoginPage = /** @class */ (function () {
    function LoginPage(navCtrl, loginService, events, alertCtrl, loadingCtrl, Storage, http) {
        this.navCtrl = navCtrl;
        this.loginService = loginService;
        this.events = events;
        this.alertCtrl = alertCtrl;
        this.loadingCtrl = loadingCtrl;
        this.Storage = Storage;
        this.http = http;
        this.backgrounds = [
            'assets/img/background/background-1.jpg',
            'assets/img/background/background-2.jpg',
            'assets/img/background/background-3.jpg',
            'assets/img/background/background-4.jpg'
        ];
        this.OAuth = '/oauth/';
        this.cekoauth = 'api/cek';
        this.login = { email: '', password: '' };
        this.url = 'http://10.22.253.64:8000/api/';
    }
    LoginPage.prototype.openResetPassword = function () {
        console.log('Reset password clicked');
    };
    LoginPage.prototype.onLogin = function (form) {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Authenticating ...'
        });
        loading.present();
        var unc = {
            grant_type: 'password',
            client_id: '12',
            client_secret: '6k2vL9yt8KaugPPnJywktY2SJSUDjA6D9xeitM72',
            username: this.login.email + '@mncgroup.com',
            password: this.login.password,
            scope: '*'
        };
        this.loginService.redirect(unc).subscribe(function (data) {
            loading.dismiss();
            var lxz = _this.loadingCtrl.create({
                content: 'Preparing ...'
            });
            lxz.present();
            _this.loginService.login(_this.login).subscribe(function (data) {
                _this.events.publish('user:login');
                console.log(_this.login.email);
                lxz.dismiss();
                _this.navCtrl.setRoot(TabsPage);
            }, function (error) {
                loading.dismiss();
                _this.showError(error);
            });
        });
    };
    LoginPage.prototype.showError = function (error) {
        console.log(error);
        var alert = this.alertCtrl.create({
            title: 'Error',
            message: 'Wrong user or password',
            buttons: ['OK']
        });
        alert.present();
    };
    LoginPage = __decorate([
        IonicPage(),
        Component({
            selector: 'page-login',
            templateUrl: 'login.html',
        }),
        __metadata("design:paramtypes", [NavController,
            LoginProvider,
            Events,
            AlertController,
            LoadingController,
            Storage,
            Http])
    ], LoginPage);
    return LoginPage;
}());
export { LoginPage };
//# sourceMappingURL=login.js.map