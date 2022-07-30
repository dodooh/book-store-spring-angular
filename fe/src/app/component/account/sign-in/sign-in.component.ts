import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {AccountService} from '../account.service';
import {ToastrService} from 'ngx-toastr';
import {Router} from '@angular/router';
import {TokenStorageService} from '../token-storage.service';

@Component({
  selector   : 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls  : ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {
  signInForm: FormGroup;
  userName: string;
  roles: string[];
  isSignIn = false;

  constructor(private accountService: AccountService,
              private toast: ToastrService,
              private router: Router,
              private tokenStorageService: TokenStorageService) {
  }

  ngOnInit(): void {
    this.signInForm = new FormGroup({
      username: new FormControl('', Validators.required),
      password: new FormControl('', Validators.required),
    });
  }

  onSubmit() {
    if (this.signInForm.valid) {
      this.accountService.signIn(this.signInForm.value).subscribe(
        next => {
          this.tokenStorageService.saveTokenSession(next.token);
          this.tokenStorageService.saveUserSession(next);
          this.userName = this.tokenStorageService.getUser().username;
          this.roles = this.tokenStorageService.getUser().roles;
          this.isSignIn = true;
          this.toast.success(`Đăng nhập thành công. Đang chuyển về trang chủ`);
          setTimeout(() => {
            this.router.navigateByUrl('/').then(() => {
              window.location.reload();
            });
          }, 3000);
        }, error => {
          this.toast.error(`Sai mật khẩu hoặc tên đăng nhập`);
        }, () => {

        }
      );
    }

  }

}
