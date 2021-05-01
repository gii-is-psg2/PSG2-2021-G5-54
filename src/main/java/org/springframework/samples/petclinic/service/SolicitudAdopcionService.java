package org.springframework.samples.petclinic.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.SolicitudAdopcion;
import org.springframework.samples.petclinic.repository.SolicitudAdopcionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SolicitudAdopcionService {

	private SolicitudAdopcionRepository solicitudadopcionRepository;

	public SolicitudAdopcionService(SolicitudAdopcionRepository solicitudadopcionRepository) {
		this.solicitudadopcionRepository = solicitudadopcionRepository;
	}

	@Transactional(readOnly = true)
	public SolicitudAdopcion findAdopcionById(int id) throws DataAccessException {
		return solicitudadopcionRepository.findById(id);
	}

	@Transactional
	public void saveAdopcion(SolicitudAdopcion adoptado) {
		this.solicitudadopcionRepository.save(adoptado);
	}

	@Transactional
	public List<SolicitudAdopcion> findAll() {
		return this.solicitudadopcionRepository.findAll();
	}

}
