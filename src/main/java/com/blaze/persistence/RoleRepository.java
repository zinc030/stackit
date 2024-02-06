package com.blaze.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);
    
}
