var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component, ViewChild } from "@angular/core";
import { IonicPage, NavController, AlertController, NavParams } from "ionic-angular";
import { SuperTabs } from 'ionic2-super-tabs';
/**
 * Generated class for the GalleryPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */
var GalleryPage = /** @class */ (function () {
    function GalleryPage(navCtrl, navParams, alertCtrl) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.alertCtrl = alertCtrl;
        this.pages = [
            { pageName: 'AllPage', title: 'All', id: 'alltab' },
            { pageName: 'ProgramPage', title: 'Program', id: 'programtab' },
            { pageName: 'RateCardPage', title: 'Rate Card', id: 'ratecardtab' },
            { pageName: 'SpecialOffersPage', title: 'Special Offers', id: 'SpecialOfferstab' }
        ];
        this.selectedTab = 0;
    }
    GalleryPage.prototype.onTabSelect = function (ev) {
        this.selectedTab = ev.index;
        this.superTabs.clearBadge(this.pages[ev.index].id);
    };
    __decorate([
        ViewChild(SuperTabs),
        __metadata("design:type", SuperTabs)
    ], GalleryPage.prototype, "superTabs", void 0);
    GalleryPage = __decorate([
        IonicPage(),
        Component({
            selector: 'page-gallery',
            templateUrl: 'gallery.html',
        }),
        __metadata("design:paramtypes", [NavController, NavParams, AlertController])
    ], GalleryPage);
    return GalleryPage;
}());
export { GalleryPage };
//# sourceMappingURL=gallery.js.map