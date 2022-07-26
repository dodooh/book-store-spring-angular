import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from '../../account/token-storage.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  username: string;
  isLogin = false;
  constructor(private tokenStorageService: TokenStorageService) { }

  ngOnInit(): void {
    if (this.tokenStorageService.getToken()) {
      this.isLogin = true;
      this.username = this.tokenStorageService.getUser().username;
    }
  }

}
