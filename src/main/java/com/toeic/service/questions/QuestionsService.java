package com.toeic.service.questions;

import com.toeic.entity.QuestionsEntity;
import com.toeic.repository.QuestionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class QuestionsService implements IQuestionsService {
	@Autowired
    private QuestionsRepository questionsRepository;

    @Override
    public Iterable<QuestionsEntity> findAll() {
        return questionsRepository.findAll();
    }

    @Override
    public List<QuestionsEntity> search(String q) {
//        return QuestionsRepository.findByPartContaining(q);
        return null;
    }

    @Override
    public QuestionsEntity findOne(UUID id) {
        return questionsRepository.findById(id).orElse(null);
    }

    @Override
    public void save(QuestionsEntity contact) {
    	questionsRepository.save(contact);
    }

    @Override
    public void delete(QuestionsEntity emp) {
    	questionsRepository.delete(emp);
    }

    @Override
    public List<QuestionsEntity> getAllByGroupQuestionsId(UUID groupQuestionId) {
        return questionsRepository.getAllByGroupQuestionsId(groupQuestionId);
    }
}	
