package com.blaze.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.blaze.entity.JobPost;
import com.blaze.persistence.JobPostRepository;
import com.blaze.service.JobPostService;
import com.blaze.specification.JobPostSpecification;

@Service
public class JobPostServiceImpl implements JobPostService{
    
    private final JobPostRepository jobPostRepository;

    @Autowired
    public JobPostServiceImpl(JobPostRepository jobPostRepository) {
        this.jobPostRepository = jobPostRepository;
    }

    @Override
    public List<JobPost> getAllJobPosts() {
        return jobPostRepository.findAll();
    }

    @Override
    public JobPost getJobPostById(Long id) {
        return jobPostRepository.findById(id).orElse(null);
    }

    @Override
    public JobPost saveJobPost(JobPost jobPost) {
        return jobPostRepository.save(jobPost);
    }

    @Override
    public void deleteJobPost(Long id) {
        jobPostRepository.deleteById(id);
    }

    // old searchJobPosts method
    // @Override
    // public List<JobPost> searchJobPosts(String query) {
    // return jobPostRepository.searchByTitleOrCompanyName(query);

    // new searchJobPosts method
    @Override
    public List<JobPost> search(String query, Integer minSalary, Integer maxSalary, String seniority, String employmentType, String[] swFields) {
        return jobPostRepository.findAll(
            Specification.where(
                JobPostSpecification.hasTitleOrCompanyName(query)
                .and(JobPostSpecification.hasMinSalary(minSalary))
                .and(JobPostSpecification.hasMaxSalary(maxSalary))
                .and(JobPostSpecification.hasSeniority(seniority))
                .and(JobPostSpecification.hasEmploymentType(employmentType))
                .and(JobPostSpecification.hasSwField(swFields))
            ),
            Sort.by(Sort.Direction.DESC, "createdDate")
        );
    }
}
