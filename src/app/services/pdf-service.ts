import { Injectable } from '@angular/core';
import { File } from '@ionic-native/file/ngx';
import { Platform } from '@ionic/angular';
import { FilePath } from '@ionic-native/file-path/ngx';
import { ConvertFileService } from './convert-file-service';

declare var cordova: any;

@Injectable()
export class PdfService {
    readonly FILE_SAVE_ERROR: number = 1;
    constructor(
        private file: File,
        public platform: Platform,
        private filePath: FilePath,
        private conver: ConvertFileService
    ) { }

    /**
     * Tạo file pdf từ html text
     * @param fileName Tên file
     * @param pdfhtml Html content
     */
    createPdfFromHtmlText(success, error, pdfhtml?: any, pdfFileName?: any) {
        pdfFileName = pdfFileName || 'myPdfFile.pdf';

        var options = {
            documentSize: 'A4',
            type: 'base64',
            landscape: 'portrait',
            fileName: pdfFileName
        };

        pdfhtml = pdfhtml || '<html><body style="font-size:120%">This is the pdf content</body></html>';
        cordova.plugins.pdf.fromData(pdfhtml, options)
            .then((base64) => {
                // To define the type of the Blob
                console.log(base64)
                var contentType = "application/pdf";
                let folderpath = this.file.dataDirectory;
                if (this.platform.is('android'))
                    folderpath = this.file.externalCacheDirectory;
                this.savebase64AsPDF(folderpath, pdfFileName, base64, contentType, success, error);
            })
            .catch((err) => error(err));
    }

    /**
     * Tạo file pdf từ uri
     * @param fileUri 
     * @param success 
     * @param error 
     */
    createPdfFromHtmlFileUri(fileUri, success, error) {
        this.file
            .resolveLocalFilesystemUrl(fileUri)
            .then(fileEntry => {
                let { name, nativeURL } = fileEntry;
                var fileName = name.substring(0, name.lastIndexOf("."));
                fileName = fileName + ".pdf";
                if (this.platform.is('android')) {
                    // Chuyển file uri thành file path
                    this.filePath.resolveNativePath(nativeURL)
                        .then((androidPath) => {
                            androidPath = this.conver.getAndroidSdcardPath(androidPath, fileEntry.fullPath);
                            this.createPdfFromHtmlFilePath(androidPath, success, error, fileName)
                        })
                        .catch(err => error(err));
                } else {
                    this.createPdfFromHtmlFilePath(nativeURL, success, error, fileName)
                }
            })
            .catch((err => error(err)));
    }

    /**
     * Tạo file pdf tử html file
     * @param htmlFilePath Đường dẫn file html
     * @param pdfFileName  Têm file pdf muốn tạo
     */
    createPdfFromHtmlFilePath(htmlFilePath: string, success, error, pdfFileName?: any) {
        pdfFileName = pdfFileName || 'myPdfFile.pdf';
        var options = {
            documentSize: 'A4',
            type: 'base64',
            landscape: 'portrait',
            fileName: pdfFileName
        };

        let path = htmlFilePath.substring(0, htmlFilePath.lastIndexOf("/") + 1);
        // console.log(path);

        if (this.platform.is('android')) {
            // Tên file trong android
            pdfFileName = (htmlFilePath.substring(htmlFilePath.lastIndexOf("/") + 1));
            pdfFileName = (pdfFileName.substring(0, pdfFileName.lastIndexOf("."))) + ".pdf";
        }
        // console.log(pdfFileName);

        cordova.plugins.pdf.fromURL(htmlFilePath, options)
            .then((base64) => {
                // To define the type of the Blob
                var contentType = "application/pdf";
                // let folderpath = this.file.dataDirectory;
                // if (this.platform.is('android'))
                //     folderpath = this.file.externalCacheDirectory;
                this.savebase64AsPDF(path, pdfFileName, base64, contentType, success, error);
            })
            .catch((err) => {
                error(err);
            });
    }

    /**
     * Create a PDF file according to its database64 content only.
     * @param folderpath {String} The folder where the file will be created
     * @param filename {String} The name of the file that will be created
     * @param content content {Base64 String} Important : The content can't contain the following string (data:application/pdf;base64). Only the base64 string is expected.
     * @param contentType 
     */
    savebase64AsPDF(folderpath, filename, content, contentType, success, error) {
        // Convert the base64 string in a Blob
        var dataBlob = this.b64toBlob(content, contentType);

        // console.log("Starting to write the file :3");
        this.writeFile(folderpath, filename, dataBlob, success, error, true);

    }

    /**
     * Ghi file pdf
     * @param folderpath 
     * @param filename 
     * @param dataBlob 
     * @param success 
     * @param error 
     * @param repeat 
     */
    private writeFile(folderpath, filename, dataBlob, success, error, repeat: boolean) {
        this.file.writeFile(folderpath, filename, dataBlob, { replace: true })
            .then((fileEntry) => {
                success(fileEntry);
            })
            .catch((err) => {
                console.log(err);
                if (repeat == true) {
                    if (err.code == 1 || err.code == 9) {
                        let path = this.file.dataDirectory;
                        if (this.platform.is('android'))
                            path = this.file.externalRootDirectory;
                        repeat = false;
                        this.writeFile(path, filename, dataBlob, success, error, repeat)
                    } else {
                        error(this.FILE_SAVE_ERROR, err);
                    }
                } else {
                    error(this.FILE_SAVE_ERROR, err);
                }
            });
    }

    /**
        * Convert a base64 string in a Blob according to the data and contentType.
        * 
        * @param b64Data {String} Pure base64 string without contentType
        * @param contentType {String} the content type of the file i.e (application/pdf - text/plain)
        * @param sliceSize {Int} SliceSize to process the byteCharacters
        * @see http://stackoverflow.com/questions/16245767/creating-a-blob-from-a-base64-string-in-javascript
        * @return Blob
     */
    b64toBlob(b64Data, contentType, sliceSize?) {
        console.log("Starting to b64toBlob");
        contentType = contentType || '';
        sliceSize = sliceSize || 512;

        var byteCharacters = atob(b64Data);
        var byteArrays = [];

        for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
            var slice = byteCharacters.slice(offset, offset + sliceSize);

            var byteNumbers = new Array(slice.length);
            for (var i = 0; i < slice.length; i++) {
                byteNumbers[i] = slice.charCodeAt(i);
            }

            var byteArray = new Uint8Array(byteNumbers);

            byteArrays.push(byteArray);
        }

        var blob = new Blob(byteArrays, { type: contentType });
        return blob;
    }
}