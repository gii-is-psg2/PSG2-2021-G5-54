package org.springframework.samples.petclinic.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Adopciones;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.User;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.SolicitudAdopcion;
import org.springframework.samples.petclinic.service.AdopcionService;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.PetService;
import org.springframework.samples.petclinic.service.SolicitudAdopcionService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdopcionController {
	private static final String VISTA_DESCRIPCION = "adopciones/editAdopcion";
	private static final String DETALLES_OWNER = "owners/ownerDetails";
	private static final String ADOPCIONES = "/adopciones";

	private final PetService petService;

	@Autowired
	AdopcionService adopcionService;

	private final OwnerService ownerService;

	private final SolicitudAdopcionService solicitudadopcionService;

	private final UserService userService;

	public AdopcionController(AdopcionService adopcionService, PetService petService, OwnerService ownerService,
			SolicitudAdopcionService solicitudadopcionService, UserService userService) {
		this.petService = petService;
		this.adopcionService = adopcionService;
		this.ownerService = ownerService;
		this.solicitudadopcionService = solicitudadopcionService;
		this.userService = userService;
	}

	@GetMapping(value = { "/adopciones" })
	public String ListaAdopciones(final ModelMap model) {
		model.addAttribute("adopciones", this.adopcionService.findAll());
		return "adopciones/listaAdopciones";
	}

	@GetMapping(value = "/adopciones/{adopcionId}/adopcion")
	public String addDescripcion(@Valid Adopciones adopcion, BindingResult result,
			@PathVariable("adopcionId") int adopcionId, ModelMap model) {
		Adopciones a = this.adopcionService.findAdopcionById(adopcionId);
		Pet petAdoptado = this.adopcionService.findAdopcionById(adopcionId).getPet();
		SolicitudAdopcion soladop = new SolicitudAdopcion();

		model.addAttribute("adopcion", a);
		model.addAttribute("solicitudAdopcion", soladop);
		model.addAttribute("pet", petAdoptado);
		return VISTA_DESCRIPCION;
	}

	@PostMapping(value = "/adopciones/{adopcionId}/adopcion")
	public String solicitudAdopcion(@Valid SolicitudAdopcion solicitudadopcion, BindingResult result,
			@PathVariable("adopcionId") int adopcionId, ModelMap model) {
		Adopciones a = this.adopcionService.findAdopcionById(adopcionId);
		Pet petAdoptado = a.getPet();

		User user = userService.getUser();
		String u1 = user.getUsername();
		Owner owner = ownerService.findOwnerByUsername(u1).get();
		solicitudadopcion.setOwner(owner);
		System.out.println(owner);
		solicitudadopcion.setAdopcion(a);
		model.addAttribute(solicitudadopcion);
		if (result.hasErrors()) {
			model.addAttribute("solicitudAdopcion", solicitudadopcion);
			model.addAttribute("pet", petAdoptado);
			return VISTA_DESCRIPCION;
		} else {
			this.solicitudadopcionService.saveAdopcion(solicitudadopcion);
		}
		return ListaAdopciones(model);
	}

	@GetMapping(value = "/owners/{ownerId}/pets/{petId}/adopciones/new")
	public String newAdopcion(@Valid Adopciones adopcion, BindingResult result, @PathVariable("petId") int petId,
			@PathVariable("ownerId") int ownerId, ModelMap model) {

		if (result.hasErrors()) {
			model.put("adopcion", adopcion);
			return DETALLES_OWNER;
		} else {
			Adopciones adopciones1 = new Adopciones();
			Owner owner = ownerService.findOwnerById(ownerId);
			Pet pet = petService.findPetById(petId);
			adopciones1.setOwner(owner);
			adopciones1.setPet(pet);
			adopcionService.saveAdopcion(adopciones1);
			return "redirect:/adopciones";
		}
	}

}
