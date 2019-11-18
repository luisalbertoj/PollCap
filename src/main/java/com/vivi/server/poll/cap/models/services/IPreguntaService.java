package com.vivi.server.poll.cap.models.services;

import java.util.List;

import com.vivi.server.poll.cap.models.entity.Pregunta;

public interface IPreguntaService {
	public List<Pregunta> findAll();
	public Pregunta findById(Long id);
	public Pregunta save(Pregunta pregunta);
	public void delete(Long id);
}
