package com.blaze.controller;

/* Summary
1. @GetMapping : If no query, return all companies. Else, return companies containing query.
2. 
*/

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blaze.dto.CompanyDto;
import com.blaze.entity.Company;
import com.blaze.entity.CompanyReview;
import com.blaze.entity.CompanyReviewReport;
import com.blaze.entity.User;
import com.blaze.enums.SwField;
import com.blaze.service.CompanyReviewReportService;
import com.blaze.service.CompanyReviewService;
import com.blaze.service.CompanyService;
import com.blaze.service.HelpfulVoteService;
import com.blaze.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping({"/company", "/company/"})
public class CompanyController {

    private final CompanyService companyService;
    private final CompanyReviewService reviewService;
    private final UserService userService;
    private final HelpfulVoteService helpfulVoteService;
    private final CompanyReviewReportService reportService;

    @Autowired
    public CompanyController(CompanyService companyService, CompanyReviewService reviewService
                    		, UserService userService, HelpfulVoteService helpfulVoteService
                            , CompanyReviewReportService reportService) {
        this.companyService = companyService;
        this.reviewService = reviewService;
        this.userService = userService;
        this.helpfulVoteService = helpfulVoteService;
        this.reportService = reportService;
    }

    @GetMapping
    public String searchCompanies(@RequestParam(required = false) String q, Model model) {
        List<CompanyDto> companies;
        if (q != null) {
            companies = companyService.searchCompaniesDto(q);
        } else {
            companies = companyService.getAllCompaniesDto();
        }
        model.addAttribute("companies", companies);
        return "companies";
    }

    @GetMapping({"/{id}", "/{id}/"})
    public String getCompanyById(@PathVariable Long id, Model model) {
        Company company = companyService.getCompanyById(id);
        model.addAttribute("company", company);
        return "company";
    }

    @GetMapping("/{companyId}/reviews")
    public String getReviewsByCompanyId(@PathVariable Long companyId,
                                        @RequestParam(required = false) String query,
                                        @RequestParam(required = false) List<Integer> stars,
                                        @RequestParam(required = false) List<SwField> swFields,
                                        @RequestParam(required = false, defaultValue = "mostRecent") String sort,
                                        Model model,
                                        HttpSession session, Principal principal) {
        Company company = companyService.getCompanyById(companyId);
        List<CompanyReview> reviews = reviewService.searchReviews(companyId, query, swFields, sort, stars);
        User currentUser = null;
        if (principal != null){
            currentUser =  userService.findUserByUsername(principal.getName());
        }

        if (currentUser != null && currentUser.getHelpfulReviews() != null) {
            model.addAttribute("currentUser", currentUser);
            Map<Long, Boolean> helpfulReviews = new HashMap<>();
            for (CompanyReview review : currentUser.getHelpfulReviews()) {
                helpfulReviews.put(review.getId(), true);
            }
            model.addAttribute("helpfulReviews", helpfulReviews);
        } else {
            // Handle the case where currentUser or helpfulReviews is null
            model.addAttribute("currentUser", null);
        }
        
        model.addAttribute("company", company); 
        model.addAttribute("reviews", reviews);
        model.addAttribute("report", new CompanyReviewReport());

        return "reviews";
    }

    @PostMapping("/reviews/{reviewId}/helpfulVote")
    public String toggleHelpfulVote(@PathVariable Long reviewId, Principal principal, RedirectAttributes redirectAttributes, HttpSession session) {
        User user = userService.findUserByUsername(principal.getName());
        CompanyReview review = reviewService.getReviewById(reviewId);
        boolean isAddingVote = helpfulVoteService.toggleHelpfulVote(user, review);
        
        reviewService.updateVoteCount(reviewId, isAddingVote);

        redirectAttributes.addAttribute("companyId", review.getCompany().getId());
        return "redirect:/company/{companyId}/reviews";
    }

    @GetMapping("/{companyId}/reviews/new")
    public String showNewReviewForm(@PathVariable("companyId") Long companyId, Model model) {
        Company company = companyService.getCompanyById(companyId);
        model.addAttribute("company", company);
        model.addAttribute("review", new CompanyReview());
        return "newReview";
    }

    @PostMapping("/{companyId}/reviews/new")
    public String submitNewReview(@PathVariable("companyId") Long companyId, @Valid @ModelAttribute("review") CompanyReview review, BindingResult bindingResult, Principal principal) {
        if (bindingResult.hasErrors()) {
            return "newReview";
        }
        Company company = companyService.getCompanyById(companyId);
        User user = userService.findUserByUsername(principal.getName());
        review.setCompany(company);
        review.setUser(user);
        reviewService.createReview(review);
        return "redirect:/company/" + companyId + "/reviews";
    }

    // Update operation
    @GetMapping("/{companyId}/reviews/{reviewId}/edit")
    public String showUpdateReviewForm(@PathVariable("companyId") Long companyId, @PathVariable("reviewId") Long reviewId, Model model) {
        CompanyReview review = reviewService.getReviewById(reviewId);
        model.addAttribute("company", review.getCompany());
        model.addAttribute("review", review);
        return "updateReview"; // return to the update review form
    }

    @PostMapping("/{companyId}/reviews/{reviewId}/edit")
    public String submitUpdatedReview(@PathVariable("companyId") Long companyId, @PathVariable("reviewId") Long reviewId, @Valid @ModelAttribute("review") CompanyReview review, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "updateReview";
        }
        review.setId(reviewId); // ensure the ID is set so it updates instead of creating a new one
        reviewService.updateReview(review);
        return "redirect:/company/" + companyId + "/reviews";
    }

    @PostMapping("/{companyId}/reviews/{reviewId}/delete")
    public String deleteReview(@PathVariable("companyId") Long companyId, @PathVariable("reviewId") Long reviewId, Principal principal) {
        CompanyReview review = reviewService.getReviewById(reviewId);
        if (principal.getName().equals(review.getUser().getUsername())) {
            reviewService.deleteReview(reviewId);
        }
        return "redirect:/company/" + companyId + "/reviews";
    }

    @PostMapping("/{companyId}/reviews/{reviewId}/report")
    public String reportReview(@PathVariable("companyId") Long companyId, @PathVariable("reviewId") Long reviewId, CompanyReviewReport report, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        CompanyReview companyReview = reviewService.getReviewById(reviewId);

        System.out.println(report.getReason());
        report.setUser(user);
        report.setCompanyReview(companyReview);

        reportService.saveReport(report);
        return "redirect:/company/" + companyId + "/reviews"; // redirect to the reviews page
    }

}