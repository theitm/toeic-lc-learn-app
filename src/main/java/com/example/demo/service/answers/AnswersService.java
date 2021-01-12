package com.example.demo.service.answers;

import com.example.demo.model.AnswersEntity;
import com.example.demo.repository.AnswersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AnswersService implements IAnswersService {
	@Autowired
    private AnswersRepository answersRepository;

    @Override
    public Iterable<AnswersEntity> findAll() {
        return answersRepository.findAll();
    }

    @Override
    public List<AnswersEntity> search(String q) {
//        return AnswersRepository.findByPartContaining(q);
        return null;
    }

    @Override
    public AnswersEntity findOne(UUID id) {
        return answersRepository.findById(id).orElse(null);
    }

    @Override
    public void save(AnswersEntity contact) {
    	answersRepository.save(contact);
    }

    @Override
    public void delete(AnswersEntity emp) {
    	answersRepository.delete(emp);
    }

    @Override
    public List<AnswersEntity> getAllByQuestionsId(UUID questionsId) {
        return answersRepository.getAllByQuestionIdOrderByLabelAsc(questionsId);
    }
}	
