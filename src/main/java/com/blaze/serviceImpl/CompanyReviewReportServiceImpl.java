package com.blaze.serviceImpl;

import org.springframework.stereotype.Service;

import com.blaze.entity.CompanyReviewReport;
import com.blaze.persistence.CompanyReviewReportRepository;
import com.blaze.service.CompanyReviewReportService;

@Service
public class CompanyReviewReportServiceImpl implements CompanyReviewReportService {

    private final CompanyReviewReportRepository reportRepository;

    public CompanyReviewReportServiceImpl(CompanyReviewReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    @Override
    public CompanyReviewReport saveReport(CompanyReviewReport report) {
        return reportRepository.save(report);
    }
}