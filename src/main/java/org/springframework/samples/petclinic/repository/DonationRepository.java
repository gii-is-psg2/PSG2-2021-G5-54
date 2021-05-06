package org.springframework.samples.petclinic.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.samples.petclinic.model.Cause;
import org.springframework.samples.petclinic.model.Donation;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;

@Repository
public interface DonationRepository extends CrudRepository<Donation, Integer> {

    Optional<Donation> getDonationById(Integer id);

    Collection<Donation> getDonationByCause(Cause c);

}
