package com.vivi.server.poll.cap.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vivi.server.poll.cap.models.dao.IEncuestaDao;
import com.vivi.server.poll.cap.models.entity.Encuesta;

@Service
public class EncuestaServiceImp implements IEncuestaService{
	@Autowired
	private IEncuestaDao encuestaDao;
	
	@Override
	public List<Encuesta> findAll() {
		return (List<Encuesta>) encuestaDao.findAll();
		
	}

	@Override
	@Transactional(readOnly = true)
	public Encuesta findById(Long id) {
		// TODO Auto-generated method stub
		return encuestaDao.findById(id).orElse(null);
	}

	@Override
	public Encuesta save(Encuesta encuesta) {
		// TODO Auto-generated method stub
		return encuestaDao.save(encuesta);
	}

	@Override
	public void delete(Long id) {
		encuestaDao.deleteById(id);
		
	}

}
