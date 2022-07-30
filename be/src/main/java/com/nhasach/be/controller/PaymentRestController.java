package com.nhasach.be.controller;

import com.nhasach.be.dto.CartDetailDto;
import com.nhasach.be.model.CartDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("api/payments")
public class PaymentRestController {
    @PostMapping
    public ResponseEntity<?> saveCartDetail(@RequestBody CartDetailDto cartDetailDto) {
        System.out.println(cartDetailDto);
        return null;
    }

}
