package com.blaze.service;

import java.util.List;
import java.util.Optional;

import com.blaze.entity.Resume;
import com.blaze.entity.User;

public interface ResumeService {
    Resume createNewResume();
    Resume addResume(Resume resume);
    List<Resume> findResumesByUser(User user);
    Optional<Resume> findResumeById(Long id);

    Resume updateResume(Long id, Resume updatedResume);
    public void deleteResume(Long id);
    // other methods...
}