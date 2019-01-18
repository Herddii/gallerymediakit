import { Component } from '@angular/core';
import {IonicPage, NavController, NavParams, Platform, LoadingController} from "ionic-angular";
import {Storage} from '@ionic/storage';
import {AllPage} from '../all/all';
import {SocialSharing} from '@ionic-native/social-sharing';
import { ImageProvider } from '../../providers/image/image';
import { File } from '@ionic-native/file';
import { FileTransfer } from '@ionic-native/file-transfer';
import { FileOpener } from '@ionic-native/file-opener';
import { LocalNotifications } from '@ionic-native/local-notifications';
import { DocumentViewer, DocumentViewerOptions } from '@ionic-native/document-viewer';
import { PhotoLibrary } from '@ionic-native/photo-library';
/**
 * Generated class for the ViewimagePage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-viewimage',
  templateUrl: 'viewimage.html',
})
export class ViewimagePage {

	result;
	public fromto: any;
	public img_path: any;

  constructor(
  	private storage: Storage, 
    public nav: NavController, 
    public navParams: NavParams, 
    private socialSharing: SocialSharing,
    public gallery: ImageProvider,
    private file: File,
    public fileOpener: FileOpener,
    private transfer: FileTransfer,
    public localNotifications: LocalNotifications,
    private document: DocumentViewer,
    public platform: Platform,
    private photoLibrary: PhotoLibrary,
    public loadingCtrl: LoadingController
  	) {
  	this.result = navParams.data.content;
  }

  pushchat(value){
    // this.nav.push(CheckoutTripPage,{content: value});
  }
  goback(){
    this.nav.push(AllPage);
  }

  share(id_content,folder, id_filetype, content_file_download){
    let loading = this.loadingCtrl.create({
      content: 'Retrieving Data'
    });
    loading.present();
  let image = 'http://10.22.253.64:8000/uploads/'+folder+'/'+id_filetype+'/'+content_file_download;
    this.gallery.getImages_baru(id_content)
    .then((result) => {
      let nameFile = result[0].content_file_download;
      let urlimage = 'http://10.22.253.64:8000/uploads/'+result[0].folder+'/'+result[0].id_filetype+'/'+result[0].content_file_download;
      const transfer = this.transfer.create();
      transfer.download(urlimage, this.file.externalDataDirectory + nameFile,true).then((entry) => {
        
  
            this.socialSharing.shareViaWhatsApp(nameFile,entry.toURL(),'').then(()=>{
              console.log('key');
            }).catch(()=>{
              console.log('hai');
            });
            loading.dismiss();
          }, (error) => {
            // handle error
            console.log(error);
          });
    });
  
  }

  download(id_content){
    let loading = this.loadingCtrl.create({
      content: 'Retrieving Data'
    });
    let path = '';
if(this.platform.is('ios')){
      path = this.file.documentsDirectory;
    } else if(this.platform.is('android')){
      path = this.file.dataDirectory;
    }
    this.gallery.getImages_baru(id_content)
    .then((result) => {
      console.log(result);
      let nameFile = result[0].content_file_download;
      let urlimage = 'http://10.22.253.64:8000/uploads/'+result[0].folder+'/'+result[0].id_filetype+'/'+result[0].content_file_download;
        const transfer = this.transfer.create();
        loading.present();
          transfer.download(urlimage, path+nameFile).then((entry) => {
            console.log(entry);
            console.log('download complete: ' + entry.toURL());
            var url = entry.toURL(); 
        var album = 'ChatAndGallery';
        this.photoLibrary.saveImage(url, album);
            this.localNotifications.schedule({
              text: 'Download Complete '+nameFile,
              sound:'file://sound.mp3',
            });

            this.fileOpener.open(url, 'image/jpg')
            .then(() => console.log('File is opened'))
            .catch(e => console.log('Error opening file', e));
            loading.dismiss();
            // this.fileOpener.open(path + nameFile,'image/jpg').then(()=> console.log('file_isopen')).catch( e => console.log('error'));
          }, (error) => {
            // handle error
            console.log(error);
          });
    });
  }
  
  ionViewWillEnter() {
    let tabs = document.querySelectorAll('.show-tabbar');
    let supertabs = document.querySelectorAll('.scroll-tabs');
    let header = document.querySelectorAll('.header');
    if (tabs !== null || supertabs !== null || header !== null) {
        Object.keys(tabs).map((key) => {
            tabs[key].style.display = 'none';
        	});
        Object.keys(supertabs).map((key) => {
            supertabs[key].style.display = 'none';
        	});
        Object.keys(header).map((key) => {
            header[key].style.display = 'none';
        	});
    	}
	}

}
