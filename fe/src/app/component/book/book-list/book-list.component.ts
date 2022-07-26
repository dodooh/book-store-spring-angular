import {Component, OnInit} from '@angular/core';
import {Book} from '../../../model/book.model';
import {BookService} from '../book.service';
import {CartService} from '../../cart/cart.service';
import {ToastrService} from 'ngx-toastr';

@Component({
  selector   : 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls  : ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  bookList: Book[];
  dictMap = {};
  pageNumber = 0;
  size = 10;
  totalPages: number;
  sort = 'name';
  dir = 'asc';
  keyword = '';

  constructor(private bookService: BookService,
              private cartService: CartService,
              private toast: ToastrService) {
  }

  ngOnInit(): void {
    this.getListPagination();
  }

  getListPagination() {
    const request = {
      page   : this.pageNumber,
      size   : this.size,
      sort   : this.sort,
      dir    : this.dir,
      keyword: this.keyword
    };
    this.bookService.getList(request).subscribe(
      data => {
        console.log(data);
        this.bookList = data.content;
        this.dictMap = this.bookList.reduce((map, obj) => {
          map[obj.bookId] = 1;
          return map;
        }, {});
        console.log(this.dictMap);
        this.pageNumber = data.number;
        this.totalPages = data.totalPages;
      }, err => {
        console.log(err);
      }
    );
  }

  previousPage() {
    if ((this.pageNumber) > 0) {
      this.pageNumber -= 1;
      this.getListPagination();
    }
  }

  nextPage() {
    if ((this.pageNumber + 1) < this.totalPages) {
      this.pageNumber += 1;
      this.getListPagination();
    }
  }

  changeSize() {
    this.pageNumber = 0;
    this.getListPagination();
  }

  doSort(sortField) {
    this.sort = sortField.split(',')[0];
    this.dir = sortField.split(',')[1];
    this.getListPagination();
  }

  doSearch(keyword) {
    this.keyword = keyword;
    this.getListPagination();
  }

  decreaseQuantity(id) {
    if (this.dictMap[id] > 1) {
      this.dictMap[id] -= 1;
    }
  }

  increaseQuantity(id) {
    this.dictMap[id] += 1;
  }

  addToCart(id) {
    const quantity = this.dictMap[id];
    const book = this.bookList.find(i => i.bookId === id);
    this.cartService.addToCart(book, quantity);
    this.toast.success(`Đã thêm ${quantity} cuốn ${book.name} vào giỏ hàng`)
    this.resetQuantityDict(id);
  }

  resetQuantityDict(id) {
    this.dictMap[id] = 1;
  }
}
