package com.nhasach.be.service.impl;


import com.nhasach.be.dto.SignUpDto;
import com.nhasach.be.model.Customer;
import com.nhasach.be.model.Roles;
import com.nhasach.be.model.UserRole;
import com.nhasach.be.model.Users;
import com.nhasach.be.repository.ICustomerRepository;
import com.nhasach.be.repository.IRoleRepository;
import com.nhasach.be.repository.IUserRoleRepository;
import com.nhasach.be.repository.IUsersRepository;
import com.nhasach.be.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService implements IUserService {

    @Autowired
    private IUsersRepository usersRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ICustomerRepository customerRepository;
    @Autowired
    private IUserRoleRepository userRoleRepository;
    @Autowired
    private IRoleRepository roleRepository;
    @Override
    public boolean checkUsername(String username) {
        return usersRepository.existsByUsername(username);
    }

    @Override
    public Users saveUser(SignUpDto signUpDto) {
        Users users = new Users(signUpDto.getUsername(), passwordEncoder.encode(signUpDto.getPassword()));
        this.usersRepository.save(users);
        Customer customer = new Customer();
        customer.setCustomerUsername(users);
        customer.setName(signUpDto.getName());
        customer.setDateOfBirth(signUpDto.getDateOfBirth());
        customer.setGender(signUpDto.getGender());
        customer.setAddress(signUpDto.getAddress());
        customer.setPhone(signUpDto.getPhone());
        customer.setEmail(signUpDto.getEmail());
        this.customerRepository.save(customer);
        Roles roles = this.roleRepository.findRolesByRoleName("ROLE_USER");
        UserRole userRole = new UserRole(users,roles);
        this.userRoleRepository.save(userRole);
        return users;
    }
}
