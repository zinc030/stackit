package com.blaze.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.blaze.entity.User;
import com.blaze.service.UserService;

@ControllerAdvice
public class GlobalControllerAdvice {
    
    @Autowired
    private UserService userService;

    @ModelAttribute("loggedInUser")
    public User loggedInUser(Principal principal) {
        if (principal != null) {
            return userService.findUserByUsername(principal.getName());
        } else {
            return null;
        }
    }
}
