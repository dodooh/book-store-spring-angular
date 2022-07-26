import { Component, OnInit } from '@angular/core';
import {TokenStorageService} from '../token-storage.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-sign-out',
  templateUrl: './sign-out.component.html',
  styleUrls: ['./sign-out.component.css']
})
export class SignOutComponent implements OnInit {

  constructor(private tokenStorageService: TokenStorageService,
              private router: Router) { }

  ngOnInit(): void {
    setTimeout(() => {
      this.tokenStorageService.signOut();
      this.router.navigateByUrl('/').then(() =>
        window.location.reload()
      );
    }, 3000);
  }

}
