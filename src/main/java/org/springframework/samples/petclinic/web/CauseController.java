package org.springframework.samples.petclinic.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.model.Owner;
import org.springframework.samples.petclinic.model.User;
import org.springframework.samples.petclinic.service.CauseService;
import org.springframework.samples.petclinic.service.DonationService;
import org.springframework.samples.petclinic.service.OwnerService;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Optional;

@Controller
@RequestMapping("/causes")
public class CauseController {

    public static final String CAUSES_LISTING = "causes/causesListing";
    public static final String CAUSE_FORM = "causes/causeForm";
    public static final String DONATION_FORM = "donations/donationForm";
    public static final String CAUSE_DETAILS = "causes/causeDetails";

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
            return "redirect:http://localhost:8080/welcome";
        }
    }

    @GetMapping("/new")
    public String getNewCauseForm(ModelMap modelMap){
        modelMap.addAttribute("cause", new Cause());
        return CAUSE_FORM;
    }

    @PostMapping("/new")
    public String postNewCauseForm(@Valid Cause c, BindingResult bindingResult, ModelMap modelMap, Authentication auth){
        if (bindingResult.hasErrors()){
            return CAUSE_FORM;
        }else{
            this.causeService.save(c);
            modelMap.addAttribute("message", "Cause saved successfully ^_^!");
            return "redirect:http://localhost:8080/causes";
        }
    }

    @GetMapping("/{causeID}/donate")
    public String getNewDonationForm(@PathVariable("causeID") int causeID,ModelMap modelMap){
       // if(this.causeService.getById())
        modelMap.addAttribute("donation", new Donation());
        return DONATION_FORM;
    }

    @PostMapping("/{causeID}/donate")
    public String postNewDonationForm(@PathVariable("causeID") int causeID,@Valid Donation d, BindingResult bindingResult,ModelMap modelMap,Authentication auth){
        if (bindingResult.hasErrors()){
            return DONATION_FORM;
        }else{
            Optional<Owner> o = ownerService.findOwnerByUsername(auth.getName());
            if(o.isPresent()){
                d.setDate(LocalDateTime.now());
                d.setCause(causeService.getById(causeID).get());
                d.setPayer(o.get());
                this.donationService.save(d,causeService.getById(causeID).get());
                modelMap.addAttribute("message", "Cause saved successfully ^_^!");

            }else{
                modelMap.addAttribute("message", "Something went wrong with your session ^_^!");
            }
        }

        return "redirect:http://localhost:8080/causes";
    }

    @GetMapping("/{causeID}")
    public String getCauseDetails(@PathVariable("causeID") int causeID, ModelMap modelMap, Authentication auth){
        Optional<Cause> c = this.causeService.getById(causeID);
        if(c.isPresent()){
            Collection<Donation> donations = this.donationService.getDonationsByCause(c.get());
            modelMap.addAttribute("cause", c.get());
            modelMap.addAttribute("donations", donations);
            return CAUSE_DETAILS;
        }else {
            modelMap.addAttribute("message", "Cant find that Cause ^_^!");
            return listCauses(modelMap, auth);
        }
    }
}
