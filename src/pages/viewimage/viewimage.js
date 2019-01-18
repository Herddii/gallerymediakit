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
import { IonicPage, NavController, NavParams, Platform, LoadingController } from "ionic-angular";
import { Storage } from '@ionic/storage';
import { AllPage } from '../all/all';
import { SocialSharing } from '@ionic-native/social-sharing';
import { ImageProvider } from '../../providers/image/image';
import { File } from '@ionic-native/file';
import { FileTransfer } from '@ionic-native/file-transfer';
import { FileOpener } from '@ionic-native/file-opener';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { DocumentViewer } from '@ionic-native/document-viewer';
import { PhotoLibrary } from '@ionic-native/photo-library';
/**
 * Generated class for the ViewimagePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */
var ViewimagePage = /** @class */ (function () {
    function ViewimagePage(storage, nav, navParams, socialSharing, gallery, file, fileOpener, transfer, localNotifications, document, platform, photoLibrary, loadingCtrl) {
        this.storage = storage;
        this.nav = nav;
        this.navParams = navParams;
        this.socialSharing = socialSharing;
        this.gallery = gallery;
        this.file = file;
        this.fileOpener = fileOpener;
        this.transfer = transfer;
        this.localNotifications = localNotifications;
        this.document = document;
        this.platform = platform;
        this.photoLibrary = photoLibrary;
        this.loadingCtrl = loadingCtrl;
        this.result = navParams.data.content;
    }
    ViewimagePage.prototype.pushchat = function (value) {
        // this.nav.push(CheckoutTripPage,{content: value});
    };
    ViewimagePage.prototype.goback = function () {
        this.nav.push(AllPage);
    };
    ViewimagePage.prototype.share = function (id_content, folder, id_filetype, content_file_download) {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Retrieving Data'
        });
        loading.present();
        var image = 'http://10.22.253.64:8000/uploads/' + folder + '/' + id_filetype + '/' + content_file_download;
        this.gallery.getImages_baru(id_content)
            .then(function (result) {
            var nameFile = result[0].content_file_download;
            var urlimage = 'http://10.22.253.64:8000/uploads/' + result[0].folder + '/' + result[0].id_filetype + '/' + result[0].content_file_download;
            var transfer = _this.transfer.create();
            transfer.download(urlimage, _this.file.externalDataDirectory + nameFile, true).then(function (entry) {
                _this.socialSharing.shareViaWhatsApp(nameFile, entry.toURL(), '').then(function () {
                    console.log('key');
                }).catch(function () {
                    console.log('hai');
                });
                loading.dismiss();
            }, function (error) {
                // handle error
                console.log(error);
            });
        });
    };
    ViewimagePage.prototype.download = function (id_content) {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Retrieving Data'
        });
        var path = '';
        if (this.platform.is('ios')) {
            path = this.file.documentsDirectory;
        }
        else if (this.platform.is('android')) {
            path = this.file.dataDirectory;
        }
        this.gallery.getImages_baru(id_content)
            .then(function (result) {
            console.log(result);
            var nameFile = result[0].content_file_download;
            var urlimage = 'http://10.22.253.64:8000/uploads/' + result[0].folder + '/' + result[0].id_filetype + '/' + result[0].content_file_download;
            var transfer = _this.transfer.create();
            loading.present();
            transfer.download(urlimage, path + nameFile).then(function (entry) {
                console.log(entry);
                console.log('download complete: ' + entry.toURL());
                var url = entry.toURL();
                var album = 'ChatAndGallery';
                _this.photoLibrary.saveImage(url, album);
                _this.localNotifications.schedule({
                    text: 'Download Complete ' + nameFile,
                    sound: 'file://sound.mp3',
                });
                _this.fileOpener.open(url, 'image/jpg')
                    .then(function () { return console.log('File is opened'); })
                    .catch(function (e) { return console.log('Error opening file', e); });
                loading.dismiss();
                // this.fileOpener.open(path + nameFile,'image/jpg').then(()=> console.log('file_isopen')).catch( e => console.log('error'));
            }, function (error) {
                // handle error
                console.log(error);
            });
        });
    };
    ViewimagePage.prototype.ionViewWillEnter = function () {
        var tabs = document.querySelectorAll('.show-tabbar');
        var supertabs = document.querySelectorAll('.scroll-tabs');
        var header = document.querySelectorAll('.header');
        if (tabs !== null || supertabs !== null || header !== null) {
            Object.keys(tabs).map(function (key) {
                tabs[key].style.display = 'none';
            });
            Object.keys(supertabs).map(function (key) {
                supertabs[key].style.display = 'none';
            });
            Object.keys(header).map(function (key) {
                header[key].style.display = 'none';
            });
        }
    };
    ViewimagePage = __decorate([
        IonicPage(),
        Component({
            selector: 'page-viewimage',
            templateUrl: 'viewimage.html',
        }),
        __metadata("design:paramtypes", [Storage,
            NavController,
            NavParams,
            SocialSharing,
            ImageProvider,
            File,
            FileOpener,
            FileTransfer,
            LocalNotifications,
            DocumentViewer,
            Platform,
            PhotoLibrary,
            LoadingController])
    ], ViewimagePage);
    return ViewimagePage;
}());
export { ViewimagePage };
//# sourceMappingURL=viewimage.js.map