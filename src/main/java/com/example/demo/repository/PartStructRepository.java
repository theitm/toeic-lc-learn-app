package com.example.demo.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.PartStructEntity;

public interface PartStructRepository extends JpaRepository<PartStructEntity, UUID> {

    List<PartStructEntity> findByPartContaining(String q);

}
