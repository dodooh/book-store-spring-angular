import {Component, OnInit} from '@angular/core';
import {AbstractControl, FormControl, FormGroup, ValidationErrors} from '@angular/forms';
import {SignUpModel} from '../../../model/SignUpModel';
import {AccountService} from '../account.service';
import {Router} from '@angular/router';
import {ToastrService} from 'ngx-toastr';

@Component({
  selector   : 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls  : ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  signUpForm: FormGroup;
  signUpModel: SignUpModel;

  constructor(private accountService: AccountService,
              private router: Router,
              private toast: ToastrService) {
  }

  ngOnInit(): void {
    this.signUpForm = new FormGroup({
      name           : new FormControl(''),
      username       : new FormControl(''),
      password       : new FormControl(''),
      confirmPassword: new FormControl(''),
      dateOfBirth    : new FormControl(''),
      gender         : new FormControl(0),
    }, [this.checkPassword]);
  }

  protected checkPassword(formObj: AbstractControl): ValidationErrors | null {
    const pass = formObj.get('password').value;
    const confirmPass = formObj.get('confirmPassword').value;
    return pass === confirmPass || confirmPass === '' ? null : {notSame: true};
  }

  onSubmit() {
    if (this.signUpForm.valid) {
      this.signUpModel = this.signUpForm.value;
      this.accountService.signUp(this.signUpModel).subscribe(
        data => {
          console.log(data);
          this.toast.success(`Tạo mới thành công. Tài khoản của bạn là: ${data.username}`);
        }, error => {
          console.log(error);
          this.toast.error(`Có lỗi xảy ra`);
        }, () => {
          setTimeout(() => {
            this.router.navigateByUrl('/sign-in');
          }, 3000);
        }
      );
    }
  }
}
