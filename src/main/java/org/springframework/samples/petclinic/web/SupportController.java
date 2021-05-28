package org.springframework.samples.petclinic.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportController {


	@GetMapping(value = "/support")
	public String contactDetails() {
		return "support/support";
	}

}
