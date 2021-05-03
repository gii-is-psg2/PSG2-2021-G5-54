package org.springframework.samples.petclinic.model;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="adopciones")
public class Adopcion extends BaseEntity {
	
	@NotEmpty
	private String description;
	
	@OneToOne
	@JoinColumn(name = "pet_id")
	private Pet pet;
	

	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	public Pet getPet() {
		return this.pet;
	}

	public void setPet(final Pet pet) {
		this.pet = pet;
	}

	
}