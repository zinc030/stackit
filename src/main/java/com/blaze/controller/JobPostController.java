package com.blaze.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blaze.entity.JobPost;
import com.blaze.entity.User;
import com.blaze.service.JobPostService;
import com.blaze.service.UserService;

import jakarta.servlet.http.HttpServletRequest;




@Controller
@RequestMapping({"/jobposts", "/jobposts/"})
public class JobPostController {

    @Autowired
    private final JobPostService jobPostService;

    @Autowired
    private final UserService userService;

    @Autowired
    public JobPostController(JobPostService jobPostService, 
                                UserService userService) {
        this.jobPostService = jobPostService;
        this.userService = userService;
    }

    @GetMapping
    public String getAllJobPosts(Model model) {
        List<JobPost> jobPosts = jobPostService.getAllJobPosts();
        model.addAttribute("jobPosts", jobPosts);
        return "jobposts";
    }

    @GetMapping("/{id}") // link: jobposts/{id}
    public String getJobPostById(@PathVariable Long id, Model model) {
        JobPost jobPost = jobPostService.getJobPostById(id);
        model.addAttribute("jobPost", jobPost);
        return "jobpost";
    }

    // old search method
    // @GetMapping("/search")
    // public String searchJobPosts(@RequestParam String query, Model model) {
    // List<JobPost> jobPosts = jobPostService.searchJobPosts(query);
    // model.addAttribute("jobPosts", jobPosts);
    // return "jobposts";

    // new search method
    @PostMapping("/search")
    public String searchJobPosts(@RequestParam(required = false) String query,
                                 @RequestParam(required = false) Integer minSalary, 
                                 @RequestParam(required = false) Integer maxSalary, 
                                 @RequestParam(required = false) String seniority, 
                                 @RequestParam(required = false) String employmentType, 
                                 @RequestParam(required = false) String[] swFields,
                                 Model model) {
        List<JobPost> jobPosts = jobPostService.search(query, minSalary, maxSalary, seniority, employmentType, swFields);
        model.addAttribute("jobPosts", jobPosts);
        return "jobposts";
    }

    @PostMapping("/{jobPostId}/bookmark")
    public String toggleBookmark(@PathVariable Long jobPostId, RedirectAttributes redirectAttributes, Principal principal,
                                HttpServletRequest request) {
        User user = userService.findUserByUsername(principal.getName());
        userService.toggleBookmark(user.getId(), jobPostId);

        redirectAttributes.addFlashAttribute("message", "Bookmark updated successfully");
        
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }
}