package org.springframework.samples.petclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Adopciones;
import org.springframework.samples.petclinic.repository.AdopcionRepository;
import org.springframework.transaction.annotation.Transactional;

public class AdopcionService {

	@Autowired
	AdopcionRepository adopcionRepository;

	public AdopcionService(AdopcionRepository adopcionRepository) {
		this.adopcionRepository = adopcionRepository;
	}

	@Transactional(readOnly = true)
	public Adopciones findAdopcionById(int id) throws DataAccessException {
		return adopcionRepository.findById(id);
	}

	@Transactional
	public void saveAdopcion(Adopciones adoptado) {
		this.adopcionRepository.save(adoptado);
	}

	@Transactional
	public List<Adopciones> findAll() {
		return this.adopcionRepository.findAll();
	}

}
