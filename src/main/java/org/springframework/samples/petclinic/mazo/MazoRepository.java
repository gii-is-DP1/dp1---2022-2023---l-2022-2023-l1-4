package org.springframework.samples.petclinic.mazo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MazoRepository extends CrudRepository<Mazo, Integer>{

    List<Mazo> findAll();
    
}
