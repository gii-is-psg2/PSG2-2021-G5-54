package org.springframework.samples.petclinic.service;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.Reserva;
import org.springframework.samples.petclinic.repository.ReservaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReservaService {
	
	@Autowired
	ReservaRepository ReservaRepo;
	
	
	
	@Transactional(readOnly = true)
	public Collection<Reserva> findAll(){
		return this.ReservaRepo.findAll();
	}
	
	@Transactional
	public int reservaCount() {
		return (int) this.ReservaRepo.count();
	}
	
	@Transactional(readOnly = true)
	public Optional<Reserva> findById(final int id) {
		return this.ReservaRepo.findById(id);
	}
	
	public void save(@Valid final Reserva reserva) {
		this.ReservaRepo.save(reserva);
		
	}
	
	public boolean concurrent(final LocalDate ini, final LocalDate fin, final Pet p) {
		boolean sol= false;
		final Set<Reserva> reservas=p.getReservas();
		for(final Reserva r:reservas) {
			final LocalDate f_ini = LocalDate.parse(r.getFechaInicio());
			final LocalDate f_fin = LocalDate.parse(r.getFechaFin());
			if(ini.isEqual(f_ini) && fin.isEqual(f_fin) || ini.isAfter(f_ini) && fin.isBefore(f_fin) 
				|| ini.isBefore(f_ini) && fin.isAfter(f_fin) || ini.isAfter(f_ini) && fin.isEqual(f_fin)
				|| ini.isEqual(f_ini) && fin.isBefore(f_fin) || ini.isBefore(f_ini) && fin.isBefore(f_fin)) {
				sol=true;
			}
		}
		return sol;
		
	}

}
