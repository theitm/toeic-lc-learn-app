package com.toeic.service.testSession;

import com.toeic.dto.GroupQuestionsDto;
import com.toeic.entity.TestSessionEntity;

import java.util.List;
import java.util.UUID;

public interface ITestSessionService {
	Iterable<TestSessionEntity> findAll();

    List<TestSessionEntity> search(String q);

    TestSessionEntity findOne(UUID id);

    void save(TestSessionEntity emp);

    void delete(TestSessionEntity emp);

    List<GroupQuestionsDto> generateTestSession(UUID partStuctId);
}
