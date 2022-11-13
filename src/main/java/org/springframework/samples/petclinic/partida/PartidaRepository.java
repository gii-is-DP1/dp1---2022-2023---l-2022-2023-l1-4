package org.springframework.samples.petclinic.partida;


import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

@Repository
public interface PartidaRepository extends CrudRepository<Partida,Integer>{

    List<Partida> findAll();
    Partida findByName(String name);


    @Query("SELECT partida FROM Partida partida WHERE partida.id =:id")
	public Partida findById(@Param("id") int id);

    @Query("SELECT DISTINCT partida FROM Partida partida WHERE partida.name LIKE :name%")
	public Collection<Partida> encuentraPorNombre(@Param("name") String name);
   
}
