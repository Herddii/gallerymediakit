import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { SettingsPage } from '../settings/settings';
import { GalleryPage } from '../gallery/gallery';
import { YoutubePage } from '../youtube/youtube';
// import { ChatPage } from '../chat/chat';
import { Socket } from 'ng-socket-io';
// import { CheckoutTripPage } from '../checkout-trip/checkout-trip';
// import { VideoPage } from '../video/video';
import {Storage} from '@ionic/storage';


@IonicPage()
@Component({
  selector: 'page-tabs',
  templateUrl: 'tabs.html',
})
export class TabsPage {
	num_chat: number;
	num_gallery: number;
	num_youtube: number;

  GalleryPage=GalleryPage;
  YoutubePage=YoutubePage;
  // ChatPage=CheckoutTripPage;

  constructor(private socket: Socket, public storage: Storage) {
  	this.storage.get('num_chat').then((v) => {
  		var c = this.num_chat - v;
  		this.num_chat = c;
  	})

  }

  ionViewWillEnter(){
  	// this.socket.on('news_chat',(notif)=>{
  	// 	// console.log(notif.length);
  	// 	this.num_chat = notif.length;
  	// 	this.storage.set('num_chat',this.num_chat);
  	// })
  }

}
