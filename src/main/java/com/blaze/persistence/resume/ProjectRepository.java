package com.blaze.persistence.resume;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.resume.Project;

public interface ProjectRepository extends JpaRepository<Project, Long> {
    
}
