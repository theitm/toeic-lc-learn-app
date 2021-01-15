package com.toeic.service.partStruct;

import com.toeic.entity.PartStructEntity;

import java.util.List;
import java.util.UUID;

public interface IPartStructService {
	Iterable<PartStructEntity> findAll();

    List<PartStructEntity> search(String q);

    PartStructEntity findOne(UUID id);

    void save(PartStructEntity emp);

    void delete(PartStructEntity emp);
}
