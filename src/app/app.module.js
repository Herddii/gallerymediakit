var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
import { NgModule } from "@angular/core";
import { IonicApp, IonicModule } from "ionic-angular";
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import { IonicStorageModule } from '@ionic/storage';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { Keyboard } from '@ionic-native/keyboard';
import { MyApp } from "./app.component";
import { SettingsPage } from "../pages/settings/settings";
// import {CheckoutTripPage} from "../pages/checkout-trip/checkout-trip";
// import {PdfviewPage} from '../pages/pdfview/pdfview';
import { GalleryPage } from "../pages/gallery/gallery";
import { YoutubePage } from "../pages/youtube/youtube";
import { HomePage } from "../pages/home/home";
import { LoginPage } from "../pages/login/login";
// import {NotificationsPage} from "../pages/notifications/notifications";
// import {RegisterPage} from "../pages/register/register";
// import {SearchLocationPage} from "../pages/search-location/search-location";
// import {TripDetailPage} from "../pages/trip-detail/trip-detail";
// import {TripsPage} from "../pages/trips/trips";
// import {LocalWeatherPage} from "../pages/local-weather/local-weather";
import { TabsPage } from "../pages/tabs/tabs";
// import {ImageProvider} from "../providers/image/image";
// import {ChatPage} from "../pages/chat/chat";
// import {EmojiComponent} from "../components/emoji/emoji";
// import { EmojiProvider } from '../providers/emoji';
// import { YoutubeVideoPlayer } from '@ionic-native/youtube-video-player';
// import { ChatServiceProvider } from '../providers/chat-service/chat-service';
// import { VideoPage } from "../pages/video/video";
import { RelativeTimePipe } from '../pipes/relative-time/relative-time';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { TokenInterceptor } from '../interceptors/token-interceptor';
import { SafepipePipe } from '../pipes/safepipe/safepipe';
import { LengthPipe } from '../pipes/length/length';
// import { PhotoViewer } from '@ionic-native/photo-viewer';
import { File } from '@ionic-native/file';
import { FileTransfer } from '@ionic-native/file-transfer';
import { DocumentViewer } from '@ionic-native/document-viewer';
import { FileOpener } from '@ionic-native/file-opener';
// import { AndroidFullScreen } from '@ionic-native/android-full-screen';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { LocalNotifications } from '@ionic-native/local-notifications';
// import { SocialSharing } from '@ionic-native/social-sharing';
import { PhotoLibrary } from '@ionic-native/photo-library';
// import { CacheModule } from 'ionic-cache';
// import { InAppBrowser } from '@ionic-native/in-app-browser';
import { SocketIoModule } from 'ng-socket-io';
import { OrderModule } from 'ngx-order-pipe';
// import {IonicImageCacheModule} from 'ionic3-image-cache';
// import {VideofilterPage} from '../pages/videofilter/videofilter';
// import {VideofiltershowPage} from '../pages/videofiltershow/videofiltershow';
// import { BackgroundMode } from '@ionic-native/background-mode';
import { SuperTabsModule } from 'ionic2-super-tabs';
import { SwipeSegmentDirective } from '../directives/swipe-segment/swipe-segment';
import { Diagnostic } from '@ionic-native/diagnostic';
import { LoginProvider } from '../providers/login/login';
import { GalleryProvider } from '../providers/gallery/gallery';
import { YoutubeProvider } from '../providers/youtube/youtube';
import { IonicImageLoader } from 'ionic-image-loader';
import { ViewimagePage } from '../pages/viewimage/viewimage';
import { ImageProvider } from '../providers/image/image';
import { SocialSharing } from '@ionic-native/social-sharing';
import { UrlProvider } from '../providers/url/url';
import { AllPageModule } from '../pages/all/all.module';
import { ProgramPageModule } from '../pages/program/program.module';
var config = { url: 'http://10.22.253.64:3001', options: {} };
// import services
// end import services
// end import services
// import pages
// end import pages
var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        NgModule({
            declarations: [
                MyApp,
                SettingsPage,
                HomePage,
                LoginPage,
                GalleryPage,
                TabsPage,
                YoutubePage,
                RelativeTimePipe,
                ViewimagePage,
                // SortprogramPipe,
                SafepipePipe,
                LengthPipe,
                SwipeSegmentDirective
            ],
            imports: [
                HttpModule,
                BrowserModule,
                HttpClientModule,
                OrderModule,
                AllPageModule,
                ProgramPageModule,
                // CacheImgModule.forRoot(),
                IonicImageLoader.forRoot(),
                SuperTabsModule.forRoot(),
                // IonicImageCacheModule.forRoot(),
                // CacheModule.forRoot({ keyPrefix: 'my-app-cache' }),
                PdfViewerModule,
                // IonicImageLoader.forRoot(),
                // IonicImageCacheModule.forRoot(),
                SocketIoModule.forRoot(config),
                IonicModule.forRoot(MyApp, {
                    scrollPadding: false,
                    scrollAssist: true,
                    autoFocusAssist: false
                }),
                IonicStorageModule.forRoot({
                    name: '__ionic3_start_theme',
                    driverOrder: ['indexeddb', 'sqlite', 'websql']
                })
            ],
            bootstrap: [IonicApp],
            entryComponents: [
                MyApp,
                SettingsPage,
                ViewimagePage,
                // CheckoutTripPage,
                HomePage,
                LoginPage,
                TabsPage,
                // PdfviewPage,
                // ChatPage,
                // VideoPage,
                GalleryPage,
                YoutubePage,
            ],
            providers: [
                StatusBar,
                Diagnostic,
                SplashScreen,
                Keyboard,
                // GlobalServiceProvider,
                // PassportServiceProvider,
                // UserServiceProvider,
                // YoutubeVideoPlayer,
                // ActivityService,
                // TripService,
                // BackgroundMode,
                PhotoLibrary,
                // WeatherProvider,
                // EmojiProvider,
                // InAppBrowser,
                // PhotoViewer,
                FileOpener,
                SocialSharing,
                File,
                LocalNotifications,
                DocumentViewer,
                FileTransfer,
                // AndroidFullScreen,
                {
                    provide: HTTP_INTERCEPTORS,
                    useClass: TokenInterceptor,
                    multi: true
                },
                // ChatServiceProvider,
                LoginProvider,
                GalleryProvider,
                YoutubeProvider,
                GalleryProvider,
                ImageProvider,
                UrlProvider
            ]
        })
    ], AppModule);
    return AppModule;
}());
export { AppModule };
//# sourceMappingURL=app.module.js.map