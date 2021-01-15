package com.toeic.repository;

import com.toeic.entity.TestSessionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface TestSessionRepository extends JpaRepository<TestSessionEntity, UUID> {

}
