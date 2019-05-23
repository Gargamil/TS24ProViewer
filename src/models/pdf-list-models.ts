export class PdfListModel {
    private static instance: PdfListModel;
    private static readonly alias_name = "PdfListModel";
    private constructor(
    ) {

    }
    _pdfList: Array<any> = [];

    static getInstance(): PdfListModel {
        if (!PdfListModel.instance) {
            PdfListModel.instance = this.createInstance();
        }
        return PdfListModel.instance;
    }
    static clearInstance() {
        localStorage.removeItem(PdfListModel.alias_name);
        PdfListModel.instance = null;
    }

    private static createInstance(): PdfListModel {
        let object = new PdfListModel();
        if (localStorage.getItem(PdfListModel.alias_name) != undefined || null) {
            let list = JSON.parse(localStorage.getItem(PdfListModel.alias_name));
            object._pdfList = list._pdfList;
        }
        return object;
    }
    public set fileList(value) {
        this._pdfList = value;
    }
    public get fileList() {
        return this._pdfList;
    }
    public addFile(item) {
        // khi danh sách đã có item
        console.log(this._pdfList);
        if (this._pdfList.length > 0) {
            // kiểm tra sự tồn tại của item trong danh sách
            //let index = this.isExists(item, key, this._fileList);
            let index = this._pdfList.findIndex(e => e.path === item.path)
            // chưa tồn tại thì thêm vào đầu danh sách
            if (index == -1) {
                this._pdfList.unshift(item);
            } else {
                // Đã tồn tại thì xóa item sau đó sẽ thêm lại vào đầu danh sách
                this._pdfList.splice(index, 1);
                this._pdfList.unshift(item);
            }
            // Khi lenght lớn hơn 20 thì sẽ xóa tất cả các item cũ nhất
            // if (this._fileList.length > 20) {
            //     for (let i = 20; i < this._fileList.length; i++) {
            //         this._fileList.splice(i, 1);
            //     }
            // }
        } else {
            this._pdfList.push(item)
        }
    }

    public removeFile(item) {
        if (this._pdfList.length > 0) {
            let index = this._pdfList.findIndex(e => e === item)
            if (index > -1) {
                this._pdfList.splice(item);
            }
        }
    }

    //private isExists(newI, key: string, oldArrary): number {
    // let index: number = -1;
    // oldArrary.some(function (old, i) {
    //     if (old[key] == newI[key]) {
    //         index = i;
    //         return true;
    //     }
    // });
    // return index;
    //let index = oldArrary.findIndex(e => e === newI)
    // }
    saveLocal() {
        localStorage.setItem(PdfListModel.alias_name, JSON.stringify(this));
    }
}