package com.blaze.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blaze.dto.CompanyDto;
import com.blaze.entity.Company;
import com.blaze.persistence.CompanyRepository;
import com.blaze.service.CompanyService;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CompanyServiceImpl implements CompanyService {

    private final CompanyRepository companyRepository;

    @Autowired
    public CompanyServiceImpl(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    // Never use this method; returns huge amount of data
    @Override
    public List<Company> getAllCompanies() {
        return companyRepository.findAll();
    }

    @Override
    public Company getCompanyById(Long id) {
        return companyRepository.findById(id).orElse(null);
    }

    @Override
    public Company saveCompany(Company company) {
        return companyRepository.save(company);
    }

    @Override
    public void deleteCompany(Long id) {
        companyRepository.deleteById(id);
    }

    @Override
    public List<Company> searchCompanies(String keyword) {
        return companyRepository.findByNameContainingIgnoreCase(keyword);
    }

    @Override
    public List<CompanyDto> getAllCompaniesDto() {
        List<Company> companies = getAllCompanies();
        return companies.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    @Override
    public List<CompanyDto> searchCompaniesDto(String q) {
        List<Company> companies = searchCompanies(q);
        return companies.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    // convert entity to dto private method
    private CompanyDto convertToDto(Company company) {
        CompanyDto dto = new CompanyDto();
        dto.setId(company.getId());
        dto.setName(company.getName());
        dto.setNumEmp(company.getNumEmp());
        return dto;
    }
}