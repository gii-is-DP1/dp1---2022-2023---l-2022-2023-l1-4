package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.stereotype.Repository;

@Repository
public interface MinijuegoRepository extends CrudRepository<Minijuego,Integer> {
    
    Collection<Minijuego> findAll();

    @Query("SELECT mg FROM Minijuego mg where mg.id=:id")
    public Minijuego findById(@Param("id") int id);

    @Query("SELECT mg FROM Minijuego mg WHERE mg.name=:name")
    public Minijuego findMinijuegoByName(@Param("name") String name);

    @Query("SELECT g.playersList FROM Game g WHERE g.id = :game_id")
	public List<Player> findPlayersByGameId(@Param("game_id") int id);

	@Query("SELECT mg FROM Minijuego mg where mg.id = :id")
	public Collection<Minijuego> findMinijuegosPartida(@Param("id") int id);
    
} 
