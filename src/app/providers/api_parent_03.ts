import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons } from '../services';
import { Api_Parent_02 } from './api_parent_02';
import { HTTP } from '@ionic-native/http/ngx';
@Injectable()
export class Api_Parent_03 extends Api_Parent_02 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons,
        protected httpNavite: HTTP
    ) {
        super(http, Common, httpNavite);
    }

    //begin-lam
}


