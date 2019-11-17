package com.vivi.server.poll.cap.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.vivi.server.poll.cap.models.entity.Usuario;

public interface IUsuarioDao extends CrudRepository<Usuario, Long> {

}
