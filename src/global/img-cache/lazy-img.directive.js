var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Directive, ElementRef, EventEmitter, Input, Output, Renderer2 } from '@angular/core';
import { ImgCacheService } from './img-cache.service';
/**
* This directive is charge of cache the images and emit a loaded event
*/
var LazyLoadDirective = /** @class */ (function () {
    function LazyLoadDirective(el, imgCacheService, renderer) {
        this.el = el;
        this.imgCacheService = imgCacheService;
        this.renderer = renderer;
        this.source = '';
        this.loaded = new EventEmitter();
    }
    LazyLoadDirective.prototype.ngOnInit = function () {
        var _this = this;
        // get img element
        var nativeElement = this.el.nativeElement;
        // add load listener
        this.loadListener = this.renderer.listen(nativeElement, 'load', function () {
            _this.renderer.addClass(nativeElement, 'loaded');
            _this.loaded.emit();
        });
        this.errorListener = this.renderer.listen(nativeElement, 'error', function () {
            nativeElement.remove();
        });
        // cache img and set the src to the img
        this.cacheSubscription =
            this.imgCacheService
                .cache(this.source)
                .subscribe(function (value) {
                _this.renderer.setAttribute(nativeElement, 'src', value);
            }, function (e) { return console.log(e); });
    };
    LazyLoadDirective.prototype.ngOnDestroy = function () {
        // remove listeners
        this.loadListener();
        this.errorListener();
        this.cacheSubscription.unsubscribe();
    };
    __decorate([
        Input('source') // double check
        ,
        __metadata("design:type", String)
    ], LazyLoadDirective.prototype, "source", void 0);
    __decorate([
        Output(),
        __metadata("design:type", EventEmitter)
    ], LazyLoadDirective.prototype, "loaded", void 0);
    LazyLoadDirective = __decorate([
        Directive({
            selector: '[op-lazy-img]'
        }),
        __metadata("design:paramtypes", [ElementRef,
            ImgCacheService,
            Renderer2])
    ], LazyLoadDirective);
    return LazyLoadDirective;
}());
export { LazyLoadDirective };
//# sourceMappingURL=lazy-img.directive.js.map