package com.blaze.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blaze.entity.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByUserIdOrderByTimestampAsc(String userId);
}