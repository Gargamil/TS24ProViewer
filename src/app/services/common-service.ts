import { Injectable } from '@angular/core';
import { LoadingController, AlertController, IonContent, ToastController } from '@ionic/angular';
import { TranslateService } from '@ngx-translate/core';
import { Platform } from '@ionic/angular';
import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';
import * as moment from 'moment';
declare var startApp: any; //Launch external app
declare var $: any;
@Injectable()
export class Commons {
    constructor(private loadingCtrl: LoadingController,
        private alertCtrl: AlertController,
        private translate: TranslateService,
        private platform: Platform,
        private toastCtrl: ToastController,
        private iab: InAppBrowser) { }
    datetime = moment;
    jquery = $;
    /**
     * @name getName
    * @description return name of function
     * @param obj 
     */
    getName(obj: any): string {
        if (obj.name) {
            return obj.name;
        }

        var funcNameRegex = /function (.{1,})\(/;
        var results = (funcNameRegex).exec(obj.toString());
        var result = results && results.length > 1 && results[1];

        if (!result) {
            funcNameRegex = /return .([^;]+)/;
            results = (funcNameRegex).exec(obj.toString());
            result = results && results.length > 1 && results[1].split(".").pop();
        }

        return result || "";
    }
    convertHours(hour: any): any {
        hour = hour || new Date().getHours();
        if (hour < 10)
            hour = '0' + hour;
        return hour;
    }
    convertMinute(min: any): any {
        min = min || new Date().getMinutes();
        if (min < 10)
            min = '0' + min;
        return min;
    }
    convertDayType(day?: any): any {
        day = day || (day != 0 ? new Date().getDay() : 0);
        switch (day) {
            case 0:
                day = 'Chủ nhật';
                break;
            case 1:
                day = 'Thứ 2';
                break;
            case 2:
                day = 'Thứ 3';
                break;
            case 3:
                day = 'Thứ 4';
                break;
            case 4:
                day = 'Thứ 5';
                break;
            case 5:
                day = 'Thứ 6';
                break;
            case 6:
                day = 'Thứ 7';
                break;

            default:
                break;

        }
        return day;
    }

    makeBaseAuth(user, pswd): any {
        var token = user + ':' + pswd;
        var hash = "";
        if (btoa) {
            hash = btoa(token);
        }
        return "Basic " + hash;
    }

    getInfoTime(strDate?: any): any {
        strDate = strDate != null ? new Date(strDate) : new Date();
        var date = strDate;
        var obj = {};
        if (this.translate.currentLang == this.translate.defaultLang) {
            obj = {
                day: this.convertDayType(date.getDay()),
                date: date.getDate(),
                hour: this.convertHours(date.getHours()),
                minute: this.convertMinute(date.getMinutes()),
                month: date.getMonth() + 1,
                year: date.getFullYear()
            };
        }
        else {
            var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var day = ['Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat'];
            obj = {
                day: day[date.getDay()],
                date: date.getDate(),
                hour: this.convertHours(date.getHours()),
                minute: this.convertMinute(date.getMinutes()),
                month: months[date.getMonth()],
                year: date.getFullYear()
            };
        }
        return obj;
    }
    _convertSerialize(obj): any {
        let str = "";
        for (var key in obj) {
            if (str != "") {
                str += "&";
            }
            str += key + "=" + encodeURIComponent(obj[key]);
        }
        return str;
    }
    /**
     * 
     * @param filePath 
     */
    getTypeFileByPath(filePath: any) {
        if (!filePath)
            return null;
        return filePath.split('').reverse().join('').toString().split('.')[0].split('').reverse().join('').toString();
    }
    /**
     * 
     * @param fullPath 
     */
    getFileNameFromPath(fullPath: any) {
        if (!fullPath)
            return fullPath;
        return fullPath.replace(/^.*[\\\/]/, '');
    }
    /**
     * @name stringParseFromDate
     */
    stringParseFromDate(date: any, type?: any, fullDate?: any) {
        type = type || 'yyyymmdd';
        fullDate = fullDate || false;
        function pad(s) { return (s < 10) ? '0' + s : s; }
        var d = null;
        if (!date)
            d = new Date();
        else {
            if (date instanceof Date)
                d = date;
            else {
                if (date.includes('.'))
                    date = date.split('.')[0];
                d = new Date(date.replace(/\s/, 'T').concat('.000+07:00'));
            }
        }
        switch (type) {
            case 'ddmmyyyy':
                if (fullDate)
                    date = [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/') + ' ' + [pad(d.getHours()), pad(d.getMinutes()), pad(d.getSeconds())].join(':');
                else
                    date = [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/');
                break;
            case 'yyyymmdd':
                if (fullDate)
                    date = [d.getFullYear(), pad(d.getMonth() + 1), pad(d.getDate())].join('-') + ' ' + [pad(d.getHours()), pad(d.getMinutes()), pad(d.getSeconds())].join(':');
                else
                    date = [d.getFullYear(), pad(d.getMonth() + 1), pad(d.getDate())].join('-');
                break;
            case 'ddmmyyyhhmm':
                date = [pad(d.getDate()), pad(d.getMonth() + 1), d.getFullYear()].join('/') + ' ' + [pad(d.getHours()), pad(d.getMinutes())].join(':');
                break;

        }
        return date;


    }
    genRandomNumberString(numberRan, type?: any) {
        numberRan = numberRan || 5;
        type = type || 'all';
        var text = "", possible = "";
        switch (type) {
            case 'all':
                possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                break;
            case 'num':
                possible = "0123456789";
                break;
            case 'str':
                possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                break;
        }

        for (var i = 0; i < numberRan; i++)
            text += possible.charAt(Math.floor(Math.random() * possible.length));

        return text;
    }

    randomBackground(listBackground) {
        if (typeof listBackground !== 'object')
            return null;
        return listBackground[Math.floor(Math.random() * listBackground.length)];
    }

    dialog = {
        alert: async (message?: string) => {
            this.translate.get(["NOTIFICATION_TITLE"]).subscribe(async values => {
                let alert = await this.alertCtrl.create({
                    header: values.NOTIFICATION_TITLE,
                    subHeader: message,
                    buttons: ['OK']
                });
                await alert.present();
            });

        },
        confirm: async (message?: string, func_ok?: any, func_cancel?: any) => {
            this.translate.get(["NOTIFICATION_TITLE", "CONFIRM"]).subscribe(async values => {
                const alert = await this.alertCtrl.create({
                    header: values.NOTIFICATION_TITLE,
                    message: message,
                    buttons: [
                        {
                            text: values.CONFIRM.CANCEL,
                            role: 'cancel',
                            //cssClass: 'secondary',
                            handler: () => {
                                if (typeof func_cancel == "function")
                                    func_cancel();

                            }
                        }, {
                            text: values.CONFIRM.OK,
                            handler: () => {
                                if (typeof func_ok == "function")
                                    func_ok();
                            }
                        }
                    ]
                });

                await alert.present();
            });
        }
    }
    /**
   * @name loadPanel
  * @description loading indicator
   * @param  
   */
    loadPanel = {
        loading: false,
        show: async (message?: string) => {
            message = message || 'Loading...';
            if (!this.loadPanel.loading) {
                this.loadPanel.loading = true;
                return await this.loadingCtrl.create({
                    message: message,
                    showBackdrop: true,
                }).then(loadingCtrlInstance => {
                    loadingCtrlInstance.present().then(() => {
                        if (!this.loadPanel.loading) {
                            loadingCtrlInstance.dismiss();
                        }
                    });
                });
            } else {
                return await this.loadingCtrl.getTop().then(data => {
                    data.message = message;
                });
            }
        },

        hide: async () => {
            if (this.loadPanel.loading) {
                this.loadPanel.loading = false;
                return await this.loadingCtrl.dismiss();
            }
        }
    }

    convertInt(value) {
        value = value || 0;
        return Math.round(value);
    }

    checkNight() {
        var currentdate = new Date();
        var hour = currentdate.getHours();
        if (hour > 5 && hour <= 17)
            return false;
        return true;
    }

    launchApp = {
        checkInstall: (iosSchemaName: string, androidPackageName: string) => {
            return new Promise((resolve, reject) => {
                if (!this.platform.is("desktop"))
                    this.platform.ready().then(() => {
                        var sApp = null;
                        if (this.platform.is('android')) {
                            sApp = startApp.set({ /* params */
                                "package": androidPackageName,
                                "component": [androidPackageName, androidPackageName + '.' + "MainActivity"]
                            });

                        }
                        else {
                            sApp = startApp.set(iosSchemaName);
                        }
                        sApp.check(function (values) { /* success */
                            resolve(true);
                            console.log(true);
                        }, function (error) { /* fail */
                            console.log(error);
                            reject(false);
                        });
                    });
            }).then(result => { return result; })
                .catch(error => { return error; });
        },
        checkAndStart: (iosSchemaName: string, androidPackageName: string) => {
            return new Promise((resolve, reject) => {
                if (!this.platform.is("desktop"))
                    this.platform.ready().then(() => {
                        var sApp = null;
                        if (this.platform.is('android')) {
                            sApp = startApp.set({ /* params */
                                "package": androidPackageName,
                                "component": [androidPackageName, androidPackageName + '.' + "MainActivity"]
                            });
                        }
                        else {
                            sApp = startApp.set(iosSchemaName);
                        }
                        sApp.check(function (values) { /* success */
                            resolve(true);
                            console.log(true);
                            sApp.start(function () { /* success */
                                console.log(true);
                            }, function (error) { /* fail */
                                console.log(error);
                            });
                        }, function (error) { /* fail */
                            console.log(error);
                            reject(false);
                        });
                    });
            }).then(result => { return result; })
                .catch(error => { return error; });
        },
    }
    toast = {
        showWelcome: (name?: string) => {
            this.toast.show('Chào mừng ' + name + ' đến với MuốnĂnGì')
        },
        showNoInternet: async (message, butonText: string, dismiss) => {
            let toMess = await this.toastCtrl.create({
                message: message,
                closeButtonText: butonText,
                showCloseButton: true
            });
            toMess.present();
            toMess.onDidDismiss().then(() => {
                if (dismiss) {
                    dismiss();
                }
            });
        },
        show: async (message?: string) => {
            let toast = await this.toastCtrl.create({
                message: message,
                duration: 500,
                position: 'top',
                cssClass: 'ts24-toast',
                // dismissOnPageChange: true
            });
            toast.present();
        }
    }
    CalcPercent(ori_price, sell_price) {
        ori_price = ori_price || 0;
        sell_price = sell_price || 0;
        var percent: number = ((parseInt(ori_price) - parseInt(sell_price)) * 100) / parseInt(ori_price);
        var percent2 = percent.toFixed(0);
        return percent2;
    }

    distinctArray(array, propName?: any) {
        var result = [];
        var map = new Map();
        if (propName) {
            for (var item of array) {
                if (!map.has(item[propName])) {
                    map.set(item[propName], true);
                    result.push(item);
                }
            }
            return result;
        }
        else {
            for (var item of array) {
                if (!map.has(item)) {
                    map.set(item, true);
                    result.push(item);
                }
            }
        }
        return result;
    }

    groupArray(data, fieldGroup, isGetAll?: any) {
        isGetAll = isGetAll || false;
        let listConvert = [];
        let listKeys = [];
        for (let i = 0; i < data.length; i++) {
            listKeys.push(data[i][fieldGroup]);
        }
        let keys = listKeys.filter(function (itm, i, a) {
            return i == a.indexOf(itm);
        });
        for (let i = 0; i < keys.length; i++) {
            let key = keys[i];
            if (key != null) {
                let items = [];
                for (let j = 0; j < data.length; j++) {
                    let item = data[j];
                    if (item[fieldGroup] == key) {
                        items.push(item);
                    }
                }
                if (isGetAll)
                    listConvert.push({ "key": items[0], "items": items });
                else
                    listConvert.push({ "key": key, "items": items });
            }
        }
        return listConvert;
    }

    moveToTopArray(data, fieldName, fieldValue) {
        for (var k = 0; k < data.length; k++) {
            var index = data.findIndex(function (item) {
                return item[fieldName] === fieldValue;
            });
            if (index != -1) {
                var objectTemp = data.listCommon[0];
                data.listCommon[0] = data.listCommon[index];
                data.listCommon[index] = objectTemp;
            }
        }
        return data;
    }
    CheckOpenRestaurant(start_time, end_time) {
        // let current_time = new Date().toLocaleTimeString();
        // if (start_time < current_time && end_time > current_time)
        //     return true;
        // return false
        let date = new Date();
        let minuteActiveStart = start_time.split(":")[0] * 60 + parseInt(start_time.split(":")[1]);
        let minuteActiveEnd = end_time.split(":")[0] * 60 + parseInt(end_time.split(":")[1]);
        let currentMinute = date.getHours() * 60 + date.getMinutes();
        if (currentMinute >= minuteActiveStart && currentMinute < minuteActiveEnd) {
            return true;
        }
        return false;

    }

    CreateListTime(fromTime, toTime, between, checkDate, auto?: any) {
        try {
            checkDate = checkDate || this.stringParseFromDate(new Date());
            fromTime = fromTime.split(':');
            toTime = toTime.split(':');
            auto = auto || false;
            let date, arr = [];
            date = new Date(checkDate);
            let h = date.setHours(parseInt(fromTime[0]));
            let m = date.setMinutes(parseInt(fromTime[1]));

            let toDate = new Date(checkDate);
            let toH = toDate.setHours(parseInt(toTime[0]));
            let toM = toDate.setMinutes(parseInt(toTime[1]));

            let currentDate = new Date();

            while (date.getMinutes() % between !== 0) {
                date.setMinutes(date.getMinutes() + 1);
            }

            if (auto) {
                let _m = date.getMinutes() - m;
                if (_m > 20 && _m < 30)
                    date.setMinutes(date.getMinutes() + 10);
                if (_m <= 20)
                    date.setMinutes(date.getMinutes() + 20);
                if (_m <= 10)
                    date.setMinutes(date.getMinutes() + 30);
            }

            while (date.getTime() <= toDate.getTime()) {
                if (currentDate.getTime() <= toDate.getTime()) {
                    if (date.getHours() == toTime[0]) {
                        if (date.getMinutes() <= parseInt(toTime[1]))
                            arr.push(((date.getHours() < 10) ? '0' + date.getHours() : date.getHours()) + ':' + ((date.getMinutes() < 10) ? '0' + date.getMinutes() : date.getMinutes()));
                    }
                    else
                        if (currentDate.getTime() <= date.getTime())
                            arr.push(((date.getHours() < 10) ? '0' + date.getHours() : date.getHours()) + ':' + ((date.getMinutes() < 10) ? '0' + date.getMinutes() : date.getMinutes()));
                }
                date.setMinutes(date.getMinutes() + between);
            }
            return arr;
        } catch (ex) {
            console.log(this.getName(() => this.CreateListTime) + ex);
        }
    }

    convertCurrentTime() {
        var date = new Date();
        var yr = date.getFullYear();
        var mo = date.getMonth() + 1;
        var day = date.getDate();

        var hours = date.getHours();
        var hr = hours < 10 ? '0' + hours : hours;

        var minutes = date.getMinutes();
        var min = (minutes < 10) ? '0' + minutes : minutes;

        var seconds = date.getSeconds();
        var sec = (seconds < 10) ? '0' + seconds : seconds;

        var newDateString = yr + '-' + mo + '-' + day;
        var newTimeString = hr + ':' + min + ':' + sec;

        var excelDateString = newDateString + ' ' + newTimeString;
        return excelDateString;
    }

    //InAppBrowser
    inAppBrowser = {
        create: (url_link) => {
            this.iab.create(url_link, "_blank", {
                location: this.platform.is('android') ? 'yes' : 'no',
                toolbar: 'yes',
                closebuttoncaption: 'Quay lại',
                closebuttoncolor: '#ffffff',
                enableViewportScale: 'no',
                zoom: 'no',
                hideurlbar: 'yes',
                toolbarcolor: '#d11016'
            });
        }
    }
    checkShippingTime(orderTime: any, shipTime: any): string {

        let order: Date;
        let ship: Date;

        if (orderTime instanceof Date) {
            order = orderTime;
        } else {
            order = this.convertDateStringToDate(orderTime);
        }
        if (shipTime instanceof Date) {
            ship = shipTime;
        } else {
            ship = this.convertDateStringToDate(shipTime);
        }

        let time: string;

        let diff = this.calTimeBetweenTwoDate(order, ship);
        if (diff <= 60) {
            return time = diff.toString() + " " + this.translate.instant("HISTORY_DETAIL_PAGE.HISTORY_DETAIL_MIN");
        } else {
            if (order.getDate() == ship.getDate()) {
                let min = ship.getMinutes() < 10 ? "0" + ship.getMinutes() : ship.getMinutes();
                time = this.translate.instant("HISTORY_DETAIL_PAGE.HISTORY_DETAIL_TODAY") + " " + ship.getHours() + " : " + min;
            } else {
                time = this.stringParseFromDate(ship, "ddmmyyyhhmm", true);
            }
        }
        return time;
    }
    /**
     * 
     * @param stringDate định dạng yyyy-mm-dd hh:mm:ss
     */
    convertDateStringToDate(stringDate): Date {
        let date = new Date();
        if (stringDate) {
            if (stringDate.includes('.')) {
                stringDate = stringDate.split('.')[0];
            }
            date = new Date(stringDate.replace(/\s/, 'T').concat('.000+07:00'));
        }
        return date
    }

    calTimeBetweenTwoDate(before: Date, after: Date): number {
        var one_day = 1000 * 60 * 60 * 24;
        var one_min = 1000 * 60;
        var difference_ms = after.getTime() - before.getTime();
        return Math.round(difference_ms / one_min);
    }


    formatMoney(number, places?: any, symbol?: any, thousand?: any, decimal?: any) {
        number = number || 0;
        if (number == null) number = 0;
        places = !isNaN(places = Math.abs(places)) ? places : 0;
        symbol = symbol !== undefined ? symbol : " VND";
        thousand = thousand || ".";
        decimal = decimal || ",";
        var negative = number < 0 ? "-" : "",
            i: any = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
            j = (j = i.length) > 3 ? j % 3 : 0;
        return negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
    }
}