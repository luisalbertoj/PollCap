package com.vivi.server.poll.cap.models.services;

import java.util.List;

import com.vivi.server.poll.cap.models.entity.Respuesta;

public interface IRespuestaService {
	public List<Respuesta> findAll();
	public Respuesta findById(Long id);
	public Respuesta save(Respuesta respuesta);
	public void delete(Long id);
}
