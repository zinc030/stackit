package com.blaze.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserPasswordDto {
    
    private Long id;

    @NotEmpty(message = "Username should not be empty")
    private String username;
    
    @NotEmpty(message = "Password should not be empty")
    private String password;
    
    @NotEmpty(message = "Nickname should not be empty")
    private String nickname;

    @NotEmpty(message = "First name should not be empty")
    private String firstName;
    
    @NotEmpty(message = "Last name should not be empty")
    private String lastName;
    
    @NotEmpty(message = "Email should not be empty")
    private String email;

    @NotEmpty(message = "Old password should not be empty")
    private String oldPassword;

    private String newPassword;

    private String confirmPassword;

}
