import { TS24PRO_PROGRAM } from 'src/app/providers/api_parent_01';

export class RecentModel {
    private static instance: RecentModel;
    private static readonly alias_name = "RecentModel";
    private constructor(
    ) {

    }
    static getInstance(): RecentModel {
        if (!RecentModel.instance) {
            RecentModel.instance = this.createInstance();
        }
        return RecentModel.instance;
    }
    static clearInstance() {
        localStorage.removeItem(RecentModel.alias_name);
        RecentModel.instance = null;
    }
    _fileList: any = [{
        key: {
            type: TS24PRO_PROGRAM.BHXH,
            name: 'iBHXH',
        },
        listItem: []
    },
    {
        key: {
            type: TS24PRO_PROGRAM.INVOICE,
            name: 'Hóa đơn',
        },
        listItem: []
    },
    {
        key: {
            type: TS24PRO_PROGRAM.INVOICE_VNPT,
            name: 'Hóa đơn VNPT'
        },
        listItem: []
    },
    {
        key: {
            type: TS24PRO_PROGRAM.THUE,
            name: 'Thuế'
        },
        listItem: []
    },
    {
        key: {
            type: 'other',
            name: 'Khác'
        },
        listItem: []
    }];
    private static createInstance(): RecentModel {
        let object = new RecentModel();
        if (localStorage.getItem(RecentModel.alias_name) != undefined || null) {
            let list = JSON.parse(localStorage.getItem(RecentModel.alias_name));
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
        this._fileList.forEach(ele => {
            if (ele.key.type == item.type) {
                //check item đã tồn tại hay chưa,, nếu chưa thì thêm vào list item tương ứng với type
                let index = ele.listItem.findIndex(e => e.path === item.path);
                if (index == -1)
                    ele.listItem.push(item)
                else {
                    //Đã tồn tại thì xóa item sau đó sẽ thêm lại vào đầu danh sách
                    ele.listItem.splice(index, 1);
                    ele.listItem.unshift(item);
                }
            }
        });
    }

    public removeFile(item) {
        this._fileList.forEach(element => {
            if (element.key.type === item.type) {
                let index = element.listItem.findIndex(e => e.path === item.path)
                if (index > -1) {
                    element.listItem.splice(index, 1);
                }
            }
        });
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
        localStorage.setItem(RecentModel.alias_name, JSON.stringify(this));
    }
}