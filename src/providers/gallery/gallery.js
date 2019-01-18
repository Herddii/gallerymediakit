var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';
import 'rxjs/add/operator/map';
import { Http, Headers } from '@angular/http';
/*
  Generated class for the GalleryProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
var GalleryProvider = /** @class */ (function () {
    function GalleryProvider(http, storage) {
        this.http = http;
        this.storage = storage;
        this.url = 'http://10.22.253.64:8000/api/';
        viewCtrl.didEnter().subscribe(function () { return console.log('User just entered tab'); });
        viewCtrl.didLeave().subscribe(function () { return console.log('User just left tab'); });
        console.log('Hello GalleryProvider Provider');
    }
    GalleryProvider.prototype.get_all_master = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.storage.get('token').then(function (value) {
                var headers = new Headers();
                headers.append('Content-Type', 'application/json');
                headers.append('Authorization', 'Bearer ' + value);
                _this.http.get('http://10.22.253.64:8000/api/get_gallery_all', { headers: headers })
                    .map(function (res) { return res.json(); })
                    .subscribe(function (data) {
                    resolve(data);
                }, function (err) {
                    reject(err);
                });
            });
        });
    };
    GalleryProvider = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [Http,
            Storage])
    ], GalleryProvider);
    return GalleryProvider;
}());
export { GalleryProvider };
//# sourceMappingURL=gallery.js.map