package org.springframework.samples.petclinic.mazo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MazoRepository extends CrudRepository<Mazo, Integer>{

}
