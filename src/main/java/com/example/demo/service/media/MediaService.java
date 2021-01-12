package com.example.demo.service.media;

import com.example.demo.model.MediaEntity;
import com.example.demo.repository.MediaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MediaService implements IMediaService {
	@Autowired
    private MediaRepository mediaRepository;

    @Override
    public Iterable<MediaEntity> findAll() {
        return mediaRepository.findAll();
    }

    @Override
    public List<MediaEntity> search(String q) {
//        return MediaRepository.findByPartContaining(q);
        return null;
    }

    @Override
    public MediaEntity findOne(UUID id) {
        return mediaRepository.findById(id).orElse(null);
    }

    @Override
    public void save(MediaEntity contact) {
    	mediaRepository.save(contact);
    }

    @Override
    public void delete(MediaEntity emp) {
    	mediaRepository.delete(emp);
    }

    @Override
    public List<MediaEntity> getAllByGroupQuestionsId(UUID groupQuestionsId) {
        return mediaRepository.getAllByGroupQuestionsId(groupQuestionsId);
    }
}
