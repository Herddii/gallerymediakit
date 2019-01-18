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
import 'rxjs/add/operator/map';
import { Http, Headers } from '@angular/http';
import { Events, App } from 'ionic-angular';
import { Storage } from '@ionic/storage';
var LoginProvider = /** @class */ (function () {
    function LoginProvider(app, events, http, storage, authHttp) {
        this.app = app;
        this.events = events;
        this.http = http;
        this.storage = storage;
        this.authHttp = authHttp;
        this._favorites = [];
        this.HAS_LOGGED_IN = 'hasLoggedIn';
        this.HAS_SEEN_TUTORIAL = 'hasSeenTutorial';
        this.url = 'http://10.22.253.64:8000/api/';
    }
    LoginProvider.prototype.redirect = function (val) {
        var urlf = 'http://10.22.253.64:8000';
        return this.http.post(urlf + '/oauth/token', val)
            .map(function (response) { return response.json(); })
            .map(function (data) {
            return data;
        });
    };
    ;
    LoginProvider.prototype.login = function (login) {
        var _this = this;
        return this.http.post(this.url + 'login_mobile', login)
            .map(function (response) { return response.json(); })
            .map(function (data) {
            _this.setAuth(data);
            _this.getUser();
            return data.token;
        });
    };
    ;
    LoginProvider.prototype.get_user = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.storage.get('token').then(function (value) {
                var headers = new Headers();
                headers.append('Content-Type', 'application/json');
                headers.append('Authorization', 'Bearer ' + value);
                _this.http.get(_this.url + 'details', { headers: headers }).map(function (res) { return res.json(); }).subscribe(function (data) {
                    resolve(data);
                }, function (err) {
                    reject(err);
                });
            });
        });
    };
    LoginProvider.prototype.getUser = function () {
        return this.authHttp.get(this.url + '/user');
    };
    ;
    LoginProvider.prototype.setAuth = function (data) {
        return this.storage.set('token', data.success.token);
    };
    LoginProvider = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [App,
            Events,
            Http,
            Storage,
            Http])
    ], LoginProvider);
    return LoginProvider;
}());
export { LoginProvider };
//# sourceMappingURL=login.js.map