package org.springframework.samples.petclinic.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.model.Adopciones;

public interface AdopcionRepository extends Repository<Adopciones, Integer> {

	Adopciones findById(int id) throws DataAccessException;

	void save(Adopciones adopcion) throws DataAccessException;

	void delete(Adopciones adopcion) throws DataAccessException;

	@Query("SELECT a FROM Adoption a")
	List<Adopciones> findAll();
}
