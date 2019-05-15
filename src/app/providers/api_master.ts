import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AppSettings, Commons } from '../services';
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api_Master {
    url: string = 'https://www.xuathoadon.com.vn/tracuu.xhd/';
    _wsTS24: any = {
        url: AppSettings.URL_API,
        header: {
            headers: new HttpHeaders()
                .append('Content-Type', 'application/json')
            ,
        },
        key: {
            sKey: 'AxNC0xMC0wMyAxNzowODozN35fmZ1dkYyNktEcE15bnFBZUhUTHhZaE1VbzNMTT',
            select: 'muonangi',
            isTest: false
        },

        _convertSerialize: (obj) => {
            let str = "";
            for (var key in obj) {
                if (str != "") {
                    str += "&";
                }
                str += key + "=" + encodeURIComponent(obj[key]);
            }
            return str;
        },
        params: function () {
            return {
                strJson: '*',
                collection: null,
                condition: null,
                value: {},
                type: {
                    _FIND: 'FIND',
                    _INSERT: 'INSERT',
                    _UPDATE: 'UPDATE',
                    _FUNCTION: 'FUNC'
                },
                listStore: [],
                storeProp: {
                    name: null,
                    arg: [],
                    convert: function () {
                        this.arg.forEach(function (val, i, array) {
                            if (val == "'null'")
                                array[i] = 'null';
                        });
                        return this.name + '(' + this.arg.toString() + ')';
                    }
                },
                convertRequestFind: function () {
                    if (typeof this == 'object') {
                        //this.strJson = this.strJson;
                        this.type = this.type._FIND;

                        delete this.convertRequestStore;
                        delete this.convertRequestFind;
                        delete this.convertRequestInsert;
                        delete this.convertRequestUpdate;
                        delete this.value;
                        delete this.storeProp;
                        delete this.listStore;
                        return this;
                    }
                },
                convertRequestStore: function () {
                    if (typeof this == 'object') {
                        //this.listFunction = JSON.stringify(this.listFunction);
                        delete this.convertRequestStore;
                        delete this.convertRequestFind;
                        delete this.convertRequestInsert;
                        delete this.convertRequestUpdate;
                        delete this.strJson;
                        delete this.collection;
                        delete this.condition;
                        delete this.value;
                        delete this.type;
                        delete this.storeProp;
                        return this;
                    }
                },
                convertRequestFunction: function () {
                    if (typeof this == 'object') {
                        //this.listFunction = JSON.stringify(this.listFunction);
                        this.type = this.type._FUNCTION;
                        for (const key in this) {
                            if (this.hasOwnProperty(key)) {
                                if (key != 'type' && key != 'listStore')
                                    delete this[key];
                            }
                        }
                        return this;
                    }
                },
                convertRequestInsert: function (strJsonArray) {
                    if (typeof this == 'object') {
                        for (var i = 0; i < strJsonArray.length; i++) {
                            for (var key in strJsonArray[i]) {
                                if (typeof strJsonArray[i][key] == 'string')
                                    strJsonArray[i][key] = "'" + strJsonArray[i][key] + "'"
                            }
                        }
                        this.value = JSON.stringify(strJsonArray);
                        this.type = this.type._INSERT;


                        delete this.strJson;
                        //delete this.condition;
                        delete this.convertRequestStore;
                        delete this.convertRequestFind;
                        delete this.convertRequestInsert;
                        delete this.convertRequestUpdate;
                        delete this.storeProp;
                        delete this.listStore;
                        return this;
                    }
                },
                convertRequestUpdate: function (strJsonArray) {
                    if (typeof this == 'object') {
                        for (var i = 0; i < strJsonArray.length; i++) {
                            for (var key in strJsonArray[i]) {
                                if ((typeof strJsonArray[i][key] == 'string') || strJsonArray[i][key] == null)
                                    strJsonArray[i][key] = "'" + strJsonArray[i][key] + "'"
                            }
                        }
                        this.value = JSON.stringify(strJsonArray);
                        this.type = this.type = this._wsTS24.type._UPDATE;

                        delete this.strJson;
                        //delete this.condition;
                        delete this.convertRequestStore;
                        delete this.convertRequestFind;
                        delete this.convertRequestInsert;
                        delete this.convertRequestUpdate;
                        delete this.storeProp;
                        delete this.listStore;
                        return this;
                    }
                }

            }
        },
        wsRequestStore: (params, callBack) => {
            try {
                this.http.post(this._wsTS24.url + 'executeStore?' + this._wsTS24._convertSerialize(this._wsTS24.key), params, this._wsTS24.header).subscribe((data: any) => {
                    callBack(data);
                }, error => {
                    callBack(null);
                    console.log(this.Common.getName(() => this._wsTS24.wsRequestStore), error.message);
                });
            } catch (ex) {
                callBack(null);
                console.log(this.Common.getName(() => this._wsTS24.wsRequestStore), ex.message);
            }
        },
        wsRequestInsert: (params, callBack) => {
            try {
                this.http.post(this._wsTS24.url + 'insertTs24db?' + this._wsTS24._convertSerialize(this._wsTS24.key), params, this._wsTS24.header).subscribe((data: any) => {
                    if (!data.code.includes("XHD_1111")) {
                        console.log(data);
                    }
                    callBack(data);
                }, error => {
                    callBack(error);
                    console.log(this.Common.getName(() => this._wsTS24.wsRequestInsert), error.message);
                });
            } catch (ex) {
                callBack(ex.message);
                console.log(this.Common.getName(() => this._wsTS24.wsRequestInsert), ex.message);
            }
        },

    }
    constructor(
        protected http: HttpClient,
        //private httpNative: HTTP,
        //private loading: LoadingService,
        protected Common: Commons
    ) {

    }
    get(endpoint: string, params?: any, reqOpts?: any) {
        if (!reqOpts) {
            reqOpts = {
                params: new HttpParams()
            };
        }

        // Support easy query params for GET requests
        if (params) {
            reqOpts.params = new HttpParams();
            for (let k in params) {
                reqOpts.params = reqOpts.params.set(k, params[k]);
            }
        }

        return this.http.get(this.url + '/' + endpoint, reqOpts);
    }


    post(endpoint: string, body: any, reqOpts?: any) {
        return this.http.post(this.url + '/' + endpoint, body, reqOpts);
    }

    put(endpoint: string, body: any, reqOpts?: any) {
        return this.http.put(this.url + '/' + endpoint, body, reqOpts);
    }

    delete(endpoint: string, reqOpts?: any) {
        return this.http.delete(this.url + '/' + endpoint, reqOpts);
    }

    patch(endpoint: string, body: any, reqOpts?: any) {
        return this.http.patch(this.url + '/' + endpoint, body, reqOpts);
    }

    callStoreDemo(callBack) {
        let params = new this._wsTS24.params();
        params.storeProp.name = 'usp_restaurants_demo';
        params.listStore.push(params.storeProp.convert());
        this._wsTS24.wsRequestStore(params.convertRequestStore(), function (data) {
            if (data != null || undefined) {
                if (data.code.includes("XHD_1111")) {
                    data.listCommon = JSON.parse(data.objResponse)[params.listStore[0]];
                    if (data.listCommon) {
                        //if (data.listCommon.length > 0)
                        //console.log(data.listCommon);
                        callBack(data.listCommon);
                    }
                    else
                        callBack([]);
                }
            }
            else {
                callBack([]);
            }
        })
    }

}
