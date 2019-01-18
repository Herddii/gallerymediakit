import { NgModule } from '@angular/core';
import { RelativeTimePipe } from './relative-time/relative-time';
import { SortprogramPipe } from './sortprogram/sortprogram';
import { SafepipePipe } from './safepipe/safepipe';
import { LengthPipe } from './length/length';
import { SortPipe } from './sort/sort';
@NgModule({
	declarations: [RelativeTimePipe,
    SortprogramPipe,
    SafepipePipe,
    LengthPipe,
    SortPipe],
	imports: [],
	exports: [RelativeTimePipe,
    SortprogramPipe,
    SafepipePipe,
    LengthPipe,
    SortPipe]
})
export class PipesModule {}
