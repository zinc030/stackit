package com.blaze.service;

import java.util.List;

import com.blaze.entity.CompanyReview;
import com.blaze.enums.SwField;

public interface CompanyReviewService {
    List<CompanyReview> getAllReviews();
    CompanyReview getReviewById(Long id);
    CompanyReview saveReview(CompanyReview review);
    void deleteReview(Long id);
    
    List<CompanyReview> getReviewsByCompanyId(Long companyId);
    List<CompanyReview> searchReviews(Long companyId, String keyword, List<SwField> swFields, String sortChoice, List<Integer> starFilters);

    void updateVoteCount(Long reviewId, boolean isAddingVote);

    CompanyReview createReview(CompanyReview review);
    void updateReview(CompanyReview review);
}