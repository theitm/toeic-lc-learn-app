package com.example.demo.service.groupQuestions;

import com.example.demo.model.GroupQuestionsEntity;

import java.util.List;
import java.util.UUID;

public interface IGroupQuestionsService {
	Iterable<GroupQuestionsEntity> findAll();

    List<GroupQuestionsEntity> search(String q);

    GroupQuestionsEntity findOne(UUID id);

    void save(GroupQuestionsEntity emp);

    void delete(GroupQuestionsEntity emp);

    List<GroupQuestionsEntity> getAllByPartId(UUID partStructId);
}
