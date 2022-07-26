package com.nhasach.be.repository;

import com.nhasach.be.model.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IRoleRepository extends JpaRepository<Roles, Integer> {

    Roles findRolesByRoleName(String role_user);
}
