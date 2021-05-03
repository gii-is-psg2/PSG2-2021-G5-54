package org.springframework.samples.petclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Adopciones;
import org.springframework.samples.petclinic.model.SolicitudAdopcion;
import org.springframework.samples.petclinic.repository.AdopcionRepository;
import org.springframework.samples.petclinic.repository.SolicitudAdopcionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SolicitudAdopcionService {

	private SolicitudAdopcionRepository solicitudadopcionRepository;
	@Autowired
	private AdopcionRepository adopcionRepository;

	public SolicitudAdopcionService(SolicitudAdopcionRepository solicitudadopcionRepository,
			AdopcionRepository adopcionRepository) {
		this.solicitudadopcionRepository = solicitudadopcionRepository;
		this.adopcionRepository = adopcionRepository;
	}

	@Transactional(readOnly = true)
	public SolicitudAdopcion findSolicitudById(int id) throws DataAccessException {
		return solicitudadopcionRepository.findById(id);
	}

	@Transactional
	public void saveSolicitud(SolicitudAdopcion petAdoptado) {
		this.solicitudadopcionRepository.save(petAdoptado);
	}

	@Transactional
	public List<SolicitudAdopcion> findSolicitudByIdPet(int petId) {
		Adopciones adop = this.adopcionRepository.findAdopcionIdByPet(petId);
		List<SolicitudAdopcion> res = this.solicitudadopcionRepository.findSolicitudByAdopcionId(adop.getId());
		return res;
	}

	@Transactional
	public List<SolicitudAdopcion> findAll() {
		return this.solicitudadopcionRepository.findAll();
	}

	@Transactional
	public void deleteSolicitudAdopcion(SolicitudAdopcion solicitudAdopcion) throws DataAccessException {
		solicitudadopcionRepository.delete(solicitudAdopcion);
	}

	@Transactional
	public List<SolicitudAdopcion> findSolicitudByAdopcionId(int adopcionId) {
		return solicitudadopcionRepository.findSolicitudByAdopcionId(adopcionId);
	}

}
