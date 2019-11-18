package com.vivi.server.poll.cap.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vivi.server.poll.cap.models.dao.IPreguntasDao;
import com.vivi.server.poll.cap.models.entity.Pregunta;


@Service
public class PreguntaServiceImp implements IPreguntaService{
	@Autowired
	private IPreguntasDao preguntaDao;
	@Override
	public List<Pregunta> findAll() {
		// TODO Auto-generated method stub
		return (List<Pregunta>) preguntaDao.findAll();
	}

	@Override
	public Pregunta findById(Long id) {
		// TODO Auto-generated method stub
		return preguntaDao.findById(id).orElse(null);
	}

	@Override
	public Pregunta save(Pregunta pregunta) {
		// TODO Auto-generated method stub
		return preguntaDao.save(pregunta);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		preguntaDao.deleteById(id);
	}


}
