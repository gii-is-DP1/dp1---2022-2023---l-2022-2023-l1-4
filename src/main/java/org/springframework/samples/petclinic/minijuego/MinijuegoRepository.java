package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MinijuegoRepository extends CrudRepository<Minijuego,Integer> {
    
    Collection<Minijuego> findAll();

    @Query("SELECT mg FROM Minijuego mg WHERE mg.name=:name")
    Minijuego findMinijuegoByName(@Param("name") String name);
    
}
