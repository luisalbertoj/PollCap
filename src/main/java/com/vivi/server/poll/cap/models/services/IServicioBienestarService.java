package com.vivi.server.poll.cap.models.services;

import java.util.List;

import com.vivi.server.poll.cap.models.entity.ServicioBienestar;

public interface IServicioBienestarService {
	public List<ServicioBienestar> findAll();
	public ServicioBienestar findById(Long id);
	public ServicioBienestar save(ServicioBienestar servicioBienestar);
	public void delete(Long id);
}
