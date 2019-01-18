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
import { ImgcacheService } from '../services/';
/**
 * This directive is charge of cache the images and emit a loaded event
 */
var LazyLoadDirective = /** @class */ (function () {
    function LazyLoadDirective(el, imgCacheService, renderer) {
        this.el = el;
        this.imgCacheService = imgCacheService;
        this.renderer = renderer;
        this.src = '';
        this.loaded = new EventEmitter();
    }
    LazyLoadDirective.prototype.ngOnInit = function () {
        var _this = this;
        // get img element
        var nativeElement = this.el.nativeElement;
        var render = this.renderer;
        // add load listener
        this.loadEvent = render.listen(nativeElement, 'load', function () {
            render.addClass(nativeElement, 'loaded');
            _this.loaded.emit();
        });
        this.errorEvent = render.listen(nativeElement, 'error', function () {
            nativeElement.remove();
        });
        // cache img and set the src to the img
        this.imgCacheService.cacheImg(this.src).then(function (value) {
            render.setAttribute(nativeElement, 'src', value);
        });
    };
    LazyLoadDirective.prototype.ngOnDestroy = function () {
        // remove listeners
        this.loadEvent();
        this.errorEvent();
    };
    __decorate([
        Input('inputSrc'),
        __metadata("design:type", Object)
    ], LazyLoadDirective.prototype, "src", void 0);
    __decorate([
        Output(),
        __metadata("design:type", Object)
    ], LazyLoadDirective.prototype, "loaded", void 0);
    LazyLoadDirective = __decorate([
        Directive({
            selector: '[lazy-load]'
        }),
        __metadata("design:paramtypes", [ElementRef,
            ImgcacheService,
            Renderer2])
    ], LazyLoadDirective);
    return LazyLoadDirective;
}());
export { LazyLoadDirective };
//# sourceMappingURL=lazy-load.directive.js.map