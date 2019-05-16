import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExportExcelPage } from './export-excel.page';

describe('ExportExcelPage', () => {
  let component: ExportExcelPage;
  let fixture: ComponentFixture<ExportExcelPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExportExcelPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExportExcelPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
