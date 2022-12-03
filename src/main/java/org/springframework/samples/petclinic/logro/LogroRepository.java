package org.springframework.samples.petclinic.logro;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LogroRepository extends CrudRepository<Logro, Long> { 
    public List<Logro> findAll();
} 