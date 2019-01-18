var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import { Pipe } from '@angular/core';
/**
 * Generated class for the SortprogramPipe pipe.
 *
 * See https://angular.io/api/core/Pipe for more info on Angular Pipes.
 */
var SortprogramPipe = /** @class */ (function () {
    function SortprogramPipe() {
    }
    SortprogramPipe.prototype.transform = function (value, field) {
        if (!value || !value.length) {
            return value;
        }
        var groupedObj = value.reduce(function (prev, cur) {
            if (!prev[cur[field]]) {
                prev[cur[field]] = [cur];
            }
            else {
                prev[cur[field]].push(cur);
            }
            return prev;
        }, {});
        return Object.keys(groupedObj).map(function (key) { return ({ key: key, value: groupedObj[key] }); });
    };
    SortprogramPipe = __decorate([
        Pipe({
            name: 'sortprogram',
            pure: false
        })
    ], SortprogramPipe);
    return SortprogramPipe;
}());
export { SortprogramPipe };
//# sourceMappingURL=sortprogram.js.map