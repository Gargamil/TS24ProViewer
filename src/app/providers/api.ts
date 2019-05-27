import { Api_Parent_03 } from './api_parent_03';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Commons, FileSystems, ShareWithService } from '../services';
import { HTTP } from '@ionic-native/http/ngx';
/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api extends Api_Parent_03 {
    constructor(
        protected http: HttpClient,
        protected Common: Commons,
        protected httpNavite: HTTP,
        protected file: FileSystems,
        private shareWith: ShareWithService
    ) {
        super(http, Common, httpNavite, file);
    }


    shareFileHTML(uri) {
        this.shareWith.shareFileViaEmail("Tải về file đính kèm để xem nội dung.", "Chia sẻ file từ TS24pro Viewer", uri);
    }
}
