package com.vivi.server.poll.cap.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vivi.server.poll.cap.models.dao.IUsuarioDao;
import com.vivi.server.poll.cap.models.entity.Usuario;

@Service
public class UsuarioServicesImp implements IUsuarioService {
	@Autowired
	private IUsuarioDao usuarioDao;

	@Override
	@Transactional(readOnly = true)
	public List<Usuario> findAll() {
		return (List<Usuario>) usuarioDao.findAll();
	}

	@Override
	public Usuario login(Usuario user) {
		List<Usuario> usuarios = findAll();
		for(Usuario usuario: usuarios) {
			if( 
			usuario.getUsername().equals(user.getUsername()) &&
			usuario.getPassword().equals(user.getPassword()))
				return usuario;
		}
		return null;
	}
	
	@Override
	@Transactional(readOnly = true)
	public Usuario findById(Long id) {
		// TODO Auto-generated method stub
		return usuarioDao.findById(id).orElse(null);
	}

	@Override
	@Transactional
	public Usuario save(Usuario usuario) {
		// TODO Auto-generated method stub
		return usuarioDao.save(usuario);
	}

	@Override
	@Transactional
	public void delete(Long id) {
		usuarioDao.deleteById(id);
	}

}
