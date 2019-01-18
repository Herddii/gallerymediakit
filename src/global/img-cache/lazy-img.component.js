var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component, Input } from '@angular/core';
/**
 * Component in charge of lazy load images and cache them
 */
var LazyImgComponent = /** @class */ (function () {
    function LazyImgComponent() {
        this.placeholderActive = true;
    }
    __decorate([
        Input(),
        __metadata("design:type", String)
    ], LazyImgComponent.prototype, "source", void 0);
    LazyImgComponent = __decorate([
        Component({
            selector: 'op-lazy-img',
            template: "\n  <div text-center [ngClass]=\"{ 'placeholder': placeholderActive }\">\n    <img op-lazy-img [source]=\"source\" (loaded)=\"placeholderActive = false\"/>\n  </div>\n  ",
            styleUrls: ['/global/img-cache/lazy-img.component.scss']
        })
    ], LazyImgComponent);
    return LazyImgComponent;
}());
export { LazyImgComponent };
//# sourceMappingURL=lazy-img.component.js.map