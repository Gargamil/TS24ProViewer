import { Injectable } from '@angular/core';
import { FileTransfer, FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { File } from '@ionic-native/file/ngx';
import { Platform } from '@ionic/angular';
import { FilePath } from '@ionic-native/file-path/ngx';
import { Api } from '../providers';
declare var fileChooser: any;
@Injectable()
export class FileSystems {
    constructor(private transfer: FileTransfer,
        private file: File,
        public platform: Platform,
        private filePath: FilePath,
        private api: Api
    ) { }
    fileTransfer: FileTransferObject = this.transfer.create();

    _converttoFileMIMEType(fileType: any) {
        switch (fileType) {
            case 'doc':
            case 'docx':
                fileType = 'application/msword';
                break;
            // case 'docx':
            //     fileType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
            case 'xls':
            case 'xlsx':
                fileType = 'application/vnd.ms-excel';
                break;
            // case 'xlsx':
            //     fileType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            //     break;
            case 'xml':
                fileType = 'text/xml';
                break;
            case 'htm':
            case 'html':
                fileType = 'text/html';
                break;
            case 'pdf':
                fileType = 'application/pdf';
            case 'zip':
                fileType = 'application/zip';
                break;
        }
        return fileType;
    }

    _parseFilename(originalString: any) {
        var parsed = originalString.substring(0, 100);
        var specialChars = {
            a: /[\xE0-\xE6]/g,
            A: /[\xC0-\xC6]/g,
            e: /[\xE8-\xEB]/g,
            E: /[\xC8-\xCB]/g,
            i: /[\xEC-\xEF]/g,
            I: /[\xCC-\xCF]/g,
            o: /[\xF2-\xF6]/g,
            O: /[\xD2-\xD6]/g,
            u: /[\xF9-\xFC]/g,
            U: /[\xD9-\xDC]/g,
            c: /\xE7/g,
            C: /\xC7/g,
            n: /\xF1/g,
            N: /\xD1/g,
            _: /[^A-Za-z0-9.]/g
        };

        for (var char in specialChars) {
            var regEx = specialChars[char];
            parsed = parsed.replace(regEx, char);
        }

        return parsed;
    }

    base64ToArrayBuffer(base64) {
        var binary_string = window.atob(base64);
        var len = binary_string.length;
        var bytes = new Uint8Array(len);
        for (var i = 0; i < len; i++) {
            bytes[i] = binary_string.charCodeAt(i);
        }
        var array = Array.from(new Uint8Array(bytes.buffer));
        return array;
    }

    getFileBLOBFromFullPath(filePath, fileName, callBack) {
        this.file.readAsArrayBuffer(filePath, fileName).then(file => {
            var arrayBuffer = file,
                array = Array.from(new Uint8Array(arrayBuffer));
            callBack(array);
        });
    }

    convertPathImageIntoBlob(_imagePath) {
        return new Promise<any>((resolve, reject) => {
            let fileName = "";
            this.file
                .resolveLocalFilesystemUrl(_imagePath)
                .then(fileEntry => {
                    let { name, nativeURL } = fileEntry;
                    // get path image
                    let path = nativeURL.substring(0, nativeURL.lastIndexOf("/"));
                    console.log("path", path);
                    console.log("fileName", name);

                    fileName = name;

                    return this.file.readAsArrayBuffer(path, name);
                })
                .then(buffer => {
                    // let imgBlob = new Blob([buffer], {
                    //     type: "image/jpg"
                    // });
                    // console.log(imgBlob.type, imgBlob.size);
                    let arrayBuffer = buffer,
                        imgBlob = Array.from(new Uint8Array(arrayBuffer));
                    resolve({
                        fileName,
                        imgBlob
                    });
                })
                .catch(e => reject(e));
        });
    }

    convertPathImageIntoBase64(_imagePath) {
        return new Promise<any>((resolve, reject) => {
            let fileName = "";
            this.file
                .resolveLocalFilesystemUrl(_imagePath)
                .then(fileEntry => {
                    let { name, nativeURL } = fileEntry;
                    // get path image
                    let path = nativeURL.substring(0, nativeURL.lastIndexOf("/"));
                    console.log("path", path);
                    console.log("fileName", name);

                    fileName = name;

                    return this.file.readAsDataURL(path, name);
                })
                .then(buffer => {
                    // let imgBlob = new Blob([buffer], {
                    //     type: "image/jpg"
                    // });
                    // console.log(imgBlob.type, imgBlob.size);
                    console.log(buffer);
                    resolve(buffer);
                })
                .catch(e => reject(e));
        });
    }

    /**
     * 
     * @param fileType 
     */
    openFileAndroid(fileType: any) {
        fileType = this._converttoFileMIMEType(fileType);
        return new Promise<any>((resolve, reject) => {
            if (fileType)
                fileChooser.open({ "mime": fileType }, resolve, reject);
            else
                fileChooser.open(resolve, reject);
        })
            .then(rs => {
                return rs
            })
    }

    /**
     * 
     * @param urlLink 
     * @param fileName 
     */
    download(urlLink, fileName) {
        return new Promise<any>((resolve, reject) => {
            let directory = this.file.dataDirectory;
            if (this.platform.is('android'))
                directory = this.file.externalCacheDirectory;
            fileName = this._parseFilename(fileName);
            this.fileTransfer.download(urlLink, directory + fileName).then((entry) => {
                console.log('download complete: ' + entry.toURL());
                resolve(entry.toURL());
            }, (err) => {
                // handle error
                reject(err);
            });
        });
    }
    /**
     * 
     * @param filepath file return from openFileAndroid()
     */
    GetFileInfo(filepath) {
        return new Promise((resolve, reject) => {
            let obj = {
                size: null,
                path: null,
                name: null
            };
            this.file.resolveLocalFilesystemUrl(filepath)
                .then(async rs => {
                    obj.size = await this.GetSizeFile(rs);
                    obj.path = rs.nativeURL;
                    obj.name = rs.name;
                    resolve(obj);
                })
                .then(rs => {
                    return rs
                })
        })
    }
    private GetSizeFile(file) {
        return new Promise((resolve, reject) => {
            file.getMetadata(metadata => {
                resolve(metadata.size)
            })
        })
            .then(rs => {
                return rs
            })
    }

    /**
     * Chuyển định dạng file
     * @param newFileExtend 
     * @param fileUri 
     */
    changeFileExtend(newFileExtend: string, fileUri: string) {
        this.file
            .resolveLocalFilesystemUrl(fileUri)
            .then(fileEntry => {
                console.log(fileEntry);
                let { name, nativeURL } = fileEntry;
                console.log(name);
                console.log(nativeURL);
                if (this.platform.is('android')) {
                    // Chuyển file uri thành file path
                    this.filePath.resolveNativePath(nativeURL)
                        .then((androidPath) => {
                            console.log(androidPath);

                            this.changeExtend(newFileExtend, androidPath, name);
                        })
                        .catch(err => console.log(err));
                } else {
                    this.changeExtend(newFileExtend, nativeURL, name);
                }
            })
            .catch((err => console.log(err)));
    }

    /**
     * Chuyển đuổi file
     * @param newFileExtend Định dạng mới file path
     * @param fPath Đường dẫn file
     * @param fName Tên file
     */
    private changeExtend(newFileExtend: string, fPath: string, fName: string) {
        // Lấy đường dẫn thư mục cha
        let path = fPath.substring(0, fPath.lastIndexOf("/"));
        console.log(path);
        console.log(fName);
        let fileName = fName;
        let fileNameWithOutExt = fileName.substring(0, fileName.lastIndexOf("."));
        if (this.platform.is('android')) {
            // Tên file trong android
            fileName = fPath.substring(fPath.lastIndexOf("/") + 1);
            fileNameWithOutExt = fileName.substring(0, fileName.lastIndexOf("."));
        }
        console.log(fileName);
        // let folderpath = this.file.dataDirectory;
        // if (this.platform.is('android'))
        //     folderpath = this.file.externalCacheDirectory;
        // Chuyển đuôi file bằng tại file cùng tên khác phần mở rộng
        this.file.copyFile(path, fileName, path, (fileNameWithOutExt + "." + newFileExtend))
            .then((entry) => { console.log(entry.nativeURL) })
            .catch((err) => { console.log(err) });
    }

    /**
     * 
     * @param filepath 
     */
    async GetDocXMLFromDevice(filepath) {
        return new Promise(async (resolve, reject) => {
            if (this.platform.is('android')) {
                filepath = await this._convertFilePathAndroid(filepath);
                if (filepath.includes('sdcard')) {
                    let path = filepath.substring(0, filepath.lastIndexOf("/"));
                    filepath = filepath.replace(path, path + '/');
                }
            }
            this.file
                .resolveLocalFilesystemUrl(filepath)
                .then(fileEntry => {
                    let { name, nativeURL } = fileEntry;
                    // get path
                    let path = nativeURL.substring(0, nativeURL.lastIndexOf("/"));
                    console.log("path", path);
                    console.log("fileName", name);
                    this.api.loadXMLNative(filepath).then(ressult => console.log(ressult));
                    return this.file.readAsText(path, name);
                })
                .then(buffer => {
                    let parser = new DOMParser();
                    console.log(buffer);
                    let xml = parser.parseFromString(buffer, "text/xml");
                    console.log(xml);
                    resolve(xml);
                })
                .catch(e => reject(e));
        });
    }

    private _convertFilePathAndroid(filepath) {
        return new Promise((resolve, reject) => {
            this.filePath.resolveNativePath(filepath)
                .then((androidPath) => {
                    resolve(androidPath);
                })

        }).then(result => {
            return result;
        });
    }
}