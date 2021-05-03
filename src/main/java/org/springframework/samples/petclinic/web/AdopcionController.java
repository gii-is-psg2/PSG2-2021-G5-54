package org.springframework.samples.petclinic.web;

import java.util.List;

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
	private final AdopcionService adopcionService;
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
	public String addDescripcion(@Valid SolicitudAdopcion solicitudAdopcion,BindingResult result,
			@PathVariable("adopcionId") int adopcionId, ModelMap model) {
		Adopciones a = this.adopcionService.findAdopcionById(adopcionId);
		Pet petAdoptado = this.adopcionService.findAdopcionById(adopcionId).getPet();
		SolicitudAdopcion soladop = new SolicitudAdopcion();
		soladop.setAdopcion(a);
		model.addAttribute("adopcion", a);
		model.addAttribute("solicitudAdopcion", soladop);
		model.addAttribute("pet", petAdoptado);
		return VISTA_DESCRIPCION;
	}

	@PostMapping(value = "/adopciones/{adopcionId}/adopcion")
	public String solicitudAdopcion(@Valid SolicitudAdopcion solicitudAdopcion,BindingResult result,
			@PathVariable("adopcionId") int adopcionId, ModelMap model) {
		Adopciones a = this.adopcionService.findAdopcionById(adopcionId);
		Pet petAdoptado = a.getPet();

		User user = userService.getUser();
		String u1 = user.getUsername();
		Owner owner = ownerService.findOwnerByUsername(u1).get();
		
		if (result.hasErrors()) {
			model.addAttribute("solicitudAdopcion", solicitudAdopcion);
			model.addAttribute("pet", petAdoptado);
			return VISTA_DESCRIPCION;
			
		} else if(solicitudAdopcion.getOwner().equals(owner)){
			model.addAttribute("SolicitudAdopcion",solicitudAdopcion);
			model.addAttribute("pet",petAdoptado);
			model.addAttribute("message","No puedes adoptar a tu propia mascota");
			return VISTA_DESCRIPCION;
		}
		else {
			this.solicitudadopcionService.saveSolicitud(solicitudAdopcion);
		}
		return "redirect:" +ADOPCIONES;
	}
	
	
	@GetMapping(value = "/owners/{ownerId}/pets/{petId}/adopciones/new")
	public String newAdopcionGet(ModelMap model,
			@PathVariable("ownerId")int ownerId,
			@PathVariable("petId")int petId) {
		
		Pet petAdoptado = this.petService.findPetById(petId);
		Owner owner = this.ownerService.findOwnerById(ownerId);

		model.addAttribute("pet", petAdoptado);
		model.addAttribute("owner",owner);  
		Adopciones adopciones1 = new Adopciones();
		adopciones1.setOwner(owner);
		adopciones1.setPet(petAdoptado);
		adopcionService.saveAdopcion(adopciones1);
		return DETALLES_OWNER;
	}
			
	
	
	
	   @GetMapping(value="/owners/{ownerId}/pets/{petId}/adopciones/solicitudes")
	    public String solicitudesAdopciones(@Valid Adopciones adoption, BindingResult result, @PathVariable("petId") int petId, @PathVariable("ownerId") int ownerId, ModelMap model) {
		    List<SolicitudAdopcion> solicitudes= this.solicitudadopcionService.findSolicitudByIdPet(petId);
		    model.addAttribute("solicitudes",solicitudes);
	    	return "adopciones/SolicitudAdopcionList";
	    	}
	    
	    @GetMapping(value="/adopciones/{adoptionId}/{adoptionRequestId}/aceptar")
		public String aceptarSolicitudAdopcion(@Valid Adopciones adoption, BindingResult result,@PathVariable("adoptionId") int adoptionId, @PathVariable("adoptionRequestId") int adoptionRequestId, ModelMap model) {	
	    	SolicitudAdopcion adopreq= this.solicitudadopcionService.findSolicitudById(adoptionRequestId);
	    	Adopciones adop = adopreq.getAdopcion();
	    	Pet mascota = adop.getPet();
	    	Pet mascota2 = mascota;
	    	Owner antiguoOwner = mascota.getOwner();
	    	Owner nuevoOwner = adopreq.getOwner();
	    	nuevoOwner.addPet(mascota2);
	    	antiguoOwner.removePet(mascota);
	    	this.solicitudadopcionService.deleteSolicitudAdopcion(adopreq);
	    	this.adopcionService.deleteAdoption(adop);	
	    	return "redirect:/owners/" + antiguoOwner.getId(); 
	    }
	    
	    @GetMapping(value="/adopciones/{adoptionId}/{adoptionRequestId}/denegar")
		public String denegarSolicitudAdopcion(@Valid Adopciones adoption, BindingResult result,@PathVariable("adoptionId") int adoptionId, @PathVariable("adoptionRequestId") int adoptionRequestId, ModelMap model) {	
	    	SolicitudAdopcion adopreq= this.solicitudadopcionService.findSolicitudById(adoptionRequestId);
	    	Owner owner=adopreq.getAdopcion().getPet().getOwner();
	    	this.solicitudadopcionService.deleteSolicitudAdopcion(adopreq);
	    	return "redirect:/owners/" + owner.getId(); 
	    }

}
