package com.vivi.server.poll.cap.models.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="encuestas")
public class Encuesta implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToOne()
	@JoinColumn(name = "id_servicio_bienestar")
	private ServicioBienestar servicioBienestar;
	@ManyToOne()
	@JoinColumn(name = "id_usuario")
	private Usuario usuario;
	@Temporal(TemporalType.DATE)
	private Date createAt;
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateAt;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@PrePersist
	public void prePersist() {
		createAt = new Date();
		updateAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ServicioBienestar getServicioBienestar() {
		return servicioBienestar;
	}

	public void setServicioBienestar(ServicioBienestar servicioBienestar) {
		this.servicioBienestar = servicioBienestar;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	

}
