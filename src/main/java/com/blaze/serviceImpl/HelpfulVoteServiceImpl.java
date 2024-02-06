package com.blaze.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blaze.entity.CompanyReview;
import com.blaze.entity.HelpfulVote;
import com.blaze.entity.User;
import com.blaze.persistence.HelpfulVoteRepository;
import com.blaze.service.HelpfulVoteService;

import java.util.List;
import java.util.Optional;

@Service
public class HelpfulVoteServiceImpl implements HelpfulVoteService {
    @Autowired
    private HelpfulVoteRepository helpfulVoteRepository;

    @Override
    public boolean toggleHelpfulVote(User user, CompanyReview review) {
        Optional<HelpfulVote> existingVote = helpfulVoteRepository.findByUserAndReview(user, review);

        if (existingVote.isPresent()) {
            // If a vote already exists, delete it
            helpfulVoteRepository.delete(existingVote.get());
            return false;  // A vote was removed
        } else {
            // If no vote exists, create a new one
            HelpfulVote vote = new HelpfulVote();
            vote.setUser(user);
            vote.setReview(review);
            helpfulVoteRepository.save(vote);
            return true;  // A vote was added
        }
    }

    @Override
    public Optional<HelpfulVote> findByUserAndReview(User user, CompanyReview review) {
        return helpfulVoteRepository.findByUserAndReview(user, review);
    }

}