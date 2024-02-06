package com.blaze.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.blaze.entity.Resume;
import com.blaze.entity.User;
import com.blaze.entity.resume.Award;
import com.blaze.entity.resume.Certificate;
import com.blaze.entity.resume.Education;
import com.blaze.entity.resume.Project;
import com.blaze.entity.resume.Skill;
import com.blaze.entity.resume.WorkExperience;
import com.blaze.exception.ResourceNotFoundException;
import com.blaze.persistence.ResumeRepository;
import com.blaze.persistence.resume.AwardRepository;
import com.blaze.persistence.resume.CertificateRepository;
import com.blaze.persistence.resume.EducationRepository;
import com.blaze.persistence.resume.ProjectRepository;
import com.blaze.persistence.resume.SkillRepository;
import com.blaze.persistence.resume.WorkExperienceRepository;
import com.blaze.service.ResumeService;
import com.blaze.service.UserService;

import jakarta.transaction.Transactional;

@Service
public class ResumeServiceImpl implements ResumeService {
    private final ResumeRepository resumeRepository;
    private final EducationRepository educationRepository;
    private final WorkExperienceRepository workExperienceRepository;
    private final SkillRepository skillRepository;
    private final ProjectRepository projectRepository;
    private final CertificateRepository certificateRepository;
    private final AwardRepository awardRepository;

    public ResumeServiceImpl(ResumeRepository resumeRepository, EducationRepository educationRepository,
                             WorkExperienceRepository workExperienceRepository, SkillRepository skillRepository,
                             ProjectRepository projectRepository, CertificateRepository certificateRepository,
                             AwardRepository awardRepository, UserService userService) {
        this.resumeRepository = resumeRepository;
        this.educationRepository = educationRepository;
        this.workExperienceRepository = workExperienceRepository;
        this.skillRepository = skillRepository;
        this.projectRepository = projectRepository;
        this.certificateRepository = certificateRepository;
        this.awardRepository = awardRepository;
    }

    public Resume createNewResume() {
        Resume resume = new Resume();
        resume.setEducations(new ArrayList<>());
        resume.setWorkExperiences(new ArrayList<>());
        resume.setSkills(new ArrayList<>());
        resume.setProjects(new ArrayList<>());
        resume.setCertificates(new ArrayList<>());
        resume.setAwards(new ArrayList<>());
        return resume;
    }


    @Transactional
    @Override
    public Resume addResume(Resume resume) {
        // save the resume
        Resume savedResume = resumeRepository.save(resume);

        // save the educations
        for (Education education : resume.getEducations()) {
            education.setResume(savedResume);
            educationRepository.save(education);
        }

        // save the work experiences
        for (WorkExperience workExperience : resume.getWorkExperiences()) {
            workExperience.setResume(savedResume);
            workExperienceRepository.save(workExperience);
        }

        // save the skills
        for (Skill skill : resume.getSkills()) {
            skill.setResume(savedResume);
            skillRepository.save(skill);
        }

        // save the projects
        for (Project project : resume.getProjects()) {
            project.setResume(savedResume);
            projectRepository.save(project);
        }

        // save the certificates
        for (Certificate certificate : resume.getCertificates()) {
            certificate.setResume(savedResume);
            certificateRepository.save(certificate);
        }

        // save the awards
        for (Award award : resume.getAwards()) {
            award.setResume(savedResume);
            awardRepository.save(award);
        }

        return savedResume;
    }
    
    @Override
    public List<Resume> findResumesByUser(User user){
        return resumeRepository.findByUser(user);
    }

    @Override
    public Optional<Resume> findResumeById(Long id){
        return resumeRepository.findById(id);
    }

    @Override
    public Resume updateResume(Long id, Resume updatedResume) {
        Resume existingResume = resumeRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("Resume not found"));
        
        existingResume.setEducations(updatedResume.getEducations());
        existingResume.setWorkExperiences(updatedResume.getWorkExperiences());
        existingResume.setSkills(updatedResume.getSkills());
        existingResume.setProjects(updatedResume.getProjects());
        existingResume.setCertificates(updatedResume.getCertificates());
        existingResume.setAwards(updatedResume.getAwards());

        return resumeRepository.save(existingResume);
    }
    
    @Override
    public void deleteResume(Long id) {
        Resume existingResume = resumeRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException("Resume not found"));
        
        resumeRepository.delete(existingResume);
    }
    
    // other methods...

}