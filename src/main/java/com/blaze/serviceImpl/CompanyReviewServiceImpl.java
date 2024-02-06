package com.blaze.serviceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.blaze.entity.CompanyReview;
import com.blaze.enums.SwField;
import com.blaze.persistence.CompanyReviewRepository;
import com.blaze.service.CompanyReviewService;
import com.blaze.specification.CompanyReviewSpecification;

import java.util.List;

@Service
public class CompanyReviewServiceImpl implements CompanyReviewService {

    @Autowired
    private CompanyReviewRepository reviewRepository;

    @Autowired
    public CompanyReviewServiceImpl(CompanyReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    @Override
    public List<CompanyReview> getAllReviews() {
        return reviewRepository.findAll();
    }

    @Override
    public CompanyReview getReviewById(Long id) {
        return reviewRepository.findById(id).orElse(null);
    }

    @Override
    public CompanyReview saveReview(CompanyReview review) {
        return reviewRepository.save(review);
    }

    @Override
    public void deleteReview(Long id) {
        reviewRepository.deleteById(id);
    }

    @Override
    public List<CompanyReview> getReviewsByCompanyId(Long companyId) {
        return reviewRepository.findByCompanyId(companyId);
    }

    @Override
    public List<CompanyReview> searchReviews(Long companyId, String keyword, List<SwField> swFields, String sortChoice, List<Integer> starFilters) {
        // Create Sort based on user's choice
        Sort sort;
        switch (sortChoice) {
            case "mostHelpful":
                sort = Sort.by(Sort.Direction.DESC, "voteCount");
                break;
            case "mostRecent":
                sort = Sort.by(Sort.Direction.DESC, "createdDate");
                break;
            default:
                sort = Sort.unsorted();
        }

        // Create Specification based on user's choices
        Specification<CompanyReview> spec = Specification.where(
            CompanyReviewSpecification.hasTitleOrProOrCon(keyword)
            .and(CompanyReviewSpecification.hasSwFieldIn(swFields))
            .and(CompanyReviewSpecification.hasCompanyId(companyId))
        );

        // Add star filters to Specification if user chose any
        if (starFilters != null && !starFilters.isEmpty()) {
            spec = spec.and(CompanyReviewSpecification.hasStarsIn(starFilters));
        }

        return reviewRepository.findAll(spec, sort);
    }

    @Override
    public void updateVoteCount(Long reviewId, boolean isAddingVote) {
        CompanyReview review = getReviewById(reviewId);
        if (isAddingVote) {
            review.setVoteCount(review.getVoteCount() + 1);
        } else {
            review.setVoteCount(review.getVoteCount() - 1);
        }
        saveReview(review);
    }

    @Override
    public CompanyReview createReview(CompanyReview review) {
        // Set default values
        review.setVoteCount(0);

        // Save and return the review
        return reviewRepository.save(review);
    }

    @Override
    public void updateReview(CompanyReview updatedReview) {
        CompanyReview existingReview = reviewRepository.findById(updatedReview.getId())
            .orElseThrow(() -> new IllegalArgumentException("Invalid review ID: " + updatedReview.getId()));

        // Ensure the company name is not changed
        updatedReview.setCompany(existingReview.getCompany());

        // Update the other fields
        existingReview.setRating(updatedReview.getRating());
        existingReview.setSwField(updatedReview.getSwField());
        existingReview.setTitle(updatedReview.getTitle());
        existingReview.setStatus(updatedReview.getStatus());
        existingReview.setPro(updatedReview.getPro());
        existingReview.setCon(updatedReview.getCon());
        existingReview.setAdvice(updatedReview.getAdvice());



        reviewRepository.save(existingReview);
    }
}