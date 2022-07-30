import {CartDto} from './cart-dto.model';

export interface CartAndDetailDto {
  cartDetailList?: CartDto[];
  username?: string;
  nameReceive?: string;
  phoneReceive?: string;
  addressReceive?: string;
  dateCreate?: string;


}
