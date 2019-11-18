package com.vivi.server.poll.cap.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vivi.server.poll.cap.models.dao.IServicioBienestar;
import com.vivi.server.poll.cap.models.entity.Respuesta;
import com.vivi.server.poll.cap.models.entity.ServicioBienestar;
@Service
public class ServicioBienestarImp implements IServicioBienestarService {
	@Autowired
	private IServicioBienestar servicioBienestarDao;
	@Override
	public List<ServicioBienestar> findAll() {
		// TODO Auto-generated method stub
		return (List<ServicioBienestar>) servicioBienestarDao.findAll();
	}

	@Override
	public ServicioBienestar findById(Long id) {
		// TODO Auto-generated method stub
		return servicioBienestarDao.findById(id).orElse(null);
	}

	@Override
	public ServicioBienestar save(ServicioBienestar servicioBienestar) {
		// TODO Auto-generated method stub
		return servicioBienestarDao.save(servicioBienestar);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		servicioBienestarDao.deleteById(id);
	}

}
