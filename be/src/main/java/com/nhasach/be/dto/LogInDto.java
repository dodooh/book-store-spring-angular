package com.nhasach.be.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Getter
@Setter
@NoArgsConstructor
public class LogInDto implements Validator {
    @Length(min = 5,message = "Tên tài khoản quá ngắn.")
    @Length(max = 50, message = "Tên tài khoản quá dài.")
    @NotEmpty(message = "Không bỏ trống.")
    private String username;
    @Length(min=5,message = "Mật khẩu quá ngắn.")
    @Length(max=50,message = "Mật khẩu quá dài.")
    private String password;
    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {
        LogInDto loginRequest = (LogInDto) target;
        if(loginRequest.getPassword().contains(" ")){
            errors.rejectValue("password","","Mật khẩu chứa kí tự trống.");
        }else if(!loginRequest.getPassword().matches("^(\\s?[a-zA-Z!@#$%^&*()\\d]\\s?){6,50}$")){
            errors.rejectValue("password","","Có kí tự đặc biệt không được cho phép.");
        }
    }
}
