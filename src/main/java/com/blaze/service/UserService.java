package com.blaze.service;

import java.util.List;

import com.blaze.dto.UserDto;
import com.blaze.dto.UserPasswordDto;
import com.blaze.entity.User;

public interface UserService {
    
    void saveUser(UserDto userDto);

    void updateUser(UserPasswordDto userDto, User user);

    User findUserByEmail(String email);

    User findUserByUsername(String username);

    List<UserDto> findAllUsers();

    User findUserByNickname(String nickname);

    boolean checkPassword(User user, String oldPassword);

    boolean toggleBookmark(Long userId, Long jobPostId); 

    void deleteUser(User user);
}
