package com.vivi.server.poll.cap.models.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="contenido")
public class Contenido implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String deacuerdo;
	private String indiferente;
	private String desacuerdo;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String getDeacuerdo() {
		return deacuerdo;
	}
	public void setDeacuerdo(String deacuerdo) {
		this.deacuerdo = deacuerdo;
	}
	public String getIndiferente() {
		return indiferente;
	}
	public void setIndiferente(String indiferente) {
		this.indiferente = indiferente;
	}
	public String getDesacuerdo() {
		return desacuerdo;
	}
	public void setDesacuerdo(String desacuerdo) {
		this.desacuerdo = desacuerdo;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
}
