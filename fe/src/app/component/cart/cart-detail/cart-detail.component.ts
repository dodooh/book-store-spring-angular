import {Component, OnInit} from '@angular/core';
import {CartDto} from '../../../model/cart-dto.model';
import {CartService} from '../cart.service';
import {Book} from '../../../model/book.model';
import {CustomerService} from '../../customer/customer.service';
import {Customer} from '../../../model/customer.model';
import {ToastrService} from 'ngx-toastr';
import {Router} from '@angular/router';
import {FormGroup} from '@angular/forms';
import {TokenStorageService} from '../../account/token-storage.service';

@Component({
  selector   : 'app-cart-detail',
  templateUrl: './cart-detail.component.html',
  styleUrls  : ['./cart-detail.component.css']
})
export class CartDetailComponent implements OnInit {
  cartDetails: CartDto[];
  total = 0;
  bookToDelete: Book;
  bookErrorArray: string[] = [];

  constructor(private cartService: CartService,
              private customerService: CustomerService,
              private toast: ToastrService,
              private router: Router,
              private tokenStorageService: TokenStorageService) {
  }

  ngOnInit(): void {
    this.refreshCart();
  }

  refreshCart() {
    this.cartDetails = this.cartService.getCartFromLocalStorage();
    this.total = this.getTotal();
  }

  getBookDelete(book: Book) {
    this.bookToDelete = book;
  }

  reduceItem(book: Book) {
    this.cartService.addToCart(book, -1);
    this.refreshCart();
  }

  increaseItem(book: Book) {
    this.cartService.addToCart(book, 1);
    this.refreshCart();
  }

  confirmCart() {
    if (this.tokenStorageService.getToken() !== null) {
      this.router.navigateByUrl('/payment');


    } else {
      this.toast.warning(`Vui lòng đăng nhập để tiến hành thanh toán`);
      setTimeout(() => {
        this.router.navigateByUrl('/sign-in');
      }, 3000);
    }
  }

  private getTotal() {
    let total = 0;
    if (this.cartDetails != null) {
      this.cartDetails.forEach(item => {
        total += (item.quantity * item.book.price);
      });
    }
    return total;
  }

  removeItem(bookToDelete: Book) {
    this.cartService.removeItem(bookToDelete);
    this.refreshCart();
  }

  onSubmit() {

  }
}
