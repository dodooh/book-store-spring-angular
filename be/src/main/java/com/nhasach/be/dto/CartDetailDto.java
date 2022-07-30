package com.nhasach.be.dto;

import java.util.List;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CartDetailDto {
    private String dateCreate;
    private String username;
    private String nameReceive;
    private String phoneReceive;
    private String addressReceive;
    private List<BookQuantityDto> cartDetailList;

}
