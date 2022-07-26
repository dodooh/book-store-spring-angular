package com.nhasach.be.repository;

import com.nhasach.be.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUsersRepository extends JpaRepository<Users,String> {

    Users findUsersByUsername(String username);

    boolean existsByUsername(String username);
}
