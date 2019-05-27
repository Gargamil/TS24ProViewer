import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomeAlertDialogPage } from './custome-alert-dialog.page';

describe('CustomeAlertDialogPage', () => {
  let component: CustomeAlertDialogPage;
  let fixture: ComponentFixture<CustomeAlertDialogPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CustomeAlertDialogPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomeAlertDialogPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
