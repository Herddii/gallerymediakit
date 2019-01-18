var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Http } from '@angular/http';
import { Injectable } from '@angular/core';
var UrlProvider = /** @class */ (function () {
    function UrlProvider(http) {
        this.http = http;
        this.url = 'http://10.22.253.64:8000';
        this.urlApi = 'http://10.22.253.64:8000/api/';
        this.urlSebelas = 'http://172.18.11.11/mam1.1/uploads/public/';
    }
    UrlProvider = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [Http])
    ], UrlProvider);
    return UrlProvider;
}());
export { UrlProvider };
//# sourceMappingURL=url.js.map