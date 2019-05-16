import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ExportPDFPage } from './export-pdf.page';

describe('ExportPDFPage', () => {
  let component: ExportPDFPage;
  let fixture: ComponentFixture<ExportPDFPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ExportPDFPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ExportPDFPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
