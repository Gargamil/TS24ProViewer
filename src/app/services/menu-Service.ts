
import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Injectable()
export class MenuService {
    constructor(public translate: TranslateService) {
    }
    getTranslate(translate: any) {
        this.translate = translate;
    }
    getLanguage(): Promise<any[]> {
        return new Promise<any>((resolve, reject) => {
            this.translate.get([
                "LANG_OBJECT",
            ]).subscribe(
                (values) => {
                    resolve(values.LANG_OBJECT);
                });
        }).then(data => { { return data } });
    }

    getAllThemes(callBack: (arr: any[]) => any): void {
        // return [
        //     {"title" : "Trang chủ", "icon" : "icon-format-align-justify", "component": "", "singlePage":false},
        //     {"title" : "Hỏi đáp", "icon" : "icon-format-line-spacing", "component":"", "singlePage":false},
        //     {"title" : "Niêm yết thủ tục hành chính", "icon" : "icon-lock-open-outline", "listView" : false, "component":"", "singlePage":false},
        //     {"title" : "Tra cứu kết quả thủ tục hành chính", "icon" : "icon-comment-account", "listView" : false, "component":"", "singlePage":false},
        //     {"title" : "Đánh giá hài lòng", "theme"  : "imageGallery",  "icon" : "icon-apps", "listView" : false, "component":"", "singlePage":false},
        //     {"title" : "Thông báo", "theme"  : "checkBoxes",  "icon" : "icon-checkbox-marked", "listView" : false, "component":"", "singlePage":false},
        //     {"title" : "Khuyến mại 24", "theme"  : "splashScreens",  "icon" : "icon-logout", "listView" : false, "component":"", "singlePage":false},
        //   ];

        this.translate.get(["HOME_TITLE",
            "HISTORYORDERS_TITLE",
            "NOTIFICATION_TITLE",
            "USER_TITLE",
        ]).subscribe(
            (values) => {
                    callBack([
                        { "title": values.HOME_TITLE, "icon": "home",  url: '/tabs/home', },
                        { "title": values.HISTORYORDERS_TITLE, "icon": "list-box",  url: '/tabs/historyOrders',},
                        { "title": values.NOTIFICATION_TITLE, "icon": "notifications" ,  url: '/tabs/notification',}, //
                        { "title": values.USER_TITLE, "icon": "contact",  url: '/tabs/user'},
                    ]);
            });
    }
    getTitle(): string {
        return 'MuonAnGi';
    }
    getId(): string {
        throw new Error("Method not implemented.");
    }

    getDataForTheme(): any {
        return {
            "background": "assets/images/background/SIDE-MENU.png",
            "image": "assets/imgs/km24_logo.png",
        };
    };

}