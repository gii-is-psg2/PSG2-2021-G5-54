package org.springframework.samples.petclinic.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
	@Table(name= "solicitudadopcion")
	public class SolicitudAdopcion extends BaseEntity{
		@JoinColumn(name="owner")
		@ManyToOne(fetch=FetchType.EAGER)
		
		private Owner owner;
		
		@Column(name = "descripcion")
		private String descripcion;
		
		@ManyToOne (cascade = CascadeType.ALL,fetch = FetchType.EAGER)
		@JoinColumn(name = "adopcion")
		private Adopciones adopcion;

		public Owner getOwner() {
			return owner;
		}

		public void setOwner(Owner owner) {
			this.owner = owner;
		}


		public String getDescripcion() {
			return descripcion;
		}

		public void setDescripcion(String descripcion) {
			this.descripcion = descripcion;
		}

		public Adopciones getAdopcion() {
			return adopcion;
		}

		public void setAdopcion(Adopciones adopcion) {
			this.adopcion = adopcion;
		}

	}
	


