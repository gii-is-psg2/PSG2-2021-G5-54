package org.springframework.samples.petclinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
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

    @Transactional
    public void save(Donation d){
        this.donationRepository.save(d);
    }

    @Transactional
    public void delete(Donation d){
        this.donationRepository.deleteById(d.getId());
    }

    public Collection<Donation> getDonatiosByCause(Cause c){
        return this.donationRepository.getDonationByCause(c);
    }

}
