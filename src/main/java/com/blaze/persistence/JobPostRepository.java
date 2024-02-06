package com.blaze.persistence;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.blaze.entity.JobPost;
import com.blaze.specification.JobPostSpecification;

public interface JobPostRepository extends JpaRepository<JobPost, Long>, JpaSpecificationExecutor<JobPost>{
    
    // old searchByTitleOrCompanyName method
    // @Query("SELECT j FROM JobPost j WHERE j.title LIKE %:query% OR j.company.name LIKE %:query%")
    // List<JobPost> searchByTitleOrCompanyName(@Param("query") String query);

    // new? searchByTitleOrCompanyName method
    // List<JobPost> searchByTitleOrCompanyName(String query, Integer minSalary, Integer maxSalary, String seniority, String employmentType, String swField);

    List<JobPost> findAll(Specification<JobPost> spec, Sort sort);
}
