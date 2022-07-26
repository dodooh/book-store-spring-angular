import { Component, OnInit } from '@angular/core';
import {CartDto} from '../../../model/cart-dto.model';
import {CartService} from '../cart.service';
import {Book} from '../../../model/book.model';

@Component({
  selector: 'app-cart-detail',
  templateUrl: './cart-detail.component.html',
  styleUrls: ['./cart-detail.component.css']
})
export class CartDetailComponent implements OnInit {
  cartDetails: CartDto[];
  total = 0;
  bookToDelete: Book;
  bookErrorArray: string[] = [];
  constructor(private cartService: CartService) { }

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
}
