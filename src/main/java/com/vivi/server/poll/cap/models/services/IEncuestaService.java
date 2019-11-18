package com.vivi.server.poll.cap.models.services;

import java.util.List;

import com.vivi.server.poll.cap.models.entity.Encuesta;

public interface IEncuestaService {
	public List<Encuesta> findAll();
	public Encuesta findById(Long id);
	public Encuesta save(Encuesta usuario);
	public void delete(Long id);
}
