package com.example.demo.repository;

import com.example.demo.model.GroupQuestionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface GroupQuestionsRepository extends JpaRepository<GroupQuestionsEntity, UUID> {
    @Query("select g from GroupQuestionsEntity as g where g.partStructId = :partStructId")
    List<GroupQuestionsEntity> getAllByPartStructId(@Param("partStructId") UUID partStructId);
}
