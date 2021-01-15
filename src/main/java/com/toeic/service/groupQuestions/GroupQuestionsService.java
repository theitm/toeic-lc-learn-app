package com.toeic.service.groupQuestions;

import com.toeic.entity.GroupQuestionsEntity;
import com.toeic.repository.GroupQuestionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GroupQuestionsService implements IGroupQuestionsService {
	@Autowired
    private GroupQuestionsRepository groupQuestionsRepository;

    @Override
    public Iterable<GroupQuestionsEntity> findAll() {
        return groupQuestionsRepository.findAll();
    }

    @Override
    public List<GroupQuestionsEntity> search(String q) {
//        return GroupQuestionsRepository.findByPartContaining(q);
        return null;
    }

    @Override
    public GroupQuestionsEntity findOne(UUID id) {
        return groupQuestionsRepository.findById(id).orElse(null);
    }

    @Override
    public void save(GroupQuestionsEntity contact) {
    	groupQuestionsRepository.save(contact);
    }

    @Override
    public void delete(GroupQuestionsEntity emp) {
    	groupQuestionsRepository.delete(emp);
    }

    @Override
    public List<GroupQuestionsEntity> getAllByPartId(UUID partStructId) {
        return groupQuestionsRepository.getAllByPartStructId(partStructId);
    }
}	
