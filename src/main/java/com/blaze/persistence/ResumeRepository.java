package com.blaze.persistence;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.Resume;
import com.blaze.entity.User;

public interface ResumeRepository extends JpaRepository<Resume, Long> {
    List<Resume> findByUser(User user);
}
