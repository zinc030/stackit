package com.blaze.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blaze.entity.User;
import com.blaze.entity.UserPreference;
import com.blaze.service.UserPreferenceService;
import com.blaze.service.UserService;

@RestController
public class MyController {
    
    @Autowired
    private UserPreferenceService userPreferenceService;

    @Autowired
    private UserService userService;

    public MyController(UserPreferenceService userPreferenceService, UserService userService) {
        this.userPreferenceService = userPreferenceService;
        this.userService = userService;
    }

 
}
