package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.Skill;

public interface SkillRepository extends JpaRepository<Skill, Long> {
    
}
