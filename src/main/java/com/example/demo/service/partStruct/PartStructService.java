package com.example.demo.service.partStruct;

import com.example.demo.model.PartStructEntity;
import com.example.demo.repository.PartStructRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PartStructService implements IPartStructService {
	@Autowired
    private PartStructRepository partStructRepository;

    @Override
    public Iterable<PartStructEntity> findAll() {
        return partStructRepository.findTop10ByOrderByPartAsc();
    }

    @Override
    public List<PartStructEntity> search(String q) {
        return partStructRepository.findByPartContaining(q);
    }

    @Override
    public PartStructEntity findOne(UUID id) {
        return partStructRepository.findById(id).orElse(null);
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
