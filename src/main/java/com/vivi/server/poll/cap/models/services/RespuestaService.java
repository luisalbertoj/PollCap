package com.vivi.server.poll.cap.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vivi.server.poll.cap.models.dao.IRespuestasDao;
import com.vivi.server.poll.cap.models.entity.Pregunta;
import com.vivi.server.poll.cap.models.entity.Respuesta;
@Service
public class RespuestaService implements IRespuestaService{
	@Autowired
	private IRespuestasDao respuestaDao;
	@Override
	public List<Respuesta> findAll() {
		// TODO Auto-generated method stub
		return (List<Respuesta>) respuestaDao.findAll();
	}

	@Override
	public Respuesta findById(Long id) {
		// TODO Auto-generated method stub
		return respuestaDao.findById(id).orElse(null);
	}

	@Override
	public Respuesta save(Respuesta respuesta) {
		// TODO Auto-generated method stub
		return respuestaDao.save(respuesta);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		respuestaDao.deleteById(id);
	}

}
