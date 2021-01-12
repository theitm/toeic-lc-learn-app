package com.example.demo.service.answers;

import com.example.demo.model.AnswersEntity;

import java.util.List;
import java.util.UUID;

public interface IAnswersService {
	Iterable<AnswersEntity> findAll();

    List<AnswersEntity> search(String q);

    AnswersEntity findOne(UUID id);

    void save(AnswersEntity emp);

    void delete(AnswersEntity emp);

    List<AnswersEntity> getAllByQuestionsId(UUID questionsId);
}
