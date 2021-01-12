package com.example.demo.repository;

import com.example.demo.model.QuestionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface QuestionsRepository extends JpaRepository<QuestionsEntity, UUID> {
    List<QuestionsEntity> getAllByGroupQuestionsId(UUID groupQuestionsId);
}
