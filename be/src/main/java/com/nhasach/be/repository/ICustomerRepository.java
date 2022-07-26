package com.nhasach.be.repository;

import com.nhasach.be.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICustomerRepository extends JpaRepository<Customer, String> {

}
