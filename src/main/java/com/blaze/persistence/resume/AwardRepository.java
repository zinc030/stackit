package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.Award;

public interface AwardRepository extends JpaRepository<Award, Long>{
    
}
