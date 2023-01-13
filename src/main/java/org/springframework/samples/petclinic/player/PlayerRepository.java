package org.springframework.samples.petclinic.player;

import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.samples.petclinic.user.User;

@Repository
public interface PlayerRepository extends CrudRepository<Player, Integer> {

	@Query("SELECT DISTINCT player FROM Player player WHERE player.lastName LIKE :lastName%")
	public Page<Player> findByLastName(@Param("lastName") String lastName, Pageable pageable);

	@Query("SELECT player FROM Player player WHERE player.user =:user")
	public Player findByUsername(@Param("user") User username);

	@Query("SELECT p FROM Player p WHERE p.user.username = :username")
  	public Player findByUsernameGood(@Param("username") String username);


	@Query("SELECT player FROM Player player WHERE player.id =:id")
	public Player findById(@Param("id") int id);

	Collection<Player> findAll();
}
 