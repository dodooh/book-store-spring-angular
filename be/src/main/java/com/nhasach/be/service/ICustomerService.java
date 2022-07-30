package com.nhasach.be.service;

import com.nhasach.be.model.Customer;
import java.util.Optional;

public interface ICustomerService {

    Optional<Customer> findByUsername(String username);
}
