package org.springframework.samples.petclinic.web;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Reserva;
import org.springframework.samples.petclinic.service.ReservaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservas")
public class ReservaController {
	
	@Autowired
	ReservaService reservaService;
	
	@GetMapping
	public String listReservas(ModelMap model) {
		String vista = "reservas/listReserva";
		Collection<Reserva> reserva = reservaService.findAll();
		model.addAttribute("reserva", reserva);
		return vista;
	}
	
	@PostMapping(path="/save")
	public String guardarReserva(@Valid Reserva reserva, BindingResult result, ModelMap modelmap) {
		String vista = "reservas/listReserva";
		if(result.hasErrors()) {
			modelmap.addAttribute("reserva", reserva);
			return "reservas/editReserva";
		}else {
			reservaService.save(reserva);
			modelmap.addAttribute("message", "Reserva guardado correctamente");
			vista = listReservas(modelmap);
		}
		return vista;
	}
	
	@GetMapping(path="/new")
	public String crearReserva(ModelMap modelmap) {
		String vista = "reservas/editReserva";
		modelmap.addAttribute("reserva", new Reserva());
		return vista;
	}
	

}
