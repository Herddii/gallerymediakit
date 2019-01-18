var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from '@angular/core';
import { IonicPage, NavController, LoadingController, AlertController, Platform } from "ionic-angular";
import { Storage } from '@ionic/storage';
import { LoginProvider } from '../../providers/login/login';
import { ImageProvider } from '../../providers/image/image';
import { File } from '@ionic-native/file';
import { FileTransfer } from '@ionic-native/file-transfer';
import { FileOpener } from '@ionic-native/file-opener';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { ViewimagePage } from '../viewimage/viewimage';
import { UrlProvider } from '../../providers/url/url';
var AllPage = /** @class */ (function () {
    function AllPage(navCtrl, gallery, alertCtrl, storage, login, loadingCtrl, file, platform, transfer, localNotifications, fileopener, nav, url) {
        var _this = this;
        this.navCtrl = navCtrl;
        this.gallery = gallery;
        this.alertCtrl = alertCtrl;
        this.storage = storage;
        this.login = login;
        this.loadingCtrl = loadingCtrl;
        this.file = file;
        this.platform = platform;
        this.transfer = transfer;
        this.localNotifications = localNotifications;
        this.fileopener = fileopener;
        this.nav = nav;
        this.url = url;
        this.allgallery = [];
        this.prfile = [];
        this.sa = 1;
        this.limit = 7;
        this.ax = 5;
        this.getGalleryAll();
        this.storage.get('user_details').then(function (dta) {
            _this.prfile.push(dta);
        });
        this.storage.get('token').then(function (val) {
            _this.token = val;
        });
    }
    AllPage.prototype.tambah = function (value) {
        var i = this.limit + value;
        this.limit = i;
    };
    // transform(){
    //   return 'http://172.18.11.11/mam1.1/uploads/public/12/PGRM20150113180339.jpg';
    // }
    AllPage.prototype.getGalleryAll = function () {
        var _this = this;
        this.login.get_user().then(function (data) {
            _this.user = data;
            _this.storage.set('user_details', _this.user);
        });
        this.gallery.get_all_master().then(function (data) {
            _this.allgallery = data;
            console.log(data);
            _this.sa = 1;
        }).catch(function (err) {
            _this.presentAlert();
        });
        this.sa = 0;
    };
    AllPage.prototype.presentAlert = function () {
        var alert = this.alertCtrl.create({
            title: 'ERROR',
            subTitle: 'Database Error !!',
            buttons: ['Ok']
        });
        alert.present();
    };
    AllPage.prototype.viewPicture = function (content) {
        return 'url(' + this.url.urlSebelas + content.id_filetype + '/' + content.content_file_download + ')';
    };
    AllPage.prototype.pdfView = function (content) {
        var _this = this;
        var path = null;
        var loading = this.loadingCtrl.create({
            content: 'Please Wait !'
        });
        if (this.platform.is('ios')) {
            path = this.file.documentsDirectory;
        }
        else if (this.platform.is('android')) {
            path = this.file.dataDirectory;
        }
        this.gallery.getImages_baru(content.id_content).then(function (result) {
            var nameFile = result[0].content_file_download;
            var imageShow = result[0].id_filetype;
            var folder = result[0].folder;
            var urlimage = _this.url.urlSebelas + imageShow + '/' + nameFile;
            var transfer = _this.transfer.create();
            transfer.download(urlimage, _this.file.externalRootDirectory + '/Documents/' + nameFile).then(function (response) {
                _this.localNotifications.schedule({
                    title: 'Download Complete',
                    text: 'Please Take a look in Documents directory with name ' + nameFile
                });
                loading.present();
                _this.fileopener.open(response.nativeURL, 'application/pdf');
                loading.dismiss();
                console.log(response);
            }, function (error) {
                console.log(error);
            });
        }, function (err) {
            console.log(err);
        });
    };
    AllPage.prototype.goView = function (content) {
        this.nav.push(ViewimagePage, { content: content });
    };
    AllPage = __decorate([
        IonicPage(),
        Component({
            selector: 'page-all',
            templateUrl: 'all.html',
        }),
        __metadata("design:paramtypes", [NavController,
            ImageProvider,
            AlertController,
            Storage,
            LoginProvider,
            LoadingController,
            File,
            Platform,
            FileTransfer,
            LocalNotifications,
            FileOpener,
            NavController,
            UrlProvider])
    ], AllPage);
    return AllPage;
}());
export { AllPage };
//# sourceMappingURL=all.js.map