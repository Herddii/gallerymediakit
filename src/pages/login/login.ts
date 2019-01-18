import {Component} from "@angular/core";
import {NavController, AlertController, ToastController, MenuController, ViewController} from "ionic-angular";
import {GalleryPage} from "../gallery/gallery";
import { NgForm, FormBuilder, Validators } from '@angular/forms';
import { LoginProvider } from '../../providers/login/login';
import { Http, RequestOptions, Headers } from '@angular/http';
import { IonicPage, LoadingController, Events } from 'ionic-angular';
import { TabsPage } from '../tabs/tabs';
import { Storage } from '@ionic/storage';
import { UserOptions } from '../../interfaces/user-option';

/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {


	backgrounds = [
	'assets/img/background/background-1.jpg',
	'assets/img/background/background-2.jpg',
	'assets/img/background/background-3.jpg',
	'assets/img/background/background-4.jpg'
	];
	public loginForm: any;
	private OAuth: string = '/oauth/';
	private cekoauth: string = 'api/cek'
	login: UserOptions = { email: '', password: ''};
	private url: string = 'http://10.22.253.64:8000/api/';
	data: any;

  constructor(
  	public navCtrl: NavController, 
  	public loginService: LoginProvider,
    public events: Events,
    public alertCtrl: AlertController,
    private loadingCtrl: LoadingController,
    public Storage: Storage,
    private http: Http) {
  }

  openResetPassword() {
  	console.log('Reset password clicked');
  }

  onLogin(form: NgForm) {

  	let loading = this.loadingCtrl.create({
  		content: 'Authenticating ...'
  	});
  	
  	loading.present();

  	let unc = {
  		grant_type:'password',
  		client_id:'12',
  		client_secret:'6k2vL9yt8KaugPPnJywktY2SJSUDjA6D9xeitM72',
  		username: this.login.email+'@mncgroup.com',
  		password: this.login.password,
  		scope:'*'
  	}

  	this.loginService.redirect(unc).subscribe(data=>{
  		loading.dismiss();
  		let lxz = this.loadingCtrl.create({
  			content: 'Preparing ...'
  		})
  		lxz.present();
  		this.loginService.login(this.login).subscribe(data => {
  			this.events.publish('user:login');
  			console.log(this.login.email);
  			lxz.dismiss();
  			this.navCtrl.setRoot(TabsPage);
  		},
  		error => {
  			loading.dismiss();
  			this.showError(error);
  		});
  	});


  }
  showError(error) {
  	console.log(error);
  	let alert = this.alertCtrl.create({
  		title: 'Error',
  		message: 'Wrong user or password',
  		buttons: ['OK']
  	});
  	alert.present();
  }

}
