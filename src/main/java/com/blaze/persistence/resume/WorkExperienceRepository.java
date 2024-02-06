package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.WorkExperience;

public interface WorkExperienceRepository extends JpaRepository<WorkExperience, Long> {
    
}
