package com.nhasach.be.service.impl;

import com.nhasach.be.model.Customer;
import com.nhasach.be.repository.ICustomerRepository;
import com.nhasach.be.service.ICustomerService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private ICustomerRepository customerRepository;

    @Override
    public Optional<Customer> findByUsername(String username) {
        return this.customerRepository.findByCustomerUsername_Username(username);
    }
}
