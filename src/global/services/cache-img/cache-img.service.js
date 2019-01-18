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
import { Platform } from 'ionic-angular';
import ImgCache from '@chrisben/imgcache.js';
/**
 * This service is charged of provide the methods to cache the images
 */
var ImgcacheService = /** @class */ (function () {
    function ImgcacheService(platform) {
        this.imgQueue = [];
        ImgCache.options.debug = true;
    }
    /**
     * Init imgCache library
     * @return {Promise}
     */
    ImgcacheService.prototype.initImgCache = function () {
        return new Promise(function (resolve, reject) {
            if (ImgCache.ready) {
                resolve();
            }
            else {
                ImgCache.init(function () { return resolve(); }, function () { return reject(); });
            }
        });
    };
    /**
     * Cache images
     * @param src {string} - img source
     */
    ImgcacheService.prototype.cacheImg = function (src) {
        return new Promise(function (resolve, reject) {
            ImgCache.isCached(src, function (path, success) {
                // if not, it will be cached
                if (success) {
                    ImgCache.getCachedFileURL(src, function (originalUrl, cacheUrl) {
                        resolve(cacheUrl);
                    }, function (e) {
                        reject(e);
                    });
                }
                else {
                    // cache img
                    ImgCache.cacheFile(src);
                    // return original img URL
                    resolve(src);
                }
            });
        });
    };
    ImgcacheService = __decorate([
        Injectable(),
        __metadata("design:paramtypes", [Platform])
    ], ImgcacheService);
    return ImgcacheService;
}());
export { ImgcacheService };
//# sourceMappingURL=cache-img.service.js.map