package com.nhasach.be.repository;

import com.nhasach.be.model.Customer;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICustomerRepository extends JpaRepository<Customer, String> {

    Optional<Customer> findByCustomerUsername_Username(String username);
}
