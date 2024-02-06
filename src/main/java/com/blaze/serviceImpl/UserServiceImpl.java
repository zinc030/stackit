package com.blaze.serviceImpl;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.blaze.dto.UserDto;
import com.blaze.dto.UserPasswordDto;
import com.blaze.entity.JobPost;
import com.blaze.entity.Role;
import com.blaze.entity.User;
import com.blaze.persistence.JobPostRepository;
import com.blaze.persistence.RoleRepository;
import com.blaze.persistence.UserRepository;
import com.blaze.service.UserService;

@Service
public class UserServiceImpl implements UserService{

    private UserRepository userRepository;  
    private RoleRepository roleRepository;
    private PasswordEncoder passwordEncoder;
    private JobPostRepository jobPostRepository;

    public UserServiceImpl(UserRepository userRepository,
                           RoleRepository roleRepository,
                           PasswordEncoder passwordEncoder,
                           JobPostRepository jobPostRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.jobPostRepository = jobPostRepository;
    }

    @Override
    public void saveUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getFirstName() + " " + userDto.getLastName());
        user.setUsername(userDto.getUsername());
        user.setNickname(userDto.getNickname());
        user.setEmail(userDto.getEmail());
        // encrypt the password using spring security
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));

        Role role = roleRepository.findByName("ROLE_USER");
        if(role == null){
            role = checkRoleExist();
        }
        user.setRoles(Arrays.asList(role));
        userRepository.save(user);
    }

    @Override
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findUserByNickname(String nickname) {
        return userRepository.findByNickname(nickname);
    }

    @Override
    public boolean checkPassword(User user, String oldPassword){
        return passwordEncoder.matches(oldPassword, user.getPassword());
    }

    @Override
    public void updateUser(UserPasswordDto accountUpdateDto, User currentUser) {
        User user = userRepository.findByUsername(currentUser.getUsername());

        if (user != null) {
            user.setNickname(accountUpdateDto.getNickname());
            user.setEmail(accountUpdateDto.getEmail());
            user.setPassword(passwordEncoder.encode(accountUpdateDto.getNewPassword()));
            userRepository.save(user);
        }
    }

    @Override
    public List<UserDto> findAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream()
                .map((user) -> mapToUserDto(user))
                .collect(Collectors.toList());
    }

    private UserDto mapToUserDto(User user){
        UserDto userDto = new UserDto();
        String[] str = user.getName().split(" ");
        userDto.setFirstName(str[0]);
        userDto.setLastName(str[1]);
        userDto.setEmail(user.getEmail());
        userDto.setUsername(user.getUsername());
        userDto.setNickname(user.getNickname());
        return userDto;
    }

    private Role checkRoleExist(){
        Role role = new Role();
        role.setName("ROLE_USER");
        return roleRepository.save(role);
    }
    
    @Override
    public boolean toggleBookmark(Long userId, Long jobPostId) {
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
        JobPost jobPost = jobPostRepository.findById(jobPostId).orElseThrow(() -> new RuntimeException("Job post not found"));
    
        if (user.getBookmarkedJobPosts().contains(jobPost)) {
            // If the bookmark already exists, remove it
            user.getBookmarkedJobPosts().remove(jobPost);
            userRepository.save(user);
            return false;  // A bookmark was removed
        } else {
            // If the bookmark doesn't exist, add it
            user.getBookmarkedJobPosts().add(jobPost);
            userRepository.save(user);
            return true;  // A bookmark was added
        }
    }

    @Override
    public void deleteUser(User user) {
        // Remove the user from the roles
        user.getRoles().clear();
        userRepository.save(user);

        // Delete the user
        userRepository.delete(user);
    }
}
