package com.nhasach.be.controller;

import com.nhasach.be.dto.JwtResponse;
import com.nhasach.be.dto.LogInDto;
import com.nhasach.be.dto.ResponseMessage;
import com.nhasach.be.dto.SignUpDto;
import com.nhasach.be.model.Users;
import com.nhasach.be.service.IUserService;
import com.nhasach.be.utils.JwtUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
@RequestMapping("/api/users")
public class UserRestController {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private IUserService userService;
    @Autowired
    private JwtUtils jwtUtils;

    @PostMapping("sign-up")
    public ResponseEntity<?> signUp(@Valid @RequestBody SignUpDto signUpDto, BindingResult bindingResult) {
        new SignUpDto().validate(signUpDto, bindingResult);
        Map<String, String> errorMap = new HashMap<>();
        if (bindingResult.hasFieldErrors()) {
            bindingResult.getFieldErrors()
                .forEach(err -> errorMap.put(err.getField(), err.getDefaultMessage()));
            return ResponseEntity.badRequest()
                .body(new ResponseMessage<>(false, "Failed!", errorMap, new ArrayList<>()));
        }
        if (this.userService.checkUsername(signUpDto.getUsername())) {
            errorMap.put("username", "Username đã được sử dụng!");
            return ResponseEntity.badRequest()
                .body(new ResponseMessage<>(false, "Failed!", errorMap, new ArrayList<>()));
        }
        Users user;
        try {
            user = this.userService.saveUser(signUpDto);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    @PostMapping("sign-in")
    public ResponseEntity<?> signIn(@Valid @RequestBody LogInDto logInDto, BindingResult bindingResult) {
        new LogInDto().validate(logInDto, bindingResult);
        Map<String, String> errorMap = new HashMap<>();
        if (bindingResult.hasErrors()) {
            bindingResult.getFieldErrors()
                .forEach(
                    err -> errorMap.put(err.getField(), err.getDefaultMessage())
                );
            return ResponseEntity.badRequest().body(new ResponseMessage<>(false, "Failed", errorMap, new ArrayList<>()));
        }
        if (!this.userService.checkUsername(logInDto.getUsername())) {
            errorMap.put("notExists", "Tài khoản chưa tồn tại trong hệ thống");
            return ResponseEntity.badRequest().body(new ResponseMessage<>(false, "Failed", errorMap, new ArrayList<>()));
        }
        Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(logInDto.getUsername(), logInDto.getPassword())
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtKey(authentication);
        User user = (User) authentication.getPrincipal();
        List<String> role = user.getAuthorities()
            .stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList());
        return ResponseEntity.ok(new JwtResponse(
            jwt, logInDto.getUsername(), logInDto.getPassword(), role)
        );
    }
//
//    @PostMapping("{username}")
//    public ResponseEntity<?> getUserInfo(@PathVariable("username") String username) {
//
//    }
}
