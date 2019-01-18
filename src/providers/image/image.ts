import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import { Http, Headers } from '@angular/http';
import {UrlProvider} from '../url/url';

@Injectable()
export class ImageProvider {
  constructor(
    public http: Http,
  	private storage: Storage,
    public url: UrlProvider
    ) {
    console.log('Hello ImageProvider Provider');
  }

  get_all_master(){
  	return new Promise((resolve, reject) => {
  		this.storage.get('token').then((value) => {
  			let headers = new Headers();
  			headers.append('Content-Type', 'application/json');
  			headers.append('Authorization', 'Bearer '+value);

  			this.http.get(this.url.urlApi+'get_gallery_all', {headers: headers})
  			.map(res => res.json())
  			.subscribe(data => {
  				resolve(data);
  			}, (err) => {
  				reject(err);
  			}); 
  		}) 
  	});
  }

  getImages_baru(id_content){
		return new Promise((resolve, reject)=>{
			this.http.post(this.url.urlApi+'get_image',{idProgram: id_content}).map(res=>res.json()).subscribe(data => {
				resolve(data);
				console.log(data);
			}, (err)=>{
				reject(err);
			});
		});
	}

  get_all_prog(idGenre){
    return new Promise((resolve, reject) => {
      this.storage.get('token').then((value) => {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('Authorization', 'Bearer '+value);

        this.http.get(this.url.urlApi+'get_gallery_all_program/'+idGenre, {headers: headers})
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        }, (err) => {
          reject(err);
        }); 
      }) 
    });
  }
  getGenre(){
    return new Promise((resolve, reject) => {
      this.storage.get('token').then((value) => {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('Authorization', 'Bearer '+value);

        this.http.get(this.url.urlApi+'get_genre_program',{headers: headers})
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        }, (err) => {
          reject(err);
        }); 
      }) 
    });
  }

  getRateCard(){
    return new Promise((resolve, reject) => {
      this.storage.get('token').then((value) => {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('Authorization', 'Bearer '+value);
        
        this.http.get(this.url.urlApi+'get_rate_card',{headers: headers})
        .map(res => res.json())
        .subscribe(data => {
          resolve(data);
        }, (err) => {
          reject(err);
        }); 
      }) 
    });
  }

  getSpecialOffers(){
    return new Promise((resolve, reject) => {
      this.storage.get('token').then((value) => {
        let headers = new Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('Authorization', 'Bearer '+value);
        this.http.get(this.url.urlApi+'get_special_offer',{headers: headers})
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
