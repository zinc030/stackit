package com.blaze.service;

import java.util.List;

import com.blaze.dto.CompanyDto;
import com.blaze.entity.Company;

public interface CompanyService {

    List<Company> getAllCompanies(); // Never use this method; returns huge amount of data
    List<Company> searchCompanies(String keyword); 
    
    Company getCompanyById(Long id); 
    Company saveCompany(Company company);
    void deleteCompany(Long id);

    List<CompanyDto> getAllCompaniesDto(); // returns only id, name, and numEmp
    List<CompanyDto> searchCompaniesDto(String q); // returns only id, name and numEmp where name contains q
    

}