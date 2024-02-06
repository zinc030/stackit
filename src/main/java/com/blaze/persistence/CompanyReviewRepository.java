package com.blaze.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.blaze.entity.CompanyReview;

public interface CompanyReviewRepository extends JpaRepository<CompanyReview, Long>, JpaSpecificationExecutor<CompanyReview> {
    List<CompanyReview> findByCompanyId(Long companyId);
    
}