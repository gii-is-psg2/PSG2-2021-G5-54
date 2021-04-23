package org.springframework.samples.petclinic.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.petclinic.model.SolicitudAdopcion;

public interface SolicitudAdopcionRepository extends CrudRepository<SolicitudAdopcion, Integer> {

	SolicitudAdopcion findById(int id) throws DataAccessException;

	@Query("SELECT a FROM SolicitudAdopcion a")
	List<SolicitudAdopcion> findAll();
}
