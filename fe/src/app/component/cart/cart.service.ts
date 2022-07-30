import {Injectable} from '@angular/core';
import {Book} from '../../model/book.model';
import {CartDto} from '../../model/cart-dto.model';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  rate = 23500;
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

  getQuantity(): any {
    let cartList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      return JSON.parse(localStorage.getItem('cart')).length;
    }
    return 0;
  }
  changeRate(amount: number) {
    return (amount / this.rate).toFixed(2) + '';
  }

  removeItem(book: Book) {
    let cartList: CartDto[] = [];
    if (localStorage.getItem('cart')) {
      cartList = JSON.parse(localStorage.getItem('cart'));
      cartList = cartList.filter(i => i.book.bookId !== book.bookId);
      localStorage.setItem('cart', JSON.stringify(cartList));
    }
  }

  clearCart() {
    localStorage.setItem('cart', JSON.stringify({}));
  }
}
