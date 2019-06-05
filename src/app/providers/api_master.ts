import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AppSettings, Commons } from '../services';
/**
 * Api is a generic REST Api handler. Set your API url first.
 * //------------------------------------------------cách lọc chữ ký số-----------------------------------------------
 * I.Đối với Xuat hoa đơn công ty
 * Tìm list node GetElementsByTagName("Signature") 
 * => tìm node X509Certificate và đọc value 
 * => truyền value vào hàm getINFOCKSHDDT => lấy ra object chữ ký số
 * => tìm Attributes "ID" trong list  node "Signature"
 * 1.Nếu value id là "seller" => append line trong xml 
 * <CKS>
		<CKSNguoiBan>
			<Subject>CÔNG TY TNHH SẢN XUẤT VÀ THƯƠNG MẠI MINH HƯNG LONG</Subject>
			<Serial>540717A04A31272B33F4D429523C9725</Serial>
			<Time/>
		</CKSNguoiBan>
	</CKS>
 *2.Nếu value khác => append line trong xml 
 <CKS>
 <CKSNguoiMua>
			<Subject>CÔNG TY CỔ PHẦN TS24</Subject>
			<Serial>5407E9BADE9D06DB9E6775F7CBA98859</Serial>
			<Time/>
        </CKSNguoiMua>
</CKS>

 * II.Đối với IBHXH
  Tìm list node GetElementsByTagName("Signature") 
  * => tìm node X509Certificate và đọc value 
 * => truyền value vào hàm getINFOCKSHDDT => lấy ra object chữ ký số
 * => tìm node SigningTime và đọc value ==> lấy ra thời gian cộng  GMT+7 (sẽ gán vào node con ST trong node TTCKYS)
 * => append line trong xml 
 * <TTCKYS>
		<TTCKY>
			<SI>TRƯỜNG THPT NGUYỄN DU</SI>
			<SN>5407292164174FB6428C1615AA1DCC35</SN>
			<ST>2018-12-19 15:26:17</ST>
		</TTCKY>
    </TTCKYS>
    
 * III.Đối với Tax
  Tìm list node GetElementsByTagName("Signature") 
  * => tìm node X509Certificate và đọc value 
 * => truyền value vào hàm getINFOCKSHDDT => lấy ra object chữ ký số
 * => append line trong xml 
 * <TTCKYS>
		<TTCKY>
			<SI>CÔNG TY TNHH CÔNG NGHỆ THỰC PHẨM BẮC ÂU</SI>
			<SN>09B8EABC466D873EC1E8BA0AE903F84F</SN>
		</TTCKY>
		<TTCKY>
			<SI>CÔNG TY CỔ PHẦN TS24</SI>
			<SN>5407E9BADE9D06DB9E6775F7CBA98859</SN>
		</TTCKY>...
	</TTCKYS>
 */
@Injectable()
export class Api_Master {
    url: string = 'https://www.xuathoadon.com.vn/tracuu.xhd/';
    _wsTS24: any = {
        url: AppSettings.URL_API,
        header: {
            headers: new HttpHeaders()
                .append('Content-Type', 'application/json')
                .append('Authorization', 'Basic dHMyNG9uZTpmZDQwZjIxZjYxZmI0ODA2NTg3MjE2NjkyYzMwYTFlMQ==')
            ,
        },
        key: {
            sKey: 'AxNC0xMC0wMyAxNzowODozN35fmZ1dkYyNktEcE15bnFBZUhUTHhZaE1VbzNMTT',
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
                    _UPDATE: 'UPDATE'
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
                                if (typeof strJsonArray[i][key] == 'string')
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
                    callBack(data);
                }, error => {
                    callBack(null);
                    console.log(this.Common.getName(() => this._wsTS24.wsRequestInsert), error.message);
                });
            } catch (ex) {
                callBack(null);
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

    /**
     * Lấy xsl hóa đơn điện tử
     * @param loaiWS 1 benh vien ;2:ts24 ;3:vnpt
     * @param mauIn 
     * @param maSoThue 
     */
    getXSLHDDT(loaiWS, mauIn, maSoThue = null) {
        return new Promise<any>((resolve, reject) => {
            let serialize = Object.assign({}, this._wsTS24.key);
            serialize.maSoThue = maSoThue;
            serialize.loaiWS = loaiWS;
            serialize.mauIn = mauIn;
            this.http.post(this._wsTS24.url + 'getXSLHDDT?' + this._wsTS24._convertSerialize(serialize), {}, this._wsTS24.header).subscribe((data: any) => {
                if (data != null || undefined) {
                    if (data.objKetQua.maKetQua.includes("XSL_1111")) {
                        resolve(data.base64Content);
                    }
                    else resolve(null);
                }
                else resolve(null);
            }, error => {
                resolve(null);
                console.log(this.Common.getName(() => this.getXSLHDDT), error.message);
            });
        }).then(result => { return result });
    }

    // @POST 
    // @Path("/getINFOCKSHDDT")
    // @Produces("application/json; charset=utf-8")
    // @Consumes("application/json")
    // @Secured (ROLE_ACCESS) // REST SERVICE SECURITY: BASIC AUTHENTICATION
    // Response getINFOCKSHDDT(ObjCerInput obj,@QueryParam("sKey")String sKey);

    getINFOCKSHDDT(cert_string: string) {
        return new Promise<any>((resolve, reject) => {
            let params = {
                certificate: cert_string,
            };
            this.http.post(this._wsTS24.url + 'getINFOCKSHDDT?' + this._wsTS24._convertSerialize(this._wsTS24.key), params, this._wsTS24.header).subscribe((data: any) => {
                if (data != null || undefined) {
                    if (data.objKetQua.maKetQua.includes("XSL_1111")) {
                        resolve(data.objCKS);
                    }
                    else resolve(null);
                }
                else resolve(null);
            }, error => {
                resolve(null);
                console.log(this.Common.getName(() => this.getXSLHDDT), error.message);
            });
        }).then(result => { return result });
    }

    // @POST 
    // @Path("/getXSLKETOAN")
    // @Produces("application/json; charset=utf-8")
    // @Consumes("application/json")
    // @Secured (ROLE_ACCESS) // REST SERVICE SECURITY: BASIC AUTHENTICATION
    // Response getXSLKETOAN(@QueryParam("maToKhai")String maToKhai,@QueryParam("sKey")String sKey);

    getXSLKETOAN(maToKhai) {
        return new Promise<any>((resolve, reject) => {
            let serialize = Object.assign({}, this._wsTS24.key);
            serialize.maToKhai = maToKhai;
            this.http.post(this._wsTS24.url + 'getXSLKETOAN?' + this._wsTS24._convertSerialize(serialize), {}, this._wsTS24.header).subscribe((data: any) => {
                console.log(data);
                if (data != null || undefined) {
                    if (data.objKetQua.maKetQua.includes("XSL_1111")) {
                        resolve(data.base64Content);
                    }
                    else resolve(null);
                }
                else resolve(null);
            }, error => {
                resolve(null);
                console.log(this.Common.getName(() => this.getXSLHDDT), error.message);
            });
        }).then(result => { return result });
    }

}
