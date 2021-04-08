package org.springframework.samples.petclinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.repository.CauseRepository;
import org.springframework.samples.petclinic.repository.DonationRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.Collection;
import java.util.List;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    @Autowired
    private CauseRepository causeRepository;

    @Transactional
    public void save(Donation d, Cause s){
        this.donationRepository.save(d);
        s.setCurrentB(s.getCurrentB() + d.getQuantity());
    }

    @Transactional
    public void delete(Donation d){
        this.donationRepository.deleteById(d.getId());
    }

    public Collection<Donation> getDonationsByCause(Cause c){
        return this.donationRepository.getDonationByCause(c);
    }

}
