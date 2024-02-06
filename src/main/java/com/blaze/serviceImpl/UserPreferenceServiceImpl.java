package com.blaze.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blaze.entity.UserPreference;
import com.blaze.persistence.UserPreferenceRepository;
import com.blaze.service.UserPreferenceService;

@Service
public class UserPreferenceServiceImpl implements UserPreferenceService {

    @Autowired
    private UserPreferenceRepository userPreferenceRepository;

    @Override
    public void setPreferences(Long userId, List<String> softwareFields) {
        UserPreference userPreference = userPreferenceRepository.findByUserId(userId);
        if (userPreference == null) {
            userPreference = new UserPreference();
            userPreference.setUserId(userId);
        }
        userPreference.setSoftwareFields(softwareFields);
        userPreferenceRepository.save(userPreference);
    }

    @Override
    public UserPreference findPreferenceByUserId(Long userId) {
        return userPreferenceRepository.findByUserId(userId);
    }

}