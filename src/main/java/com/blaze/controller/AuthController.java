package com.blaze.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blaze.dto.UserDto;
import com.blaze.dto.UserPasswordDto;
import com.blaze.entity.CompanyReview;
import com.blaze.entity.HelpfulVote;
import com.blaze.entity.User;
import com.blaze.entity.UserPreference;
import com.blaze.service.UserPreferenceService;
import com.blaze.service.UserService;

import jakarta.validation.Valid;

@Controller
public class AuthController {
    
    private UserService userService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserPreferenceService userPreferenceService;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder,
                        UserPreferenceService userPreferenceService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.userPreferenceService = userPreferenceService;
    }

    @GetMapping({"/index", "/", ""})
    public String showHomePage(Model model) {
        return "index";
    }

    @GetMapping("/login")
    public String loginView(){
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model){
        // create model object to store form data
        UserDto user = new UserDto();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") UserDto userDto,
                               BindingResult result,
                               Model model){
        User existingUsername = userService.findUserByUsername(userDto.getUsername());
        User existingEmail = userService.findUserByEmail(userDto.getEmail());
        User existingNickname = userService.findUserByNickname(userDto.getNickname());

        if(existingUsername != null && existingUsername.getUsername() != null && !existingUsername.getUsername().isEmpty()){
            result.rejectValue("username", null,
                    "There is already an account registered with the same username");
        }

        if(existingEmail != null && existingEmail.getEmail() != null && !existingEmail.getEmail().isEmpty()){
            result.rejectValue("email", null,
                    "There is already an account registered with the same email");
        }

        if(existingNickname != null && existingNickname.getNickname() != null && !existingNickname.getNickname().isEmpty()){
            result.rejectValue("nickname", null,
                    "There is already an account registered with the same nickname");
        }

        if(result.hasErrors()){
            model.addAttribute("user", userDto);
            return "/register";
        }

        userService.saveUser(userDto);
        return "redirect:/register?success";
    }

    @GetMapping("/account/personal-info")
    public String accountView(@ModelAttribute("user") UserPasswordDto accountUpdateDto, 
                          @AuthenticationPrincipal UserDetails currentUser,
                          Model model) {

        User user = userService.findUserByUsername(currentUser.getUsername());
        accountUpdateDto.setUsername(user.getUsername());
        accountUpdateDto.setNickname(user.getNickname());
        accountUpdateDto.setEmail(user.getEmail());

        model.addAttribute("user", accountUpdateDto);
        return "account_personal_info";
    }

    @PostMapping("/account/save")
    public String updateAccount(@ModelAttribute("user") UserPasswordDto accountUpdateDto, 
                                @AuthenticationPrincipal UserDetails currentUser,
                                Model model, 
                                RedirectAttributes redirectAttributes) {
    
        User user = userService.findUserByUsername(currentUser.getUsername());
    
        if (!passwordEncoder.matches(accountUpdateDto.getOldPassword(), user.getPassword())) {
            redirectAttributes.addFlashAttribute("errorMessage", "Old password is incorrect");
            return "redirect:/account";
        }
        
        if (!accountUpdateDto.getNewPassword().equals(accountUpdateDto.getConfirmPassword())) {
            redirectAttributes.addFlashAttribute("errorMessage", "New password and confirm password do not match");
            return "redirect:/account";
        }
    
        userService.updateUser(accountUpdateDto, user);
        redirectAttributes.addFlashAttribute("successMessage", "Account updated successfully");
        return "redirect:/account";
    }

    @GetMapping("/my/jobposts")
    public String showBookmarkedJobPosts(Model model, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        model.addAttribute("jobPosts", user.getBookmarkedJobPosts());
    
        return "bookmarkedJobPosts";
    }

    @GetMapping("/my/helpfulVotes")
    public String getHelpfulReviews(Model model, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        List<CompanyReview> helpfulReviews = user.getHelpfulReviews();
        model.addAttribute("helpfulReviews", helpfulReviews);
        return "helpfulReviews";
    }


    @PostMapping("/account/setPreferences")
    public String setPreferences(@RequestParam(required = false) List<String> softwareFields,
                               Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        Long user_id = user.getId();
        if (softwareFields == null) {
            softwareFields = new ArrayList<>();
        }
        userPreferenceService.setPreferences(user_id, softwareFields);
        return "redirect:/account";
    }

    @GetMapping("/account")
    public String getPreferences(Model model, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        Long user_id = user.getId();
        UserPreference userPreference = userPreferenceService.findPreferenceByUserId(user_id);
        if (userPreference == null) {
            userPreference = new UserPreference();
            userPreference.setSoftwareFields(new ArrayList<>());
        }
        model.addAttribute("userPreference", userPreference);
        return "account";
    }

    @GetMapping("/account/delete")
    public String deleteAccountView(Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        
        return "account_delete";
    }

    @PostMapping("/account/delete")
    public String deleteAccount(@RequestParam String password, Principal principal, RedirectAttributes redirectAttributes, Model model) {
        User user = userService.findUserByUsername(principal.getName());
        if (userService.checkPassword(user, password)) {
            userService.deleteUser(user);
            redirectAttributes.addFlashAttribute("successMessage", "Account deleted successfully");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Incorrect password");
            model.addAttribute("showModal", true);
            return "redirect:/account/delete";
        }
    }

}

