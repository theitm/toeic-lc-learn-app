package com.example.demo.service;

import java.util.List;

import com.example.demo.model.PartStructEntity;

public interface IPartStructService {
	Iterable<PartStructEntity> findAll();

    List<PartStructEntity> search(String q);

    PartStructEntity findOne(long id);

    void save(PartStructEntity emp);

    void delete(PartStructEntity emp);
}
