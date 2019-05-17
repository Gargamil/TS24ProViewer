import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons, AppSettings } from '../services';
import { Api_Master } from './api_master';
import { Md5 } from 'ts-md5/dist/md5';
import { HTTP } from '@ionic-native/http/ngx';

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
        protected Common: Commons,
        protected httpNavite: HTTP
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

    loadXMLNative(pathUrl) {
        return new Promise((resolve, reject) => {
            this.httpNavite.get(pathUrl, {}, {}).then((results: any) => {
                if (results.status == 200) {
                    let parser = new DOMParser();
                    let xml = parser.parseFromString(results.data, "text/xml");
                    console.log(xml);
                    resolve(xml);
                }
                else resolve(null);
            });
        })
            .then(rs => {
                return rs
            });
    }

}
