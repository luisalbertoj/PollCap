package com.vivi.server.poll.cap.models.services;

import java.util.List;

import com.vivi.server.poll.cap.models.entity.Usuario;

public interface IUsuarioService {
	public List<Usuario> findAll();
	public Usuario findById(Long id);
	public Usuario login(Usuario user);
	public Usuario save(Usuario usuario);
	public void delete(Long id);
}
