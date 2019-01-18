import { Component } from '@angular/core';
import { IonicPage, Modal, NavParams, NavController, ModalController, LoadingController, AlertController, Events, Platform, ToastController, Content } from "ionic-angular";
import { GalleryProvider } from '../../providers/gallery/gallery';
import { Storage } from '@ionic/storage';
import { LoginProvider } from '../../providers/login/login';
import { ImageProvider } from '../../providers/image/image';
import { SortprogramPipe } from "../../pipes/sortprogram/sortprogram";
import { File } from '@ionic-native/file';
import { DocumentViewer, DocumentViewerOptions } from '@ionic-native/document-viewer';
import { FileTransfer } from '@ionic-native/file-transfer';
import { FileOpener } from '@ionic-native/file-opener';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { ViewimagePage } from '../viewimage/viewimage';
import { UrlProvider } from '../../providers/url/url';

/**
 * Generated class for the SpecialOffersPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-special-offers',
  templateUrl: 'special-offers.html',
})
export class SpecialOffersPage {
	special_offers:any=[];
	user: any;
	token: any;
	prfile: any=[];
	sa: any=1;
	public genre: any = [];
	public limit: number=7;
	public ax: number=5;
	public safe: any;
	public activebutton: number= 20;
  constructor(
  	public navCtrl: NavController,
  	public gallery: ImageProvider,
  	public alertCtrl: AlertController,
  	private storage: Storage,
  	public login: LoginProvider,
  	public loadingCtrl: LoadingController,
    private file: File,
    private platform: Platform,
    private transfer: FileTransfer,
    public localNotifications: LocalNotifications,
    private fileopener: FileOpener,
    public nav: NavController,
    public url: UrlProvider
  	) {
  	this.get_special_offers();
  }

  doInfinite(infiniteScroll) {
    setTimeout(() => {
      this.ax += 5;
      infiniteScroll.complete();
    }, 500);
  }

  get_special_offers(){
    this.limit = 7;
    this.sa = 0;
      this.gallery.getSpecialOffers().then((data)=>{
      	this.special_offers = data;
      }).catch((err)=>{
      	this.presentAlert();
      });
    this.sa = 1;
  }

  goView(content){
    this.nav.push(ViewimagePage,{content: content});
  }

  viewPicture(content){
    return 'url('+this.url.urlSebelas+content.id_filetype+'/'+content.content_file_download+')';
  }

  tambah(value: number){
     let i = this.limit + value;
     this.limit = i;
   }

  pdfView(content){

  	let path = null;
  	let loading =  this.loadingCtrl.create({
  		content: 'Please Wait !'
  	});
  	if(this.platform.is('ios')){
  		path = this.file.documentsDirectory;
  	} else if(this.platform.is('android')){
  		path = this.file.dataDirectory;
  	}

  	this.gallery.getImages_baru(content.id_content).then((result)=>{
  		let nameFile = result[0].content_file_download;
  		let imageShow = result[0].id_filetype;
  		let folder = result[0].folder;
  		let urlimage = this.url.urlSebelas+imageShow+'/'+nameFile;
  		const transfer = this.transfer.create();
  		transfer.download(urlimage, this.file.externalRootDirectory + '/Documents/' + nameFile).then((response)=>{
  			this.localNotifications.schedule ({
  				title: 'Download Complete',
  				text: 'Please Take a look in Documents directory with name '+nameFile
  			});
  			loading.present()
  			this.fileopener.open(response.nativeURL,'application/pdf');
  			loading.dismiss(); 
  			console.log(response);
  		}, (error)=>{
  			console.log(error);
  		});     
  	}, (err)=> {
  		console.log(err);
  	});
  }

  presentAlert() {
  	let alert = this.alertCtrl.create({
  		title: 'ERROR',
  		subTitle: 'Database Error !!',
  		buttons: ['Ok']
  	});
  	alert.present();
  }

  ionViewWillEnter(){
    this.get_special_offers();
  }

}
