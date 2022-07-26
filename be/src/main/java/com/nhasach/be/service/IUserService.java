package com.nhasach.be.service;

import com.nhasach.be.dto.SignUpDto;
import com.nhasach.be.model.Users;

public interface IUserService {

    boolean checkUsername(String username);

    Users saveUser(SignUpDto signUpDto);
}
