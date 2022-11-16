package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.FotoService;
import org.springframework.samples.petclinic.mazo.MazoService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MinijuegoService {
	MinijuegoRepository minijuegoRepository;
	CartaService cartaService;
	PlayerService playerService;
	UserService userService;
	FotoService fotoService;
	MazoService mazoService;

	@Autowired
	public MinijuegoService(MinijuegoRepository minijuegoRepository, CartaService cartaService,
			PlayerService playerService, UserService userService, FotoService fotoService, MazoService mazoservice) {
		this.minijuegoRepository = minijuegoRepository;
		this.cartaService = cartaService;
		this.playerService = playerService;
		this.userService = userService;
		this.fotoService = fotoService;
		this.mazoService = mazoservice;
	}

	@Transactional(readOnly = true)
	public Collection<Minijuego> getAllMinijuegos() {
		return minijuegoRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Minijuego getMinijuegoByName(String name) {
		return minijuegoRepository.findMinijuegoByName(name);
	}

	public Collection<Minijuego> getMinijuegosPartida(int id) {
		return minijuegoRepository.findMinijuegosPartida(id);
	}

	public Set<Player> getPlayersByGameId(int game_id) {
		return minijuegoRepository.findPlayersByGameId(game_id);
	}

	@Transactional
	public void saveMinijuego(Minijuego minijuego) throws DataAccessException {
		minijuegoRepository.save(minijuego);
	}

	@Transactional
	public Player playerSesion() throws DataAccessException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Player player = this.playerService.findPlayerByUsername(this.userService.findUser(username).orElse(null));
		return player;
	}

	

}
