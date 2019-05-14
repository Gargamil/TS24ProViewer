import { Directive, ElementRef, Renderer } from '@angular/core';
import { IonContent } from '@ionic/angular';

@Directive({
    selector: '[elastic-header]'
})
export class ElasticHeader {

    scrollerHandle: any;
    header: any;
    headerHeight: any;
    translateAmt: any;
    scaleAmt: any;
    scrollTop: any;
    lastScrollTop: any;
    ticking: any;
    elIonHeader: any;
    constructor(public scroll: IonContent, public element: ElementRef, public renderer: Renderer) {
        console.log(element);
    }

    ngOnInit() {
        let shadowRoot = this.element.nativeElement.shadowRoot;
        this.scrollerHandle = shadowRoot.querySelector(".inner-scroll");
        let that = this;
          this.scroll.getScrollElement().then((element: HTMLElement) => {
            window.addEventListener('resize', () => {
                that.headerHeight = that.scrollerHandle.clientHeight;
            }, false);
            that.scrollerHandle.addEventListener('scroll', (ev) => {
                if (!that.ticking) {
                    window.requestAnimationFrame(() => {
                        that.updateElasticHeader();
                    });
                }
    
                that.ticking = true;
    
            });
            that.header = that.element.nativeElement.querySelector("#elastic-header");
            that.elIonHeader = that.element.nativeElement.parentElement.firstElementChild;
            that.headerHeight = that.header.clientHeight;
            that.ticking = false;

            //that.renderer.setElementStyle(that.header, 'webkitTransformOrigin', 'center bottom');
           // that.renderer.setElementStyle(that.header, 'webkitTransformOrigin', 'center bottom');
        });
        // this.scroll.getScrollElement().then((element: HTMLElement) => {
        //     that.scrollerHandle = element;
        //     window.addEventListener('resize', () => {
        //         that.headerHeight = that.scrollerHandle.clientHeight;
        //     }, false);
        //     that.scrollerHandle.addEventListener('scroll', (ev) => {
        //         if (!that.ticking) {
        //             window.requestAnimationFrame(() => {
        //                 that.updateElasticHeader();
        //             });
        //         }

        //         that.ticking = true;

        //     });
        //     that.header = that.element.nativeElement.querySelector("#elastic-header");
        //     that.elIonHeader = that.element.nativeElement.parentElement.firstElementChild;
        //     that.headerHeight = that.header.clientHeight;
        //     that.ticking = false;

        //     that.renderer.setElementStyle(that.header, 'webkitTransformOrigin', 'center bottom');
        // });

    }

    updateElasticHeader() {

        this.scrollTop = this.scrollerHandle.scrollTop;

        if (this.scrollTop >= 0) {
            this.translateAmt = (this.scrollTop / 2);
            this.scaleAmt = 1;
        } else {
            this.translateAmt = 0;
            this.scaleAmt = -this.scrollTop / this.headerHeight + 1;
        }
        //active
        if (this.scrollTop >= this.header.clientHeight) {
            this.elIonHeader.style.background = "var(--ion-color-primary)";
            this.elIonHeader.style.opacity = .95;
            this.elIonHeader.style.transition = "all 0.4s";
        }
        else {
            this.elIonHeader.style.opacity = 1;
            this.elIonHeader.style.background = "transparent";
        }
       // this.renderer.setElementStyle(this.header, 'webkitTransform', 'translate3d(0,' + this.translateAmt + 'px,0) scale(' + this.scaleAmt + ',' + this.scaleAmt + ')');
        this.ticking = false;

    }

}  
