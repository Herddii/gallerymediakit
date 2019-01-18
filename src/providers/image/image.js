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
import { UrlProvider } from '../url/url';
var ImageProvider = /** @class */ (function () {
    function ImageProvider(http, storage, url) {
        this.http = http;
        this.storage = storage;
        this.url = url;
        console.log('Hello ImageProvider Provider');
    }
    ImageProvider.prototype.get_all_master = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.storage.get('token').then(function (value) {
                var headers = new Headers();
                headers.append('Content-Type', 'application/json');
                headers.append('Authorization', 'Bearer ' + value);
                _this.http.get(_this.url + 'get_gallery_all', { headers: headers })
                    .map(function (res) { return res.json(); })
                    .subscribe(function (data) {
                    resolve(data);
                }, function (err) {
                    reject(err);
                });
            });
        });
    };
    ImageProvider.prototype.getImages_baru = function (id_content) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.http.post(_this.url.urlApi + 'get_image', { idProgram: id_content }).map(function (res) { return res.json(); }).subscribe(function (data) {
                resolve(data);
                console.log(data);
            }, function (err) {
                reject(err);
            });
        });
    };
    ImageProvider.prototype.get_all_prog = function (idGenre) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.storage.get('token').then(function (value) {
                var headers = new Headers();
                headers.append('Content-Type', 'application/json');
                headers.append('Authorization', 'Bearer ' + value);
                _this.http.get(_this.url.urlApi + 'get_gallery_all_program/' + idGenre, { headers: headers })
                    .map(function (res) { return res.json(); })
                    .subscribe(function (data) {
                    resolve(data);
                }, function (err) {
                    reject(err);
                });
            });
        });
    };
    ImageProvider.prototype.getGenre = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.storage.get('token').then(function (value) {
                var headers = new Headers();
                headers.append('Content-Type', 'application/json');
                headers.append('Authorization', 'Bearer ' + value);
                _this.http.get(_this.url.urlApi + 'get_genre_program', { headers: headers })
                    .map(function (res) { return res.json(); })
                    .subscribe(function (data) {
                    resolve(data);
                }, function (err) {
                    reject(err);
                });
            });
        });
    };
    ImageProvider = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [Http,
            Storage,
            UrlProvider])
    ], ImageProvider);
    return ImageProvider;
}());
export { ImageProvider };
//# sourceMappingURL=image.js.map