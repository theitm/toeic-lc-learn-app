package com.example.demo.service.media;

import com.example.demo.model.MediaEntity;

import java.util.List;
import java.util.UUID;

public interface IMediaService {
	Iterable<MediaEntity> findAll();

    List<MediaEntity> search(String q);

    MediaEntity findOne(UUID id);

    void save(MediaEntity emp);

    void delete(MediaEntity emp);

    List<MediaEntity> getAllByGroupQuestionsId(UUID groupQuestionsId);
}
