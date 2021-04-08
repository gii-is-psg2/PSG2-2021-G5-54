package org.springframework.samples.petclinic.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.User;
import org.springframework.samples.petclinic.service.CauseService;
import org.springframework.samples.petclinic.service.DonationService;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/causes")
public class CauseController {

    public static final String CAUSES_LISTING = "causes/causesListing";
    public static final String CAUSE_FORM = "causes/causeForm";

    @Autowired
    CauseService causeService;

    @Autowired
    DonationService donationService;

    @Autowired
    OwnerService ownerService;

    @Autowired
    UserService userService;

    public Boolean hasAuthority(Optional<Owner> owner, User user) {
        if (user.equals(null) || !owner.isPresent())
            return false;
        else
            return owner.get().getUser().equals(user) || user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("admin"));
    }

    @GetMapping
    public String listCauses(ModelMap modelMap, Authentication auth){
        if (auth.isAuthenticated()){
            modelMap.addAttribute("causes", causeService.getAllCauses());
            return CAUSES_LISTING;
        }else {
            modelMap.addAttribute("message", "You must be logged ^_^!");
            return "welcome";
        }
    }

}
