package org.springframework.samples.petclinic.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.petclinic.model.Adopciones;

public interface AdopcionRepository extends CrudRepository<Adopciones, Integer> {

	
	public Adopciones findById(int id)throws DataAccessException;

	@Query("SELECT a FROM Adopciones a")
	List<Adopciones> findAll();

	@Query(value="SELECT * FROM Adopciones WHERE pet_id =?1", nativeQuery=true)
	Adopciones findAdopcionIdByPet(int petId) throws DataAccessException;

}
