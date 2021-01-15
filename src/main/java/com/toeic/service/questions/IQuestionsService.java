package com.toeic.service.questions;

import com.toeic.entity.QuestionsEntity;

import java.util.List;
import java.util.UUID;

public interface IQuestionsService {
	Iterable<QuestionsEntity> findAll();

    List<QuestionsEntity> search(String q);

    QuestionsEntity findOne(UUID id);

    void save(QuestionsEntity emp);

    void delete(QuestionsEntity emp);

    List<QuestionsEntity> getAllByGroupQuestionsId(UUID groupQuestionId);
}
