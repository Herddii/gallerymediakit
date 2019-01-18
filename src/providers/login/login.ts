import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Http, Headers } from '@angular/http';

import { Events, App } from 'ionic-angular';
import { Storage } from '@ionic/storage';


@Injectable()
export class LoginProvider {
  items: any;
  _favorites: string[] = [];
  HAS_LOGGED_IN = 'hasLoggedIn';
  HAS_SEEN_TUTORIAL = 'hasSeenTutorial';
  public token: any;
  public url = 'http://10.22.253.64:8000/api/';

  constructor(
    public app: App,
		public events: Events,
		private http: Http,
		public storage: Storage,
		public authHttp: Http
  ) {
  }

  redirect(val) {
		let urlf = 'http://10.22.253.64:8000';
		return this.http.post(urlf+'/oauth/token', val)
		.map(response => response.json())
		.map(data => {
			return data;
		});		
	};
	login(login:{}) {
		return this.http.post(this.url+'login_mobile', login)
		.map(response => response.json())
		.map(data => {

			this.setAuth(data);
			this.getUser();
			return data.token;
		});		
	};

  get_user(){
		return new Promise((resolve,reject)=>{
			this.storage.get('token').then((value)=>{
				let headers = new Headers();
				headers.append('Content-Type','application/json');
				headers.append('Authorization', 'Bearer '+value);

				this.http.get(this.url+'details',{headers: headers}).map(res =>res.json()).subscribe(data =>{
					resolve(data);
				}, (err)=>{
					reject(err);
				});
			});
		});
	}

	getUser() {

        return this.authHttp.get(this.url+'/user'); 
	};

	private setAuth(data) {
		return this.storage.set('token', data.success.token);
	}

}
