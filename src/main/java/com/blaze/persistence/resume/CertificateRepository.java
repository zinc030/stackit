package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.Certificate;

public interface CertificateRepository extends JpaRepository<Certificate, Long> {
    
}
