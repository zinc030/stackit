package com.blaze.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.blaze.entity.Resume;
import com.blaze.entity.User;
import com.blaze.entity.resume.Education;
import com.blaze.service.ResumeService;
import com.blaze.service.UserService;

import jakarta.validation.Valid;

@Controller
public class ResumeController {
    
    @Autowired
    private final ResumeService resumeService;

    @Autowired
    private final UserService userService;

    public ResumeController(ResumeService resumeService, UserService userService) {
        this.resumeService = resumeService;
        this.userService = userService;
    }

    @GetMapping("/resume/new")
    public String showForm(Model model) {
        model.addAttribute("resume", resumeService.createNewResume());
        return "resumeForm";
    }

    @PostMapping("/resume/new")
    public String submitForm(@ModelAttribute("resume") Resume resume, Principal principal) {
        System.out.println("Resume: " + resume);
        
        User currentUser = userService.findUserByUsername(principal.getName());
        resume.setUser(currentUser);
        resumeService.addResume(resume);
        return "redirect:/resume";
    }

    @GetMapping("/resume")
    public String showResume(Model model, Principal principal) {
        User currentUser = userService.findUserByUsername(principal.getName());
        List<Resume> resumes = resumeService.findResumesByUser(currentUser);
        model.addAttribute("resumes", resumes);
        return "resumes";
    }

    @GetMapping("/resume/{id}")
    public String resumeDetail(Model model, Principal principal, @PathVariable("id") Long id) {
        User currentUser = userService.findUserByUsername(principal.getName());
        Resume resume = resumeService.findResumeById(id)
            .orElseThrow(() -> new IllegalArgumentException("Invalid resume Id:" + id));
        if (resume.getUser().getId() != currentUser.getId()) {
            return "redirect:/resume";
        }
        model.addAttribute("resume", resume);
        return "resumeDetail";
    }

        @GetMapping("/resume/{id}/edit")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Resume resume = resumeService.findResumeById(id)
            .orElseThrow(() -> new IllegalArgumentException("Invalid resume Id:" + id));
        model.addAttribute("resume", resume);
        return "updateResume";
    }

    @PostMapping("/resume/{id}/edit")
    public String updateResume(@PathVariable("id") long id, @Valid Resume resume, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "updateResume";
        }

        resumeService.updateResume(id, resume);
        return "redirect:/resume";
    }

    @PostMapping("/resume/{id}/delete")
    public String deleteResume(@PathVariable("id") long id) {
        resumeService.deleteResume(id);
        return "redirect:/resume";
    }
}