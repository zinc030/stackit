package com.blaze.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
    List<Company> findByNameContainingIgnoreCase(String keyword);
}