import { Injectable } from '@angular/core';
import { FileTransfer, FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { File } from '@ionic-native/file/ngx';
import { Platform } from '@ionic/angular';
declare var fileChooser: any;
@Injectable()
export class FileSystems {
    constructor(private transfer: FileTransfer,
        private file: File,
        public platform: Platform,
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
        });
    }

    /**
     * 
     * @param urlLink 
     * @param fileName 
     * @param success 
     * @param error 
     */
    download(urlLink, fileName, success, error) {
        let directory = this.file.dataDirectory;
        if (this.platform.is('android'))
            directory = this.file.externalCacheDirectory;
        fileName = this._parseFilename(fileName);
        this.fileTransfer.download(urlLink, directory + fileName).then((entry) => {
            console.log('download complete: ' + entry.toURL());
            success(0);
        }, (err) => {
            // handle error
            error();
        });
    }
}