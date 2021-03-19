package org.springframework.samples.petclinic.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "reservas")
public class Reserva extends BaseEntity{

	@Column(name = "fecha_inicio")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private LocalDate fechaInicio;
	
	@Column(name = "fecha_fin")
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private LocalDate fechaFin;
	
//	public void setFechaInicio(LocalDate fechaInicio) {
//		this.fechaInicio = fechaInicio;
//	}
//
//	public LocalDate getFechaInicio() {
//		return this.fechaInicio;
//	}
//	
//	public void setFechaFin(LocalDate fechaFin) {
//		this.fechaFin = fechaFin;
//	}
//
//	public LocalDate getFechaFin() {
//		return this.fechaInicio;
//	}

	
//	@OneToOne
//	@JoinColumn(name = "pet_id")
//	private Pet pet;
}
