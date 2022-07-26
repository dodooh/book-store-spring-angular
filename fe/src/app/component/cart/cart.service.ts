import {Injectable} from '@angular/core';
import {Book} from '../../model/book.model';
import {CartDto} from '../../model/cart-dto.model';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor() {
  }


  addToCart(book: Book, quantity: number) {
    let cartList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartList = JSON.parse(localStorage.getItem('cart'));
    }
    const index = cartList.findIndex(e => e.book.bookId === book.bookId);
    if (index !== -1) {
      if (cartList[index].quantity + quantity > 0) {
        cartList[index].quantity += quantity;
      }
    } else {
      cartList.push({book, quantity});
    }
    localStorage.setItem('cart', JSON.stringify(cartList));
  }

  getCartFromLocalStorage() {
    let cartList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartList = JSON.parse(localStorage.getItem('cart'));
    }
    return cartList;
  }

  removeItem(book: Book) {
    let cartList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartList = JSON.parse(localStorage.getItem('cart'));
      cartList = cartList.filter(i => i.book.bookId !== book.bookId);
      localStorage.setItem('cart', JSON.stringify(cartList));
    }
  }
}
