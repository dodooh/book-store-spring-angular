import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Customer} from '../../model/customer.model';
const API_URL = 'http://localhost:8080/api/customers';
@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  constructor(private http: HttpClient) { }

  getCustomerDetail(): Observable<Customer> {
    return this.http.get<Customer>(`${API_URL}/detail`);
  }
}
