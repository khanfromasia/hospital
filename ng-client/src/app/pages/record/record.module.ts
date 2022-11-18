import { NgModule } from '@angular/core';

import { RecordRoutingModule } from './record-routing.module';

import { NzTableModule } from "ng-zorro-antd/table";
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { ReactiveFormsModule } from "@angular/forms";
import { NzFormModule } from "ng-zorro-antd/form";
import { NzInputModule } from "ng-zorro-antd/input";
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { CommonModule } from "@angular/common";
import { RecordComponent } from './record.component';


@NgModule({
  imports: [
    RecordRoutingModule,
    NzTableModule,
    NzButtonModule,
    NzModalModule,
    ReactiveFormsModule,
    NzFormModule,
    NzInputModule,
    NzSelectModule,
    NzIconModule,
    CommonModule,
  ],
  declarations: [RecordComponent],
  exports: [RecordComponent],
})
export class RecordModule { }
