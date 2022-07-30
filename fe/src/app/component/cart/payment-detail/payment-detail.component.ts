import {Component, OnInit} from '@angular/core';
import {CartDto} from '../../../model/cart-dto.model';
import {CartService} from '../cart.service';
import {CustomerService} from '../../customer/customer.service';
import {ToastrService} from 'ngx-toastr';
import {Router} from '@angular/router';
import {TokenStorageService} from '../../account/token-storage.service';
import {FormControl, FormGroup} from '@angular/forms';
import {Customer} from '../../../model/customer.model';
import {ICreateOrderRequest, IPayPalConfig} from 'ngx-paypal';
import {PaymentService} from '../payment.service';
import {CartAndDetailDto} from '../../../model/cart-and-detail.model';
import {NgxSpinnerService} from 'ngx-spinner';

@Component({
  selector   : 'app-payment-detail',
  templateUrl: './payment-detail.component.html',
  styleUrls  : ['./payment-detail.component.css']
})
export class PaymentDetailComponent implements OnInit {
  cartDetails: CartDto[];
  total = 0;
  customerForm: FormGroup;
  bookErrorArray: string[] = [];
  totalUSD: string;
  isSuccess = false;
  isError = false;
  submitted = false;
  isCancel = false;
  rate = 23500;
  public paypalConfig ?: IPayPalConfig;
  cartAndDetailDto: CartAndDetailDto;
  private customer: Customer;

  constructor(private cartService: CartService,
              private customerService: CustomerService,
              private toast: ToastrService,
              private router: Router,
              private spinner: NgxSpinnerService,
              private paymentService: PaymentService,
              private tokenStorageService: TokenStorageService) {
  }

  ngOnInit(): void {
    this.refreshCart();
    this.getTotal();
    this.totalUSD = this.cartService.changeRate(this.total);
    this.getUserInfo();
    this.initConfig();
  }

  refreshCart() {
    this.cartDetails = this.cartService.getCartFromLocalStorage();
    this.total = this.getTotal();
  }

  getUserInfo() {
    this.customerService.getCustomerDetail().subscribe(
      data => {
        this.customer = data;
        this.customerForm = new FormGroup({
          name   : new FormControl(this.customer.name),
          phone  : new FormControl(this.customer.phone),
          address: new FormControl(this.customer.address),
        });
      }, () => {
        this.toast.warning(`Có lỗi xảy ra. Vui lòng thử lại`);
        setTimeout(() => {
          this.router.navigateByUrl('/cart');
        }, 3000);
      }
    );
  }

  private getTotal() {
    let total = 0;
    if (this.cartDetails != null) {
      this.cartDetails.forEach(item => {
        total += (item.quantity * item.book.price);
      });
    }
    return total;
  }


  private initConfig(): void {
    this.paypalConfig = {
      currency             : 'USD',
      clientId             : 'AT8UQtN25w359hCI-3YMbFi_PcFQHN42BKg0snkpR55uDDNT0Sf11UqTbXeS0WL-JU2jnpxRtyOU7p6z',
      createOrderOnClient  : (data) => <ICreateOrderRequest>{
        intent        : 'CAPTURE',
        purchase_units: [{
          amount: {
            currency_code: 'USD',
            value        : this.totalUSD,
            breakdown    : {
              item_total: {
                currency_code: 'USD',
                value        : this.totalUSD
              }
            }
          },
          items : [{
            name: 'product 1',
            quantity: '1',
            unit_amount: {
              currency_code: 'USD',
              value: this.totalUSD,
            },
          }]
        }]
      },
      advanced: {
        commit: 'true',
        extraQueryParams: [{name: 'disable-funding', value: 'credit,card'}]
      },
      style: {
        label: 'pay',
        shape: 'pill',
        layout: 'vertical',
      },
      onApprove            : (data, actions) => {
        this.spinner.show();
        console.log('onApprove - transaction was approved, but not authorized', data, actions);
        actions.order.get().then(details => {
          console.log('onApprove - you can get full order details inside onApprove: ', details);
        });

      },
      onClientAuthorization: (data) => {
        console.log('onClientAuthorization - you should probably inform your server about completed transaction at this point', data);
        this.spinner.hide();
        this.isSuccess = true;
      },
      onCancel             : (data, actions) => {
        console.log('OnCancel', data, actions);
        this.isCancel = true;

      },
      onError              : err => {
        console.log('OnError', err);
        this.isError = true;
      },
      onClick              : (data, actions) => {
        // this.changeRate();
        console.log('onClick', data, actions);
        this.resetStatus();
      }
    };
  }


  openModal() {
    this.totalUSD = this.total * this.rate + '';
  }



  private resetStatus() {

  }
}

