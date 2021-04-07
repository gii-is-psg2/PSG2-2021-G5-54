package org.springframework.samples.petclinic.web;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.Reserva;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.PetService;
import org.springframework.samples.petclinic.service.ReservaService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservas")
public class ReservaController {
	
	@Autowired
	ReservaService reservaService;
	
	@Autowired
	PetService petService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OwnerService ownerService;
	
	
	
	@ModelAttribute("mascotas")
    public Map<Integer, String> listanombres() {
		final String username = SecurityContextHolder.getContext().getAuthentication().getName();
		final List<Pet> pets = this.petService.findPetsByOwner(username);
		return pets.stream().collect(Collectors.toMap(x -> x.getId(), y -> y.getName()));
//		return StreamSupport.stream(petService.findByOwner(id).spliterator(), false).collect(Collectors.toMap(x -> x.getId(), y -> y.getName()));
		
		
	}
	
	@GetMapping
	public String listReservas(final ModelMap model) {
		final String vista = "reservas/listReserva";
		final Collection<Reserva> reserva = this.reservaService.findAll();
		model.addAttribute("reserva", reserva);
		return vista;
	}
	
	@PostMapping(path="/save")
	public String guardarReserva(@Valid final Reserva reserva, final BindingResult result, final ModelMap modelmap) {
		String vista = "reservas/listReserva";
		if(result.hasErrors()) {
			modelmap.addAttribute("reserva", reserva);
			return "reservas/editReserva";
		}else {
			if(this.reservaService.concurrent(LocalDate.parse(reserva.getFechaInicio()), LocalDate.parse(reserva.getFechaFin()), reserva.getPet())) {
				modelmap.addAttribute("message", "Reserva concurrente detectada");
				return "reservas/editReserva";
			}else {
				this.reservaService.save(reserva);
				modelmap.addAttribute("message", "Reserva guardado correctamente");
				vista = this.listReservas(modelmap);
			}
			
		}
		return vista;
	}
	
	@GetMapping(path="/new")
	public String crearReserva(final ModelMap modelmap) {
		final String vista = "reservas/editReserva";
		modelmap.addAttribute("reserva", new Reserva());
		return vista;
	}
	

}
