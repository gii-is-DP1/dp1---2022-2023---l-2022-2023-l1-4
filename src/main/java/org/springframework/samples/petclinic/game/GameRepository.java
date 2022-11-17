package org.springframework.samples.petclinic.game;


import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

@Repository
public interface GameRepository extends CrudRepository<Game,Integer>{

    List<Game> findAll();

    @Query("SELECT game FROM Game game WHERE game.id =:id")
	public Game findById(@Param("id") int id);

    @Query("SELECT DISTINCT game FROM Game game WHERE game.name LIKE :name%")
	public Collection<Game> findByName(@Param("name") String name);

    //@Query("SELECT DISTINCT game.player_id FROM Game game WHERE game.id=:game_id")
    //public Set<Integer> findPlayersInGame(@Param("game_id") int game_id);
   
}
