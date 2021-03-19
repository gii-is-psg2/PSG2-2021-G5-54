package org.springframework.samples.petclinic.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "reservas")
public class Reserva extends BaseEntity{

	@Column(name = "fecha_inicio")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private LocalDate fecha_inicio;
	
	@Column(name = "fecha_fin")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private LocalDate fecha_fin;
	
	public void setFechaInicio(LocalDate fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	public LocalDate getFechaInicio() {
		return this.fecha_inicio;
	}
	
	public void setFechaFin(LocalDate fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	public LocalDate getFechaFin() {
		return this.fecha_fin;
	}

	
//	@OneToOne
//	@JoinColumn(name = "pet_id")
//	private Pet pet;
}
