package com.nhasach.be.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Getter
@Setter
@NoArgsConstructor
public class SignUpDto implements Validator {
    private String username;
    private String password;
    private String name;
    private String phone;
    private String email;
    private String dateOfBirth;
    private String address;
    private Boolean gender;

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {
        SignUpDto signUpDto = (SignUpDto) target;
        String name = signUpDto.getName();
        if (name == null) {
            errors.rejectValue("name", "name.required", "Tên không được để trống");
        } else if (!name.matches("^[a-zA-Z][\\w\\s]+$")) {
            errors.rejectValue("name", "name.regex", "Tên không được chứa kí tự đặc biệt");
        }
        String username = signUpDto.getUsername();
        if (username == null) {
            errors.rejectValue("username","username.invalid.required","Không được để trống");
        } else if (!username.matches("^[a-zA-Z]\\w{5,60}")) {
            errors.rejectValue("username","username.invalid.regex","Không hợp lệ");
        }
    }
}
