package com.blaze.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.CompanyReviewReport;

public interface CompanyReviewReportRepository extends JpaRepository<CompanyReviewReport, Long> {
}