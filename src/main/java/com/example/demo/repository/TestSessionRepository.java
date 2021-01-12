package com.example.demo.repository;

import com.example.demo.model.TestSessionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface TestSessionRepository extends JpaRepository<TestSessionEntity, UUID> {

}
