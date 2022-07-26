import {Book} from './book.model';

export interface CartDto {
  book: Book;
  quantity: number;
}
