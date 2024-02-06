package com.blaze.service;

import java.util.List;
import java.util.Optional;

import com.blaze.entity.CompanyReview;
import com.blaze.entity.HelpfulVote;
import com.blaze.entity.User;

public interface HelpfulVoteService {
    boolean toggleHelpfulVote(User user, CompanyReview review);
    Optional<HelpfulVote> findByUserAndReview(User user, CompanyReview review);

}