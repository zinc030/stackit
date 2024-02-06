package com.blaze.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
    User findByUsername(String username);

    User findByEmail(String email);

    User findByNickname(String nickname);

}
