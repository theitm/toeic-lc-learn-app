package com.toeic.repository;

import com.toeic.entity.PartStructEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface PartStructRepository extends JpaRepository<PartStructEntity, UUID> {

    List<PartStructEntity> findByPartContaining(String q);
    List<PartStructEntity> findTop10ByOrderByPartAsc();

}
