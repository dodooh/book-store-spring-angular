package com.nhasach.be.controller;

import com.nhasach.be.model.Customer;
import com.nhasach.be.service.ICustomerService;
import com.nhasach.be.utils.AuthTokenFilter;
import com.nhasach.be.utils.JwtUtils;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/api/customers")
public class CustomerRestController {
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private AuthTokenFilter authTokenFilter;
    @Autowired
    private ICustomerService customerService;

    @GetMapping("detail")
    public ResponseEntity<?> getCustomerDetail(HttpServletRequest request) {
        String username = this.jwtUtils.getUsernameFromJwtKey(parseJwt(request));
        if (username != null) {
            Optional<Customer> customer = customerService.findByUsername(username);
            if (customer.isPresent()) {
                return new ResponseEntity<>(customer, HttpStatus.OK);
            }
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    private String parseJwt(HttpServletRequest request) {
        String headerAuth = request.getHeader("Authorization");
        if(StringUtils.hasText(headerAuth) && headerAuth.startsWith("Bearer ")){
            return headerAuth.substring(7,headerAuth.length());
        }
        return null;
    }
}
