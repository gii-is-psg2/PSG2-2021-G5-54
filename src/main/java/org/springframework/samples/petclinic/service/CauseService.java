package org.springframework.samples.petclinic.service;

import org.springframework.beans.CachedIntrospectionResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.CauseStatus;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.samples.petclinic.repository.CauseRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collection;
import java.util.Optional;

@Service
public class CauseService {

    @Autowired
    private CauseRepository causeRepository;

    @Transactional
    public void save(Cause c){
        this.causeRepository.save(c);
    }

    @Transactional
    public void delete(Cause c){
        this.causeRepository.deleteById(c.getId());
    }

    public Collection<Cause> getByStatus(CauseStatus s){
        return this.causeRepository.getCauseByStatus(s);
    }

    public Optional<Cause> getById(Integer i){
        return this.causeRepository.getCauseById(i);
    }

    public Collection<Cause> getAllCauses(){
        return this.causeRepository.findAll();
    }
}
