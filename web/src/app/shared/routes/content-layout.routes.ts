import { Routes } from '@angular/router';

export const CONTENT_ROUTES: Routes = [
  {
    path: '',
    loadChildren: './modules/customer/customer.module#CustomerModule'
  }
];
