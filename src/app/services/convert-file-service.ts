import { Injectable } from '@angular/core';
import { Platform } from '@ionic/angular';
import { FilePath } from '@ionic-native/file-path/ngx';
import { File } from '@ionic-native/file/ngx';
import { Commons } from './common-service';

@Injectable()
export class ConvertFileService {
    readonly ANDROID_SDCARD_PATH = "file:///storage/";
    readonly ANDROID_SDCARD_DEFAULT_PATH = "sdcard";
    readonly FILE_PATH = "file:///";
    readonly PRIVATE_FILE_PATH = "/private/";

    readonly FILE_SAVE_ERROR: number = 1;

    constructor(
        private file: File,
        private platform: Platform,
        private filePath: FilePath,
        private common: Commons
    ) { }

    // Start Lam
    /**
     * Chuyển định dạng file
     * @param newFileExtend 
     * @param fileUri 
     */
    changeFileExtend(newFileExtend: string, fileUri: string, success, error, destination?: string) {
        this.file
            .resolveLocalFilesystemUrl(fileUri)
            .then(fileEntry => {
                let { name, nativeURL } = fileEntry;
                if (this.platform.is('android')) {
                    // Chuyển file uri thành file path
                    this.filePath.resolveNativePath(nativeURL)
                        .then((androidPath) => {
                            androidPath = this.getAndroidSdcardPath(androidPath, fileEntry.fullPath);
                            this.changeExtend(newFileExtend, androidPath, name, success, error, destination);
                        })
                        .catch(err => error("", err));
                } else {
                    this.changeExtend(newFileExtend, nativeURL, name, success, error, destination);
                }
            })
            .catch((err) => {
                error("", err);
            });
    }

    /**
     * Chuyển đuổi file
     * @param newFileExtend Định dạng mới file path
     * @param fPath Đường dẫn file
     * @param fName Tên file
     */
    private changeExtend(newFileExtend: string, fPath: string, fName: string, success, error, destination?: string) {
        // Lấy đường dẫn thư mục cha
        let path = fPath.substring(0, fPath.lastIndexOf("/") + 1);
        let fileName = fName;
        let fileNameWithOutExt = fileName.substring(0, fileName.lastIndexOf("."));
        if (this.platform.is('android')) {
            // Tên file trong android
            fileName = fPath.substring(fPath.lastIndexOf("/") + 1);
            fileNameWithOutExt = fileName.substring(0, fileName.lastIndexOf("."));
        }
        let newPath = path;
        if (destination) {
            newPath = destination;
        }
        this.copyFile(path, fileName, newPath, (fileNameWithOutExt + "." + newFileExtend), success, error, true)
    }

    /**
     * Chuyển đổi file html thành file excel 
     * @param fileUri file uri
     * @param success 
     * @param error 
     */
    convertTableHtmlToExcelByUri(fileUri: string, success, error, destination?: string) {
        this.file
            .resolveLocalFilesystemUrl(fileUri)
            .then(fileEntry => {
                let { name, nativeURL } = fileEntry;
                console.log(fileEntry)
                if (this.platform.is('android')) {
                    // Chuyển file uri thành file path
                    this.filePath.resolveNativePath(nativeURL)
                        .then((androidPath) => {
                            androidPath = this.getAndroidSdcardPath(androidPath, fileEntry.fullPath);
                            this.convertTableHtmlToExcelByFilePath(androidPath, name, success, error, destination);
                        })
                        .catch(err => error("", err));
                } else {
                    this.convertTableHtmlToExcelByFilePath(nativeURL, name, success, error, destination);
                }
            })
            .catch((err => error("", err)));
    }

    /**
     * Chuyển đổi file html thành file excel 
     * @param filePath Đường dẫn file 
     * @param fName Tên file
     * @param success 
     * @param error 
     */
    convertTableHtmlToExcelByFilePath(filePath: string, fName: string, success, error, destination?: string) {
        // Lấy đường dẫn thư mục cha
        let path = filePath.substring(0, filePath.lastIndexOf("/") + 1);
        console.log(path);
        if (destination) {
            path = destination;
        }
        let fileName = fName;
        let fileNameWithOutExt = fName.substring(0, fName.lastIndexOf("."));
        if (this.platform.is('android')) {
            // Tên file trong android
            fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            fileNameWithOutExt = fileName.substring(0, fileName.lastIndexOf("."));
        }
        this.file.readAsText(path, fileName)
            .then((text) => {
                // console.log(text)
                this.writeFile(path, (fileNameWithOutExt + ".xls"), "application/vnd.ms-excel", text, success, error, true)
            })
            .catch((err => error(this.FILE_SAVE_ERROR, err)));
    }

    /**
     * Sao chép file đến vị trí mới
     * @param filePath Đường dẫn thu mục lưu tập tin
     * @param oldName Tên file
     * @param newPath Đường dẫn mới thu mục lưu tập tin
     * @param newName Tên file mới. Có thể dùng trê cũ
     * @param success Xử lí thành công 
     * @param error Xử lí thất bại
     * @param repeat 
     */
    copyFile(filePath: string, oldName: string, newPath: string, newName: string, success, error, repeat: boolean) {
        newPath = newPath || filePath;
        newName = newName || oldName;
        console.log(newPath);
        this.file.copyFile(filePath, oldName, newPath, newName)
            .then((entry) => {
                success(entry)
            })
            .catch((err) => {
                console.log(err);
                if (repeat == true) {
                    if (err.code == 1 || err.code == 9) {
                        let path = this.file.externalCacheDirectory;
                        if (this.platform.is('android'))
                            path = this.common.PATH_ANDROID_DIRECTORY();
                        if (this.platform.is('ios')) {
                            path = this.common.PATH_IOS_DIRECTORY();
                        }
                        repeat = false;
                        this.copyFile(path, oldName, path, newName, success, error, repeat)
                    } else {
                        error(this.FILE_SAVE_ERROR, err);
                    }
                } else {
                    error(this.FILE_SAVE_ERROR, err);
                }
            });
    }

    /**
     * Ghi file
     */
    writeFile(folderpath, filename, contentType, content, success, error, repeat: boolean) {
        this.file.writeFile(folderpath, filename, content, { replace: true })
            .then((any) => {
                success(any)
            })
            .catch((err) => {
                console.log(err);
                if (repeat == true) {
                    if (err.code == 1 || err.code == 9) {
                        let path = this.file.externalCacheDirectory;
                        if (this.platform.is('android'))
                            path = this.common.PATH_ANDROID_DIRECTORY();
                        if (this.platform.is('ios')) {
                            path = this.common.PATH_IOS_DIRECTORY();
                        }
                        repeat = false;
                        this.writeFile(path, filename, contentType, content, success, error, repeat)
                    } else {
                        error(this.FILE_SAVE_ERROR, err);
                    }
                } else {
                    error(this.FILE_SAVE_ERROR, err);
                }
            });
    }

    /**
     * Lấy đường dẫn sdcard android từ uri
     * @param filepath sdcard/..
     * @param uri content://
     */
    getAndroidSdcardPath(filepath: string, uri: string): string {
        var sdCardPath = filepath;
        if (filepath.includes(this.ANDROID_SDCARD_DEFAULT_PATH)) {
            let file = uri.split(":");
            if (file.length > 1) {
                let sdcard = file[0].substring(file[0].lastIndexOf("/") + 1)
                sdCardPath = this.ANDROID_SDCARD_PATH + sdcard + "/" + file[1];
            }
        }
        console.log(sdCardPath);
        return sdCardPath;
    }
    /**
     * Lấy đường dẫn sdcard android từ tên file
     * @param filepath 
     * @param fileName (tensdcard:duongdanfile) tensdcard : là tên của sdcard trong hệ thống android
     *                                          duongdanfile: là đường dẫn đến file trong sdcard
     */
    getAndroidSdcardPathFromFileName(filepath: string, fileName: string): string {
        var sdCardPath = filepath;
        if (filepath.includes(this.ANDROID_SDCARD_DEFAULT_PATH)) {
            let file = fileName.split(":");
            if (file.length > 1) {
                let sdcard = file[0];
                sdCardPath = this.ANDROID_SDCARD_PATH + sdcard + "/" + file[1];
            }
        }
        console.log(sdCardPath);
        return sdCardPath;
    }

    /**
     * Chuyển từ private thành file
     * Ví dụ: 
     *         đầu vào (input) "/private/var/mobile/Containers/Data/Application/...""
     *         đầu ra (output) "file:///var/mobile/Containers/Data/Application/..."
     * @param fPath 
     */
    convertPrivateTofile(fPath: string): string {
        var path = fPath
        if (fPath.includes(this.PRIVATE_FILE_PATH)) {
            let replaceString = fPath.substring(0, fPath.indexOf(this.PRIVATE_FILE_PATH)) + this.PRIVATE_FILE_PATH;
            let file = fPath.replace(replaceString, this.FILE_PATH)
            path = file;
        }
        console.log(path);
        return path;
    }

    /**
     * Thay đổi uri cửa Ios
     * @param uri 
     */
    changeIOSFilePath(uri) {
        return new Promise<any>((resolve, reject) => {
            uri = this.convertPrivateTofile(uri);
            let oldPath = this.common.getDirFromPath(uri);
            let file_name = this.common.getFileNameFromPath(uri);
            this.file.copyFile(oldPath, file_name, this.common.PATH_IOS_DIRECTORY(), file_name).then(file_Entry => {
                console.log(file_Entry);
                resolve(file_Entry.nativeURL);
            }).catch(err => {
                resolve(null);
                console.log('Error', err);
            });
        }).then(rs => {
            return rs
        })
    }

}