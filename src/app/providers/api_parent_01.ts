import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons, AppSettings } from '../services';
import { Api_Master } from './api_master';
import { Md5 } from 'ts-md5/dist/md5';

/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api_Parent_01 extends Api_Master {

    constructor(
        protected http: HttpClient,
        protected Common: Commons
    ) {
        super(http, Common);
    }

}
