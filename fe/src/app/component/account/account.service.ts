import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(private http: HttpClient) { }

  signUp(signUpModel): Observable<any> {
    return this.http.post<any>(`http://localhost:8080/api/users/sign-up`, signUpModel);
  }

  signIn(signInModel): Observable<any> {
    return this.http.post<any>(`http://localhost:8080/api/users/sign-in`, signInModel);
  }
}
