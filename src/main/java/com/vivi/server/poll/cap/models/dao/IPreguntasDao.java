package com.vivi.server.poll.cap.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.vivi.server.poll.cap.models.entity.Pregunta;

public interface IPreguntasDao extends CrudRepository<Pregunta, Long>{

}
