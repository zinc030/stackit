package com.blaze.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.UserPreference;

public interface UserPreferenceRepository extends JpaRepository<UserPreference, Long>{
    UserPreference findByUserId(Long userId);
}
