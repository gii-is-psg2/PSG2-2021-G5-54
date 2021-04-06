package org.springframework.samples.petclinic.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "reservas")
public class Reserva extends BaseEntity{

	@NotNull
	@Column(name = "fecha_inicio")
	//@DateTimeFormat(pattern = "yyyy/MM/dd")
	private String fechaInicio;

	@NotNull
	@Column(name = "fecha_fin")
	//@DateTimeFormat(pattern = "yyyy/MM/dd")
	private String fechaFin;

	@ManyToOne()
	@JoinColumn(name = "pet_id")
	private Pet pet;
}
