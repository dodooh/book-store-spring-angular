import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {HeaderComponent} from './component/common/header/header.component';
import {SignInComponent} from './component/account/sign-in/sign-in.component';
import {SignUpComponent} from './component/account/sign-up/sign-up.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';
import {ToastrModule} from 'ngx-toastr';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {ForbiddenComponent} from './component/common/forbidden/forbidden.component';
import {SignOutComponent} from './component/account/sign-out/sign-out.component';
import {BookListComponent} from './component/book/book-list/book-list.component';
import {HomePageComponent} from './component/common/home-page/home-page.component';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {NgxPaginationModule} from 'ngx-pagination';
import {FooterComponent} from './component/common/footer/footer.component';
import {BookDetailComponent} from './component/book/book-detail/book-detail.component';
import { CartDetailComponent } from './component/cart/cart-detail/cart-detail.component';
import { PaymentDetailComponent } from './component/cart/payment-detail/payment-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    SignInComponent,
    SignUpComponent,
    ForbiddenComponent,
    SignOutComponent,
    BookListComponent,
    HomePageComponent,
    FooterComponent,
    BookDetailComponent,
    CartDetailComponent,
    PaymentDetailComponent,
  ],
  imports     : [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    NgxPaginationModule,
    ToastrModule.forRoot({
      timeOut     : 3000,
      progressBar : true,
      tapToDismiss: true
    }),
    NgbModule,
    FormsModule
  ],
  providers   : [],
  bootstrap   : [AppComponent]
})
export class AppModule {
}
