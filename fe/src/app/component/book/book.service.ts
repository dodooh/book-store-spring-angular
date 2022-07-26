import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Book} from '../../model/book.model';
const API_URL = 'http://localhost:8080/api/books';
@Injectable({
  providedIn: 'root'
})
export class BookService {

  constructor(private http: HttpClient) { }

  getList(request): Observable<any> {
    const params  = request;
    return this.http.get<any>(`${API_URL}`, {params});
  }

  getBook(id): Observable<Book> {
    return this.http.get<Book>(`${API_URL}/${id}`);
  }

  findById(bookId: string): Observable<Book> {
    return this.http.get<any>(`${API_URL}/${bookId}`);
  }

  findRelativeById(bookId: string): Observable<Book[]> {
    return this.http.get<Book[]>(`${API_URL}/relatives/${bookId}`);
  }
}
