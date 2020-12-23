package com.example.demo.service;

import java.util.List;

import com.example.demo.model.PartStructEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.PartStructRepository;

@Service
public class PartStructService implements IPartStructService {
	@Autowired
    private PartStructRepository partStructRepository;

    @Override
    public Iterable<PartStructEntity> findAll() {
        return partStructRepository.findAll();
    }

    @Override
    public List<PartStructEntity> search(String q) {
        return partStructRepository.findByPartContaining(q);
    }

    @Override
    public PartStructEntity findOne(long id) {
        return partStructRepository.findOne(id);
    }

    @Override
    public void save(PartStructEntity contact) {
    	partStructRepository.save(contact);
    }

    @Override
    public void delete(PartStructEntity emp) {
    	partStructRepository.delete(emp);
    }
}	
