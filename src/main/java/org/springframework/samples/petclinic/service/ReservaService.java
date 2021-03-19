package org.springframework.samples.petclinic.service;

import java.util.Collection;
import java.util.Optional;


import javax.validation.Valid;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Reserva;
import org.springframework.samples.petclinic.repository.ReservaRepository;
import org.springframework.stereotype.Service;

@Service
public class ReservaService {
	
	@Autowired
	ReservaRepository ReservaRepo;
	
	
	
	@Transactional(readOnly = true)
	public Collection<Reserva> findAll(){
		return ReservaRepo.findAll();
	}
	
	@Transactional
	public int reservaCount() {
		return (int) ReservaRepo.count();
	}
	
	@Transactional(readOnly = true)
	public Optional<Reserva> findById(int id) {
		return ReservaRepo.findById(id);
	}
	
	public void save(@Valid Reserva reserva) {
		ReservaRepo.save(reserva);
		
	}

}
