import {Component, OnInit} from '@angular/core';
import {BookService} from '../book.service';
import {ActivatedRoute, Router, UrlSegment} from '@angular/router';
import {Book} from '../../../model/book.model';

@Component({
  selector   : 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrls  : ['./book-detail.component.css']
})
export class BookDetailComponent implements OnInit {
  quantity: number;
  bookId: string;
  book: Book;
  relativeList: Book[];
  constructor(private bookService: BookService,
              private activatedRoute: ActivatedRoute,
              private router: Router) {
  }

  ngOnInit(): void {
    this.activatedRoute.url.subscribe((s: UrlSegment[]) => {
      this.quantity = 1;
      this.bookId = s[s.length - 1].path;
      this.bookService.findById(this.bookId).subscribe(
        next => {
          this.book = next;
          this.scrollToTopOfScrollable();
        }, err => {
          this.router.navigateByUrl('not-found');
        }
      );
      this.bookService.findRelativeById(this.bookId).subscribe(
        next => {
          this.relativeList = next;
        }, error => {
          console.log(error);
        }
      );
    });
  }

  scrollToTopOfScrollable() {
    window.scrollBy(0, -window.innerHeight);
  }

  decreaseQuantity() {

  }

  increaseQuantity() {

  }

  buyNow() {

  }

  addItemToCart() {

  }
}
