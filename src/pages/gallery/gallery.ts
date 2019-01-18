import {Component, ViewChild, NgZone} from "@angular/core";
import {IonicPage, Modal, NavController, ModalController, LoadingController, AlertController, Events, Platform, ToastController, Content, NavParams } from "ionic-angular";
// import {TripService} from "../../services/trip-service";
// import {TripDetailPage} from "../trip-detail/trip-detail";
import {SettingsPage} from "../settings/settings";
import {ImagedetailPage} from "../imagedetail/imagedetail";
import { Http, Headers, RequestOptions } from '@angular/http';
import { HttpHeaders  } from '@angular/common/http';
import {HomePage} from "../home/home";
// import {RegisterPage} from "../register/register";
import { GalleryProvider } from '../../providers/gallery/gallery';
import {LoginProvider} from '../../providers/login/login';
import { Storage } from '@ionic/storage';
import { SortprogramPipe } from "../../pipes/sortprogram/sortprogram";
// import { PhotoViewer } from "@ionic-native/photo-viewer";
import { File } from '@ionic-native/file';
import { DocumentViewer, DocumentViewerOptions } from '@ionic-native/document-viewer';
import { FileTransfer } from '@ionic-native/file-transfer';
import { FileOpener } from '@ionic-native/file-opener';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { TabsPage } from '../tabs/tabs';
// import { CacheService } from 'ionic-cache';
import { Observable } from 'rxjs';
import { SafeResourceUrl, DomSanitizer } from '@angular/platform-browser';
import { SuperTabs } from 'ionic2-super-tabs';
import {ModalprofilePage} from '../modalprofile/modalprofile';

@IonicPage()
@Component({
  selector: 'page-gallery',
  templateUrl: 'gallery.html',
})
export class GalleryPage {
  prfile: any =[];
  option = {
    dragThreshold: '110',
    allowElementScroll: true
  }
  pages = [
    { pageName: 'AllPage', title: 'All', id: 'alltab'},
    { pageName: 'ProgramPage', title: 'Program', id: 'programtab'},
    { pageName: 'RateCardPage', title: 'Rate Card', id: 'ratecardtab'},
    { pageName: 'SpecialOffersPage', title: 'Special Offers', id: 'SpecialOfferstab'}
  ];

 
  selectedTab = 0;
  @ViewChild(SuperTabs) superTabs: SuperTabs;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    private alertCtrl: AlertController,
    private storage: Storage) { 
    this.storage.get('user_details').then((dta)=>{
      this.prfile.push(dta);
    })
  }
 
  onTabSelect(ev: any) {
   
      this.selectedTab = ev.index;
      this.superTabs.clearBadge(this.pages[ev.index].id);
    
  }

  ionViewWillEnter(){
    console.log(this.selectedTab);
  }
  ionViewDidEnter(){
    console.log(this.selectedTab);
  }

}
