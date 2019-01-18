import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Http, Headers } from '@angular/http';

/*
  Generated class for the GalleryProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class GalleryProvider {
	url: string='http://10.22.253.64:8000/api/';
  constructor(
  	public http: Http,
  	private storage: Storage) {

    console.log('Hello GalleryProvider Provider');
  }

  get_all_master(){
  	return new Promise((resolve, reject) => {
  		this.storage.get('token').then((value) => {
  			let headers = new Headers();
  			headers.append('Content-Type', 'application/json');
  			headers.append('Authorization', 'Bearer '+value);

  			this.http.get('http://10.22.253.64:8000/api/get_gallery_all', {headers: headers})
  			.map(res => res.json())
  			.subscribe(data => {
  				resolve(data);
  			}, (err) => {
  				reject(err);
  			}); 
  		}) 
  	});
  }
}
