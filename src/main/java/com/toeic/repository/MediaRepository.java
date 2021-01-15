package com.toeic.repository;

import com.toeic.entity.MediaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface MediaRepository extends JpaRepository<MediaEntity, UUID> {

    List<MediaEntity> getAllByGroupQuestionsId(UUID groupQuestionsId);

}
