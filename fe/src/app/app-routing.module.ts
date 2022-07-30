import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {SignUpComponent} from './component/account/sign-up/sign-up.component';
import {SignInComponent} from './component/account/sign-in/sign-in.component';
import {ForbiddenComponent} from './component/common/forbidden/forbidden.component';
import {SignOutComponent} from './component/account/sign-out/sign-out.component';
import {HomePageComponent} from './component/common/home-page/home-page.component';
import {BookDetailComponent} from './component/book/book-detail/book-detail.component';
import {CartService} from './component/cart/cart.service';
import {CartDetailComponent} from './component/cart/cart-detail/cart-detail.component';
import {PaymentDetailComponent} from './component/cart/payment-detail/payment-detail.component';
import {AuthGuard} from './component/account/auth.guard';


const routes: Routes = [
  {path: 'sign-up', component: SignUpComponent},
  {path: 'sign-in', component: SignInComponent},
  {path: 'sign-out', component: SignOutComponent},
  {path: 'forbidden', component: ForbiddenComponent},
  {path: 'home', component: HomePageComponent},
  {path: 'cart', component: CartDetailComponent},
  {path: 'payment', component: PaymentDetailComponent, canActivate:[AuthGuard],data:{
      roles: ["ROLE_USER"]
    }},
  {path: 'book/:bookID', component: BookDetailComponent},
  // {path: '**', component: ForbiddenComponent},
  {path: '', pathMatch: 'full', redirectTo: 'home'}

];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    scrollPositionRestoration: 'enabled'
  })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
