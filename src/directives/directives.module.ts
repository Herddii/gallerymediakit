import { NgModule } from '@angular/core';
import { SwipeSegmentDirective } from './swipe-segment/swipe-segment';
import { SharedDirective } from './shared/shared';
@NgModule({
	declarations: [SwipeSegmentDirective,
    SharedDirective],
	imports: [],
	exports: [SwipeSegmentDirective,
    SharedDirective]
})
export class DirectivesModule {}
