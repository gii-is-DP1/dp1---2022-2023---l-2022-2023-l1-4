package org.springframework.samples.petclinic.player;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Collection;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.user.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
class PlayerServiceTests {                
        @Autowired
	protected PlayerService playerService;

	// @Test
	// void shouldFindPlayersByLastName() {
	// 	Collection<Player> players = this.playerService.findPlayerByLastName("Davis");
	// 	assertThat(players.size()).isEqualTo(0);

	// 	players = this.playerService.findPlayerByLastName("Daviss");
	// 	assertThat(players.isEmpty()).isTrue();
	// }

	

	// @Test
	// @Transactional
	// public void shouldInsertPlayer() {
	// 	Collection<Player> players = this.playerService.findPlayerByLastName("Schultz");
	// 	int found = players.size();

	// 	Player player = new Player();
	// 	player.setFirstName("Sam");
	// 	player.setLastName("Schultz");
	// 	player.setEmail("sam@gmail.com");
	// 	player.setTelephone("4444444444");
    //             User user=new User();
    //             user.setUsername("Sam");
    //             user.setPassword("supersecretpassword");
    //             user.setEnabled(true);
    //             player.setUser(user);                
                
	// 	this.playerService.savePlayer(player);
	// 	assertThat(player.getId().longValue()).isNotEqualTo(0);

	// 	players = this.playerService.findPlayerByLastName("Schultz");
	// 	assertThat(players.size()).isEqualTo(found + 1);
	// }

	@Test
	@Transactional
	void shouldUpdatePlayer() {
		Player player = this.playerService.findPlayerById(1);
		String oldLastName = player.getLastName();
		String newLastName = oldLastName + "X";

		player.setLastName(newLastName);
		this.playerService.savePlayer(player);

		// retrieving new name from database
		player = this.playerService.findPlayerById(1);
		assertThat(player.getLastName()).isEqualTo(newLastName);
	}


}
