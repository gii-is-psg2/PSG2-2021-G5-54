package org.springframework.samples.petclinic.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.CauseStatus;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface CauseRepository extends CrudRepository<Cause, Integer> {

    Optional<Cause> getCauseById(Integer i);

    Collection<Cause> getCauseByStatus(CauseStatus s);

    Collection<Cause> findAll();
}
