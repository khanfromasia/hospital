import { NgModule } from '@angular/core';

import { DiseaseTypeRoutingModule } from './disease-type-routing.module';

import { NzTableModule } from "ng-zorro-antd/table";
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { ReactiveFormsModule } from "@angular/forms";
import { NzFormModule } from "ng-zorro-antd/form";
import { NzInputModule } from "ng-zorro-antd/input";
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputNumberModule } from 'ng-zorro-antd/input-number';
import { CommonModule } from "@angular/common";
import { DiseaseTypeComponent } from './disease-type.component';


@NgModule({
  imports: [
    DiseaseTypeRoutingModule,
    NzTableModule,
    NzButtonModule,
    NzModalModule,
    ReactiveFormsModule,
    NzFormModule,
    NzInputModule,
    NzInputNumberModule,
    NzIconModule,
    CommonModule,
  ],
  declarations: [DiseaseTypeComponent],
  exports: [DiseaseTypeComponent],
})
export class DiseaseTypeModule { }
