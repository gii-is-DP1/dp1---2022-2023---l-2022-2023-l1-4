package org.springframework.samples.petclinic.carta;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartaRepository extends CrudRepository<Carta, Integer>{

    //@Query("SELECT c FROM Carta c where c.player_id=:player_id")
    //List<Carta> findByPlayerId(@Param("player_id")int player_id);

    //@Query("SELECT c.foto.name FROM Carta c where c.id=:id")
    //List<Foto> findPhotosByCard(@Param("id")int id);
    
}
