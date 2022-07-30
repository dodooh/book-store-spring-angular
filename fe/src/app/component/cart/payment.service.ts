import { Injectable } from '@angular/core';
import {CartDto} from '../../model/cart-dto.model';
import {CartAndDetailDto} from '../../model/cart-and-detail.model';
import {Observable} from 'rxjs';
import {HttpClient} from '@angular/common/http';
const API_URL = 'http://localhost:8080/api/payments'
@Injectable({
  providedIn: 'root'
})
export class PaymentService {

  constructor(private http: HttpClient) { }

  saveCartAndDetailAPI(cartAndDetailDto: CartAndDetailDto): Observable<any> {

    console.log(cartAndDetailDto);
    return this.http.post<any>(`${API_URL}`, cartAndDetailDto);
  }
}
