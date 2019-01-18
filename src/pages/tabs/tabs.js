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
import { IonicPage } from 'ionic-angular';
import { GalleryPage } from '../gallery/gallery';
import { YoutubePage } from '../youtube/youtube';
// import { ChatPage } from '../chat/chat';
import { Socket } from 'ng-socket-io';
// import { CheckoutTripPage } from '../checkout-trip/checkout-trip';
// import { VideoPage } from '../video/video';
import { Storage } from '@ionic/storage';
var TabsPage = /** @class */ (function () {
    // ChatPage=CheckoutTripPage;
    function TabsPage(socket, storage) {
        var _this = this;
        this.socket = socket;
        this.storage = storage;
        this.GalleryPage = GalleryPage;
        this.YoutubePage = YoutubePage;
        this.storage.get('num_chat').then(function (v) {
            var c = _this.num_chat - v;
            _this.num_chat = c;
        });
    }
    TabsPage.prototype.ionViewWillEnter = function () {
        // this.socket.on('news_chat',(notif)=>{
        // 	// console.log(notif.length);
        // 	this.num_chat = notif.length;
        // 	this.storage.set('num_chat',this.num_chat);
        // })
    };
    TabsPage = __decorate([
        IonicPage(),
        Component({
            selector: 'page-tabs',
            templateUrl: 'tabs.html',
        }),
        __metadata("design:paramtypes", [Socket, Storage])
    ], TabsPage);
    return TabsPage;
}());
export { TabsPage };
//# sourceMappingURL=tabs.js.map