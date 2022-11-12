
package org.springframework.samples.petclinic.player;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.samples.petclinic.user.User;

@Service
public class PlayerService {

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
		return playerRepository.findById(id);
	}

	@Transactional(readOnly = true)
	public Collection<Player> findPlayerByLastName(String lastName) throws DataAccessException {
		return playerRepository.findByLastName(lastName);
	}

	@Transactional(readOnly = true)
	public Player findPlayerByUsername(User user) throws DataAccessException {
		return playerRepository.findByUsername(user);
	}

	@Transactional
	public void savePlayer(Player player) throws DataAccessException {
		//crear
		playerRepository.save(player);		
		//creating user
		userService.saveUser(player.getUser());
		//creating authorities
		authoritiesService.saveAuthorities(player.getUser().getUsername(), "player");
	}		

}
