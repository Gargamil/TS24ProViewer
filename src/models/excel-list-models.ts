export class ExcelListModel {
    private static instance: ExcelListModel;
    private static readonly alias_name = "ExcelListModel";
    private constructor(
    ) {

    }
    _excelList: Array<any> = [];

    static getInstance(): ExcelListModel {
        if (!ExcelListModel.instance) {
            ExcelListModel.instance = this.createInstance();
        }
        return ExcelListModel.instance;
    }
    static clearInstance() {
        localStorage.removeItem(ExcelListModel.alias_name);
        ExcelListModel.instance = null;
    }

    private static createInstance(): ExcelListModel {
        let object = new ExcelListModel();
        if (localStorage.getItem(ExcelListModel.alias_name) != undefined || null) {
            let list = JSON.parse(localStorage.getItem(ExcelListModel.alias_name));
            object._excelList = list._excelList;
        }
        return object;
    }
    public set fileList(value) {
        this._excelList = value;
    }
    public get fileList() {
        return this._excelList;
    }
    public addFile(item, isSave?: boolean) {
        // khi danh sách đã có item
        console.log(this._excelList);
        if (this._excelList.length > 0) {
            // kiểm tra sự tồn tại của item trong danh sách
            //let index = this.isExists(item, key, this._fileList);
            let index = this._excelList.findIndex(e => e.path === item.path)
            // chưa tồn tại thì thêm vào đầu danh sách
            if (index == -1) {
                this._excelList.unshift(item);
            } else {
                // Đã tồn tại thì xóa item sau đó sẽ thêm lại vào đầu danh sách
                this._excelList.splice(index, 1);
                this._excelList.unshift(item);
            }
            // Khi lenght lớn hơn 20 thì sẽ xóa tất cả các item cũ nhất
            // if (this._fileList.length > 20) {
            //     for (let i = 20; i < this._fileList.length; i++) {
            //         this._fileList.splice(i, 1);
            //     }
            // }
        } else {
            this._excelList.push(item)
        }
        if (isSave) {
            this.saveLocal();
        }
    }


    public isExistFile(item): number {
        let index = -1;
        if (this._excelList.length > 0) {
            index = this._excelList.findIndex(e => e.orginal_path === item.orginal_path);
            return index;
        }
        return index;
    }

    public isExistUri(uri: string): number {
        let index = -1;
        if (this._excelList.length > 0) {
            index = this._excelList.findIndex(e => e.orginal_path === uri);
            return index;
        }
        return index;
    }

    public removeFile(item, isSave?: boolean) {
        let index = this._excelList.findIndex(e => e.path === item.path)
        if (index >= 0) {
            this._excelList.splice(index, 1);
        }
        if (isSave) {
            this.saveLocal();
        }
    }

    saveLocal() {
        localStorage.setItem(ExcelListModel.alias_name, JSON.stringify(this));
    }
}