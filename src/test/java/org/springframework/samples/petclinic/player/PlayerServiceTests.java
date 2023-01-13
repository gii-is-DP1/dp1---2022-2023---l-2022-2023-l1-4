package org.springframework.samples.petclinic.player;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.samples.petclinic.user.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
class PlayerServiceTests {
	@Autowired
	protected PlayerService playerService;

	@Test
	void shouldFindPlayersByLastName() {
		Page<Player> playersPage = this.playerService.findPlayerByLastName("Davideouhfs", PageRequest.of(0, 10));
		assertThat(playersPage.getContent().size()).isEqualTo(0);

		playersPage = this.playerService.findPlayerByLastName("Davisdwdasfwadds", PageRequest.of(0, 10));
		assertThat(playersPage.getContent().isEmpty()).isTrue();
	}

	@Test
	@Transactional
	public void shouldInsertPlayer() {
		Page<Player> playersPage = this.playerService.findPlayerByLastName("Schultz", PageRequest.of(0, 10));
		int found = playersPage.getContent().size();
		Player player = new Player();
		player.setFirstName("Sam");
		player.setLastName("Schultz");
		player.setEmail("sam@gmail.com");
		player.setTelephone("4444444444");
		User user = new User();
		user.setUsername("Sam");
		user.setPassword("supersecretpassword");
		user.setEnabled(true);
		player.setUser(user);

		this.playerService.savePlayer(player);
		assertThat(player.getId().longValue()).isNotEqualTo(0);

		playersPage = this.playerService.findPlayerByLastName("Schultz", PageRequest.of(0, 10));
		assertThat(playersPage.getContent().size()).isEqualTo(found + 1);
	}

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