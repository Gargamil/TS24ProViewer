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
    INVOICE = 'xslts24/',
    INVOICE_VNPT = 'xslvnpt/',
    KETOAN = 'xslketoan/'
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
    async getFilePathXSL(program_name: TS24PRO_PROGRAM, file_name) {
        return new Promise<any>(async (resolve, reject) => {
            let pathXSL = "";
            switch (program_name) {
                case TS24PRO_PROGRAM.INVOICE_VNPT:
                    pathXSL = await this.getXSLHDDT(3, file_name);
                    break;
                case TS24PRO_PROGRAM.INVOICE:
                    pathXSL = await this.getXSLHDDT(2, file_name);
                    break;
                case TS24PRO_PROGRAM.KETOAN:
                    pathXSL = await this.getXSLKETOAN(file_name);
                    break;
                default:
                    pathXSL = this.url + program_name + file_name + '.xsl';
                    break;
            }
            resolve(pathXSL);
        }).then(result => { return result });
    }

    /**
     * Hàm trả về key trong enum TS24PRO_PROGRAM
     * @param key 
     */
    getKeyTS24PRO_PROGRAM(key) {
        let key_result = null;
        for (var entry in TS24PRO_PROGRAM) {
            if (TS24PRO_PROGRAM[entry] == key)
                key_result = entry;
        }
        return key_result;
    }


}
