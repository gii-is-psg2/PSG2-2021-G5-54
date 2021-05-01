package org.springframework.samples.petclinic.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;
import org.springframework.samples.petclinic.model.Adopciones;

public interface AdopcionRepository extends CrudRepository<Adopciones, Integer> {

	Collection<Adopciones> findAll() throws DataAccessException;
	
	public Adopciones findById(int id);

	//void save(Adopciones adopcion) throws DataAccessException;

	void delete(Adopciones adopcion) throws DataAccessException;

	//public Collection<Adopciones> findAll();
}
