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
import { File } from '@ionic-native/file';
import { Platform } from 'ionic-angular';
import ImgCache from '@chrisben/imgcache.js';
import { ReplaySubject } from 'rxjs/ReplaySubject';
import { map, take, flatMap, switchMapTo, tap } from 'rxjs/operators';
import { bindCallback } from 'rxjs/observable/bindCallback';
import { normalizeUrlIos } from '../utils';
/**
 * This service is charged of provide the methods to cache the images
 */
var ImgCacheService = /** @class */ (function () {
    function ImgCacheService(platform, file) {
        this.platform = platform;
        this.file = file;
        this.initNotifier$ = new ReplaySubject();
        // change on production mode
        ImgCache.options.debug = true;
    }
    Object.defineProperty(ImgCacheService.prototype, "notifier$", {
        get: function () {
            return this.initNotifier$.asObservable();
        },
        enumerable: true,
        configurable: true
    });
    /**
     * Init imgCache library
     * @return {Promise}
     */
    ImgCacheService.prototype.initImgCache = function () {
        var _this = this;
        var init$ = bindCallback(ImgCache.init)();
        return init$.pipe(take(1), tap(function () { return _this.initNotifier$.next('init'); }));
    };
    /**
     * Cache is image by using a url. If the image is already cached this method
     * will return the URL
     * @param src {string}
     */
    ImgCacheService.prototype.cache = function (src) {
        var _this = this;
        return this.notifier$.pipe(switchMapTo(this.isCached(src)
            .pipe(flatMap(function (_a) {
            var path = _a[0], success = _a[1];
            return success ? _this.getCachedFileURL(path) : _this.cacheFile(path);
        }), map(function (url) {
            if (_this.platform.is('ios')) {
                return _this.normalizeURlWKWview(url);
            }
            return url;
        }))));
    };
    /**
     * WKWebview doesn't accept urls with file;// or cvdfile:// protocols.
     * The url is formatted and fix to find the img
     * @param url
     * @return {string} - url formatted
     */
    ImgCacheService.prototype.normalizeURlWKWview = function (url) {
        var urlIos = normalizeUrlIos(this.file.applicationStorageDirectory) + "Library/files/" + normalizeUrlIos(url);
        return urlIos.replace('/localhost/persistent', '');
    };
    /**
     * Get file URL if cached
     * @param src - image url
     */
    ImgCacheService.prototype.getCachedFileURL = function (src) {
        return bindCallback(ImgCache.getCachedFileURL)(src)
            .pipe(map(function (urls) { return urls[1]; }));
    };
    /**
     * Cache image using a url
     * @param src {string}
     */
    ImgCacheService.prototype.cacheFile = function (src) {
        return bindCallback(ImgCache.cacheFile)(src);
    };
    /**
     * Check if image is already cached
     * @param src
     */
    ImgCacheService.prototype.isCached = function (src) {
        return bindCallback(ImgCache.isCached)(src);
    };
    ImgCacheService = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [Platform, File])
    ], ImgCacheService);
    return ImgCacheService;
}());
export { ImgCacheService };
//# sourceMappingURL=img-cache.service.js.map