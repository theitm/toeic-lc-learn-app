package com.example.demo.repository;

import com.example.demo.model.AnswersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface AnswersRepository extends JpaRepository<AnswersEntity, UUID> {

    List<AnswersEntity> getAllByQuestionIdOrderByLabelAsc(UUID questionsId);
}
