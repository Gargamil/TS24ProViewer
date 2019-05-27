import { Injectable } from '@angular/core';
import { SocialSharing } from '@ionic-native/social-sharing/ngx';
@Injectable()
export class ShareWithService {

    constructor(private socialSharing: SocialSharing) {

    }

    shareFileViaEmail(message, subject, filePath) {
        this.socialSharing.shareWithOptions({
            message: message,
            subject: subject,
            files: [filePath],
            chooserTitle: "Chọn ứng dụng để chia sẻ"
        }).then(
            result => {
                console.log("Share completed? " + result.completed); // On Android apps mostly return false even while it's true
                console.log("Shared to app: " + result.app); // On Android result.app is currently empty. On iOS it's empty when sharing is cancelled (result.completed=false)
            }
        ).catch(error => {
            console.log(error);
        });
    }
}