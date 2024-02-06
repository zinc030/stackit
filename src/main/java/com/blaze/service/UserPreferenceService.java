package com.blaze.service;

import java.util.List;

import com.blaze.entity.UserPreference;

public interface UserPreferenceService {
    UserPreference findPreferenceByUserId(Long userId);
    
    void setPreferences(Long userId, List<String> softwareFields);

}
