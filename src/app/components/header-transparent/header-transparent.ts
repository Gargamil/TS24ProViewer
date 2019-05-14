import { Directive, ElementRef, Renderer } from '@angular/core';
import { IonContent  } from '@ionic/angular';
/**
 * Generated class for the HeaderTransparentDirective directive.
 *
 * See https://angular.io/api/core/Directive for more info on Angular
 * Directives.
 */
@Directive({
  selector: '[header-transparent]' // Attribute selector
})


export class HeaderTransparent {
  scrollerHandle: any;
  header: any;
  scrollTop: any;
  elIonHeader: any;
  ticking: any;
  sel_title: any
  constructor(public scroll: IonContent , public element: ElementRef, public renderer: Renderer) {

  }
  ngOnInit() {
  
    let that = this;
    this.scroll.getScrollElement().then((element: HTMLElement) => {
        that.scrollerHandle = element;
        that.scrollerHandle.addEventListener('scroll', (ev) => {
          if (!that.ticking) {
            window.requestAnimationFrame(() => {
                that.update();
            });
        }

        that.ticking = true;

        });
        that.header = that.element.nativeElement.querySelector("#header-transparent");
        that.elIonHeader = that.element.nativeElement.parentElement.firstElementChild;
        that.sel_title = that.elIonHeader.querySelector("ion-title");
        that.sel_title.style.display = "none";
    });


  }

  update() {

    this.scrollTop = this.scrollerHandle.scrollTop;
    //active
    if (this.scrollTop >= this.header.clientHeight / 2) {
        this.elIonHeader.style.background = "var(--ion-color-primary)"; 
        this.elIonHeader.style.opacity = .95; 
        this.elIonHeader.style.transition = "all 0.4s";
        this.sel_title.style.display = "flex";
    }
    else {
        this.elIonHeader.style.opacity =1; 
        this.elIonHeader.style.background = "transparent";
        this.sel_title.style.display = "none";
    }
    this.ticking = false;
}

}
