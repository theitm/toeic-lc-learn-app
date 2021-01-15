package com.toeic.service.answers;

import com.toeic.entity.AnswersEntity;

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
