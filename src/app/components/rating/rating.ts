import { Component, Input, Output, EventEmitter } from '@angular/core';
@Component({
    selector: 'ts24-rating',
    templateUrl: 'rating.html',
    styleUrls: ['./rating.scss'],
})
export class RatingComponent {
    @Input() ratingRange: number = 5;
    @Input() rating: number = 0;
    @Input() size: number = 10;
    @Input() readonly: boolean = false;
    @Output() clicked: EventEmitter<number> = new EventEmitter<number>();
    stars: Array<any> = [];

    constructor() {
        this.initStar();
    }
    private initStar() {
        this.stars = [];
        for (let i = 0; i < this.ratingRange; i++) {
            this.stars.push(i + 1);
        }
    }

    private onItemClick(index) {
        if(!this.readonly)
        {
        this.rating = index + 1;
        this.clicked.emit(this.rating);
        }
    }
}
