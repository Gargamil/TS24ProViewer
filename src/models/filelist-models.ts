export class FileListModel {
    private static instance: FileListModel;
    private static readonly alias_name = "FileListModel";
    private constructor(
    ) {

    }

    static getInstance(): FileListModel {
        if (!FileListModel.instance) {
            FileListModel.instance = this.createInstance();
        }
        return FileListModel.instance;
    }
    static clearInstance() {
        localStorage.removeItem(FileListModel.alias_name);
        FileListModel.instance = null;
    }
    _fileList: any = [];
    private static createInstance(): FileListModel {
        let object = new FileListModel();
        if (localStorage.getItem(FileListModel.alias_name) != undefined || null) {
            let list = JSON.parse(localStorage.getItem(FileListModel.alias_name));
            object._fileList = list._fileList;
        }
        return object;
    }
    public set fileList(value) {
        this._fileList = value;
    }
    public get fileList() {
        return this._fileList;
    }
    public addFile(item) {
        // khi danh sách đã có item
        if (this._fileList.length > 0) {
            // kiểm tra sự tồn tại của item trong danh sách
            //let index = this.isExists(item, key, this._fileList);
            let index = this._fileList.findIndex(e => e.name === item.name)
            // chưa tồn tại thì thêm vào đầu danh sách
            if (index == -1) {
                this._fileList.unshift(item);
            } else {
                // Đã tồn tại thì xóa item sau đó sẽ thêm lại vào đầu danh sách
                this._fileList.splice(index, 1);
                this._fileList.unshift(item);
            }
            // Khi lenght lớn hơn 20 thì sẽ xóa tất cả các item cũ nhất
            // if (this._fileList.length > 20) {
            //     for (let i = 20; i < this._fileList.length; i++) {
            //         this._fileList.splice(i, 1);
            //     }
            // }
        } else {
            this._fileList.push(item)
        }
    }

    public removeFile(item) {
        if (this._fileList.length > 0) {
            let index = this._fileList.findIndex(e => e.path === item.path)
            if (index > -1) {
                this._fileList.splice(index, 1);
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
        localStorage.setItem(FileListModel.alias_name, JSON.stringify(this));
    }
}