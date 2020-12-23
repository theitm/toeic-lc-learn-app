package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.PartStructEntity;

public interface PartStructRepository extends JpaRepository<PartStructEntity, Long> {

    List<PartStructEntity> findByPartContaining(String q);

}
