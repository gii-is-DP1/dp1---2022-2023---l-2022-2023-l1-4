
package org.springframework.samples.petclinic.player;

import java.util.Collection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.samples.petclinic.user.User;

@Service
public class PlayerService {

	private static final Logger log = LoggerFactory.getLogger(PlayerService.class);

	private PlayerRepository playerRepository;	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthoritiesService authoritiesService;

	@Autowired
	public PlayerService(PlayerRepository playerRepository) {
		this.playerRepository = playerRepository;
	}
	
	@Transactional(readOnly = true)
	public Player findPlayerById(int id) throws DataAccessException {
		log.info("Buscando jugador por id");
		return playerRepository.findById(id);
	}

	@Transactional(readOnly = true)
	public Page<Player> findPlayerByLastName(String lastName, Pageable pageable) throws DataAccessException {
		log.info("Buscando jugador por apellido");
		return playerRepository.findByLastName(lastName, pageable);
	}

	@Transactional(readOnly = true)
	public Player findPlayerByUsername(User user) throws DataAccessException {
		log.info("Buscando jugador por usuario");
		return playerRepository.findByUsername(user);
	}

	@Transactional(readOnly = true)
	public Player getPlayerByUsernameGood(String username) throws DataAccessException {
		log.info("Buscando jugador por usuario");
		return playerRepository.findByUsernameGood(username);
	}
	

	@Transactional(readOnly = true)
	public Collection<Player> findPlayer() throws DataAccessException {
		log.info("Buscando jugador");
		return playerRepository.findAll();
	}

	@Transactional()
	public void deletePlayer(Integer id) throws DataAccessException {
		log.info("Borrando jugador por id");
		this.playerRepository.deleteById(id);
	}

	@Transactional
	public void savePlayer(Player player) throws DataAccessException {
		log.info("Guardando jugador");
		//crear
		playerRepository.save(player);		
		//creating user
		userService.saveUser(player.getUser());
		//creating authorities
		authoritiesService.saveAuthorities(player.getUser().getUsername(), "player");
	}		

}
