import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons, AppSettings } from '../services';
import { Api_Master } from './api_master';
import { Md5 } from 'ts-md5/dist/md5';

/**
 * Api is a generic REST Api handler. Set your API url first.
 */
export enum TS24PRO_PROGRAM {
    THUE = 'xsl/thue/tkhai/',
    BHXH = 'xsl/ibh/',
    INVOICE = 'xslts24/'
}
@Injectable()
export class Api_Parent_01 extends Api_Master {

    constructor(
        protected http: HttpClient,
        protected Common: Commons
    ) {
        super(http, Common);
    }
    /**
     * 
     * @param program_name 
     */
    getFilePathXSL(program_name: TS24PRO_PROGRAM, file_name) {
        return this.url + program_name + file_name + '.xsl';
    }

}
