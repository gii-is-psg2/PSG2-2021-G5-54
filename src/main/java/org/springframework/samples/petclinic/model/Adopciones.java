package org.springframework.samples.petclinic.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "adopciones")
public class Adopciones extends BaseEntity {

	@JoinColumn(name = "pet_id")
	@OneToOne
	private Pet pet;

	@JoinColumn(name = "owner_id")
	@OneToOne
	private Owner owner;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "adopcion")
	private List<SolicitudAdopcion> solicitudadopcion;

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	@Override
		public String toString() {
			return "Adopcion [owner="+owner+"pet="+pet+"solicitudadopcion"+solicitudadopcion;
		}

}


