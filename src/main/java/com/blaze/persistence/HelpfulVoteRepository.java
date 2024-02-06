package com.blaze.persistence;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.CompanyReview;
import com.blaze.entity.HelpfulVote;
import com.blaze.entity.User;

public interface HelpfulVoteRepository extends JpaRepository<HelpfulVote, Long> {
    Optional<HelpfulVote> findByUserAndReview(User user, CompanyReview review);
    int countByReviewId(Long reviewId);
}