package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.Education;

public interface EducationRepository extends JpaRepository<Education, Long> {
    
}
