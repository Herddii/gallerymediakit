import { Http } from '@angular/http';
import { Injectable } from '@angular/core';

@Injectable()
export class UrlProvider {
	url: string = 'http://10.22.253.64:8000';
	urlApi: string = 'http://10.22.253.64:8000/api/';
	urlSebelas: string = 'http://172.18.11.11/mam1.1/uploads/public/';
  constructor(public http: Http) {
  }

}
