import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons } from '../services';
import { Api_Parent_01 } from './api_parent_01';
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api_Parent_02 extends Api_Parent_01 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons
    ) {
        super(http, Common);
    }
    //begin-hieu


}
