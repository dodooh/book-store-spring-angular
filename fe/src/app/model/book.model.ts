import {Publisher} from './publisher.model';
import {Author} from './author.model';
import {Category} from './category.model';

export interface Book {
  bookId: string;
  name: string;
  code: string;
  translator: string;
  totalPage: string;
  price: number;
  quantity: number;
  description: string;
  dimension: string;
  publisherDate: string;
  img: string;
  publisher: Publisher;
  author: Author;
  category: Category;
}
