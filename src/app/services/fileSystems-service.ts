import { ConvertFileService } from './convert-file-service';
import { Injectable } from '@angular/core';
import { FileTransfer, FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { File, FileEntry } from '@ionic-native/file/ngx';
import { Platform } from '@ionic/angular';
import { FilePath } from '@ionic-native/file-path/ngx';
import { Api } from '../providers';
import { HTTP } from '@ionic-native/http/ngx';
import { HttpClient } from '@angular/common/http';
import { Commons } from '.';
import { ResolveEnd } from '@angular/router';
import { IOSFilePicker } from '@ionic-native/file-picker/ngx';
import { DocumentViewer } from '@ionic-native/document-viewer/ngx';
import { ThemeableBrowser, ThemeableBrowserOptions, ThemeableBrowserObject } from '@ionic-native/themeable-browser/ngx';
import { FileOpener } from '@ionic-native/file-opener/ngx';
declare var fileChooser: any;
@Injectable()
export class FileSystems {
    constructor(private transfer: FileTransfer,
        private file: File,
        public platform: Platform,
        private filePath: FilePath,
        protected http: HttpClient,
        protected httpNavite: HTTP,
        public common: Commons,
        private filePicker: IOSFilePicker,
        private docViewer: DocumentViewer,
        private themeableBrowser: ThemeableBrowser,
        private convertFileSerVice: ConvertFileService,
        private fileOpener: FileOpener
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
                break;
            case 'zip':
                fileType = 'application/zip';
                break;
        }
        return fileType;
    }

    _convertToUTITypeIOS(fileType: any) {
        switch (fileType) {
            case 'doc':
            case 'docx':
            case 'xls':
            case 'xlsx':
                fileType = 'public.data';
                break;
            case 'xml':
                fileType = 'public.xml';
                break;
            case 'htm':
            case 'html':
                fileType = 'public.text';
                break;
            case 'pdf':
                fileType = 'public.composite-​content';
            case 'zip':
                fileType = 'public.archive';
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
     * Mở file trên android
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
   * Mở file trên ios
   * @param fileType 
   */
    openFileIOS(fileType: any) {
        fileType = this._convertToUTITypeIOS(fileType);
        return new Promise<any>((resolve, reject) => {
            if (fileType)
                this.filePicker.pickFile(fileType).then(uri => {
                    uri = this.convertFileSerVice.convertPrivateTofile(uri);
                    //resolve(uri)
                    let oldPath = this.common.getDirFromPath(uri);
                    let file_name = this.common.getFileNameFromPath(uri);
                    this.file.copyFile(oldPath, file_name, this.file.dataDirectory, file_name).then(file_Entry => {
                        console.log(this.common.getName(this.openFileIOS), file_Entry.nativeURL);
                        resolve(file_Entry.nativeURL);
                    });
                })
                    .catch(err => {
                        resolve(null);
                        console.log('Error', err);
                    });
            else
                this.filePicker.pickFile().then(uri => {
                    uri = this.convertFileSerVice.convertPrivateTofile(uri);
                    resolve(uri)
                })
                    .catch(err => {
                        resolve(null);
                        console.log('Error', err);
                    });
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
        let currentdate = new Date();
        return new Promise((resolve, reject) => {
            let obj = {
                size: null,
                path: null,
                name: null,
                date: currentdate.getDay() + "/" + currentdate.getMonth()
                    + "/" + currentdate.getFullYear()
            };
            this.file.resolveLocalFilesystemUrl(filepath)
                .then(async rs => {
                    obj.size = await this.GetSizeFile(rs);
                    obj.path = rs.nativeURL;
                    //check if the file get from sdCard
                    if (this.platform.is("android")) {
                        let file = rs.name.split(":");
                        if (file.length > 1) {
                            rs.name = file[1];
                        }
                    }
                    obj.name = rs.name;
                    resolve(obj);
                })
                .then(rs => {
                    return rs
                })
        })
    }
    public GetSizeFile(file) {
        return new Promise((resolve, reject) => {
            file.getMetadata(metadata => {
                resolve(metadata.size)
            })
        })
            .then(rs => {
                // if ()
                return this.common.formatBytes(rs)
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

    /**Lấy content xml từ device.
     * 
     * @param filepath 
     */
    async GetDocXMLFromDevice(filepath) {
        let fileName = null;
        return new Promise(async (resolve, reject) => {
            if (this.platform.is('android')) {
                let filepath_temp = filepath;
                filepath = await this._convertFilePathAndroid(filepath);
                if (filepath.includes('sdcard')) {
                    let fileName_Origin = this.common.getFileNameFromPath(filepath_temp);
                    fileName_Origin = decodeURIComponent(fileName_Origin);
                    filepath = this.convertFileSerVice.getAndroidSdcardPathFromFileName(filepath, fileName_Origin);
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
                    fileName = name;
                    return this.file.readAsText(path, name);
                })
                .then(buffer => {
                    let parser = new DOMParser();
                    buffer = buffer.replace(/<\?*xml.*\?>/, '');
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

    async loadXMLNative(pathUrl) {
        return new Promise((resolve, reject) => {
            this.httpNavite.get(pathUrl, {}, {}).then((results: any) => {
                if (results.status == 200) {
                    let parser = new DOMParser();
                    results.data = results.data.replace(/<\?*xml.*\?>/, '');
                    let xml = parser.parseFromString(results.data, "text/xml");
                    console.log(xml);
                    resolve(xml);
                }
                else resolve(null);
            }).catch(error => {
                console.log(error);
                resolve(null);
            });
        })
            .then(rs => {
                return rs;
            });
    }

    /**
     * 
     * @param fileName 
     * @param fileData 
     * @param dirName 
     */
    writeFile(fileName, fileData, dirName = null) {
        let directory = this.file.dataDirectory;
        if (this.platform.is('android')) {
            directory = this.file.externalCacheDirectory;
            //nếu tên file lấy từ sdCard.
            let file = fileName.split(":");
            if (file.length > 1) {
                fileName = file[1];
            }
        }
        return new Promise((resolve, reject) => {
            if (dirName)
                this.file.createDir(directory, dirName, true).then(dirEntry => {
                    this.file.writeFile(dirEntry.nativeURL, fileName, fileData, { replace: true }).then((result: FileEntry) => {
                        console.log(result);
                        resolve(result.nativeURL);
                    })
                }).catch(error => {
                    console.log(error)
                })
            else
                this.file.writeFile(directory, fileName, fileData, { replace: true }).then(result => {
                    console.log(result);
                    resolve(result);
                })
        })
            .then(rs => {
                return rs;
            });
    }
    checkFileExist(path, file_name) {
        return new Promise((resolve, reject) => {
            this.file.checkFile(path + '/', file_name).then(
                (files) => {
                    resolve(true)
                })
                .catch(
                    (err) => {
                        resolve(false)
                    })
                .then(rs => { return rs })
        })
    }
    viewFileByDocumentViewer(filePath, onShow?: any, onClose?: any) {
        let fileType = this.common.getTypeFileByPath(filePath);
        fileType = this._converttoFileMIMEType(fileType);
        this.docViewer.viewDocument(filePath, fileType, {
            email: { enabled: true },
            search: { enabled: true },
            print: { enabled: true },
            bookmarks: { enabled: true },
        }, onShow, onClose);
    }
    viewHTMLFile(filePath, shareEvent?: any, exportPDFEvent?: any, exportExcelEvent?: any) {
        if (this.platform.is("ios")) {
            let fileType = this._converttoFileMIMEType(filePath);
            this.fileOpener.open(filePath, this._converttoFileMIMEType(fileType))
                .then(() => { console.log('File is opened') })
                .catch(e => { console.log('Error opening file', e); });
        }
        else {
            var images = {
                shareImage: 'assets/buttons/share.png',
                shareImagePressed: 'assets/buttons/share_pressed.png',
                closeImage: 'assets/buttons/close.png',
                closeImagePressed: 'assets/buttons/close_pressed.png',
                menuImage: 'assets/buttons/menuIOS.png',
                menuImagePressed: 'assets/buttons/menu_pressedIOS.png'
            };
            if (this.platform.is("ios")) {
                images.shareImage = 'assets/buttons/shareIOS.png';
                images.shareImagePressed = 'assets/buttons/share_pressedIOS.png';
                images.closeImage = 'assets/buttons/closeIOS.png';
                images.closeImagePressed = 'assets/buttons/close_pressedIOS.png';
                images.menuImage = 'assets/buttons/menuIOS.png';
                images.menuImagePressed = 'assets/buttons/menu_pressedIOS.png';
            }

            const options = {
                statusbar: {
                    color: '#ffffffff'
                },
                toolbar: {
                    height: 44,
                    color: '#f0f0f0ff'
                },
                title: {
                    color: '#003264ff',
                    showPageTitle: true
                },
                closeButton: {
                    wwwImage: images.closeImage,
                    wwwImagePressed: images.closeImagePressed,
                    wwwImageDensity: 2,
                    align: 'left',
                    event: 'closePressed'
                },
                customButtons: [
                    {
                        wwwImage: images.shareImage,
                        wwwImagePressed: images.shareImagePressed,
                        wwwImageDensity: 2,
                        align: 'right',
                        event: 'sharePressed'
                    }
                ],
                menu: {
                    wwwImage: images.menuImage,
                    wwwImagePressed: images.menuImagePressed,
                    wwwImageDensity: 2,
                    title: 'Options',
                    cancel: 'Cancel',
                    align: 'right',
                    items: [
                        {
                            event: '',
                            label: 'View File'
                        },
                        {
                            event: 'exportPDF',
                            label: 'Export PDF'
                        },
                        {
                            event: 'exportExcel',
                            label: 'ExportExcel'
                        }
                    ]
                },
                backButtonCanClose: true
            }


            const browser: ThemeableBrowserObject = this.themeableBrowser.create(filePath, '_blank', options);
            browser.on("sharePressed").subscribe(() => {
                if (typeof shareEvent == 'function')
                    shareEvent();
            });
            browser.on("exportPDF").subscribe(() => {
                if (typeof exportPDFEvent == 'function')
                    exportPDFEvent();
            });
            browser.on("exportExcel").subscribe(() => {
                if (typeof exportExcelEvent == 'function')
                    exportExcelEvent();
            });
        }
    }
    RemoveFile(filepath) {
        return new Promise(async (resolve, reject) => {
            if (this.platform.is('android')) {
                let filepath_temp = filepath;
                filepath = await this._convertFilePathAndroid(filepath);
                if (filepath.includes('sdcard')) {
                    let fileName_Origin = this.common.getFileNameFromPath(filepath_temp);
                    fileName_Origin = decodeURIComponent(fileName_Origin);
                    filepath = this.convertFileSerVice.getAndroidSdcardPathFromFileName(filepath, fileName_Origin);
                }
            }
            this.file
                .resolveLocalFilesystemUrl(filepath)
                .then(fileEntry => {
                    fileEntry.remove(function () {
                        console.log('Xóa file thành công');
                        resolve(true)
                    },
                        function (error) {
                            console.log('Có lỗi khi xóa file');
                            resolve(false)
                        }
                    )
                });
        })
            .then(rs => {
                return rs
            })
    }
}