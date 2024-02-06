package com.blaze.service;

import java.util.List;

import com.blaze.entity.JobPost;

public interface JobPostService {
    List<JobPost> getAllJobPosts();
    JobPost getJobPostById(Long id);
    JobPost saveJobPost(JobPost jobPost);
    void deleteJobPost(Long id);

    // old searchJobPosts method
    // List<JobPost> searchJobPosts(String query);

    // new searchJobPosts method
    List<JobPost> search(String query, Integer minSalary, Integer maxSalary, String seniority, String employmentType, String[] swField);
    

}
