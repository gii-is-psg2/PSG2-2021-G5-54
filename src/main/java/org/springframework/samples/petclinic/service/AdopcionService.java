package org.springframework.samples.petclinic.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.model.Adopciones;
import org.springframework.samples.petclinic.model.SolicitudAdopcion;
import org.springframework.samples.petclinic.repository.AdopcionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdopcionService {

	private AdopcionRepository adopcionRepository;
	@Autowired
	private SolicitudAdopcionService solicitudadopcionService;

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
	public Collection<Adopciones> findAll() {
		return this.adopcionRepository.findAll();
	}
	
	@Transactional
	public void deleteAdoption(Adopciones adopcion) throws DataAccessException {
		List<SolicitudAdopcion> listaAdopc= this.solicitudadopcionService.findSolicitudByAdopcionId(adopcion.getId());
		for (int i =0; i<listaAdopc.size();i++) {
			solicitudadopcionService.deleteSolicitudAdopcion(listaAdopc.get(i));;
		}
		adopcionRepository.delete(adopcion);
	}

}
