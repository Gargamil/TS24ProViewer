
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
        this.translate.get(["HOME_PAGE",
            "RECENT_PAGE",
            "EXPORTPDF_PAGE",
            "EXPORTEXCEL_PAGE"

        ]).subscribe(
            (values) => {
                callBack([
                    { "title": values.HOME_PAGE.TITLE, "icon": "home", url: '/home', },
                    { "title": values.RECENT_PAGE.TITLE, "icon": "list-box", url: '/recent', },
                    { "title": values.EXPORTPDF_PAGE.TITLE, "icon": "list-box", url: '/export-pdf', },
                    // { "title": values.EXPORTEXCEL_PAGE.TITLE, "icon": "list-box", url: '/export-excel', }
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