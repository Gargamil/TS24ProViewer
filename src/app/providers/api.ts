import { Api_Parent_03 } from './api_parent_03';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons } from '../services';
import { HTTP } from '@ionic-native/http/ngx';
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api extends Api_Parent_03 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons,
        protected httpNavite: HTTP
    ) {
        super(http, Common, httpNavite);
    }

}
