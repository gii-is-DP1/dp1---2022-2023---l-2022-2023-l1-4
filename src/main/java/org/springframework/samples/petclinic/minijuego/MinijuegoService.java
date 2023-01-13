package org.springframework.samples.petclinic.minijuego;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.FotoService;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.samples.petclinic.mazo.MazoService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.samples.petclinic.util.AuthenticationService;
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
	AuthenticationService authenticationService;
	List<Integer> listaGanadores;

	@Autowired
	public MinijuegoService(MinijuegoRepository minijuegoRepository, CartaService cartaService,
			PlayerService playerService, UserService userService, FotoService fotoService, MazoService mazoservice,
			AuthenticationService authenticationService, List<Integer> listaGanadores) {
		this.minijuegoRepository = minijuegoRepository;
		this.cartaService = cartaService;
		this.playerService = playerService;
		this.userService = userService;
		this.fotoService = fotoService;
		this.mazoService = mazoservice;
		this.authenticationService = authenticationService;
		this.listaGanadores = listaGanadores;
	}

	@Transactional(readOnly = true)
	public Collection<Minijuego> getAllMinijuegos() {
		return minijuegoRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Minijuego getMinijuegoByName(String name) {
		return minijuegoRepository.findMinijuegoByName(name);
	}

	@Transactional(readOnly = true)
	public Minijuego findById(int id) {
		return minijuegoRepository.findById(id);
	}

	public Collection<Minijuego> getMinijuegosPartida(int id) {
		return minijuegoRepository.findMinijuegosPartida(id);
	}

	public List<Player> getPlayersByGameId(int game_id) {
		return minijuegoRepository.findPlayersByGameId(game_id);
	}

	@Transactional
	public Minijuego save(Minijuego minijuego) {
		return minijuegoRepository.save(minijuego);
	}

	@Transactional
	public void actualizarGanadores(Minijuego minijuego, Player ganador, Player perdedor) {
		minijuego.setGanador(ganador);
		minijuego.setPerdedor(perdedor);

		save(minijuego);
	}

	@Transactional
	public Player playerSesion() throws DataAccessException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Player player = this.playerService.findPlayerByUsername(this.userService.findUser(username).orElse(null));
		return player;
	}

	public static Carta getRandomCard(List<Carta> gameCards) {
		int rnd = new Random().nextInt(gameCards.size());
		return gameCards.get(rnd);
	}

	// Repartimos las cartas: Creamos una lista con todas las cartas y seleccionamos
	// una por jugador
	// y la eliminamos de la lista inicial, que luego será la lista de cartas
	// centrales.
	public Map<Integer, List<Integer>> reparteCartas(Minijuego minijuego) {
		Collection<Carta> gameCards = cartaService.getAll();
		List<Carta> cardsList = new ArrayList<>();
		gameCards.forEach(x -> cardsList.add(x));
		Collections.shuffle(cardsList);
		List<Player> players = new ArrayList<>();
		minijuego.getGame().getPlayersList().forEach(x -> players.add(x));
		Map<Integer, List<Integer>> playerCard = new HashMap<>();
		Integer numPlayers = players.size();
		if (minijuego.getName().equals(TipoMinijuego.TORRE_INFERNAL.toString())) {
			players.forEach(x -> {
				List<Integer> card = new ArrayList<>();
				if (!playerCard.containsKey(x.getId())) {
					Carta randomCard = getRandomCard(cardsList);
					card.add(randomCard.getId());
					playerCard.put(x.getId(), card);
					cardsList.remove(randomCard);
				}
			});
			List<Integer> card = new ArrayList<>();
			cardsList.forEach(x -> card.add(x.getId()));
			playerCard.put(0, card);
			return playerCard;
		}
		if (minijuego.getName().equals(TipoMinijuego.EL_FOSO.toString())) {
			List<Integer> cartaCentro = new ArrayList<>();
			cartaCentro.add(getRandomCard(cardsList).getId());
			playerCard.put(0, cartaCentro);
			cardsList.remove(cartaService.getCardById(cartaCentro.get(0)));

			Integer cartasARepartir = Math.round(cardsList.size() / numPlayers);

			for (int i = 0; i < numPlayers; i++) {
				List<Integer> listaCartas = new ArrayList<>();
				if (!playerCard.containsKey(players.get(i).getId())) {
					playerCard.put(players.get(i).getId(), new ArrayList<Integer>());
				}
				for (int j = 0; j < cartasARepartir; j++) {
					Carta cartaRandom = getRandomCard(cardsList);
					listaCartas.add(cartaRandom.getId());
					cardsList.remove(cartaRandom);
					playerCard.put(players.get(i).getId(), listaCartas);
					System.out.println(playerCard);
				}
			}
			return playerCard;
		}
		if (minijuego.getName().equals(TipoMinijuego.LA_PATATA_CALIENTE.toString())) {
			players.forEach(x -> {
				List<Integer> card = new ArrayList<>();
				if (!playerCard.containsKey(x.getId())) {
					Carta randomCard = getRandomCard(cardsList);
					card.add(randomCard.getId());
					playerCard.put(x.getId(), card);
					cardsList.remove(randomCard);
				}
			});
			List<Integer> listaCartas = new ArrayList<>();
			cardsList.forEach(x -> listaCartas.add(x.getId()));
			playerCard.put(0, listaCartas);
			return playerCard;
		}
		return playerCard;
	}

	public Map<String, Integer> sumarPunto(String respuesta, List<String> fotosCentro,
			Map<String, Integer> puntuacion, List<Player> listJugadores) {
		 Player jugadorActual = playerSesion();
		if (respuesta.equals("") && fotosCentro.isEmpty()) {
			listJugadores.forEach((x) -> {
				puntuacion.put(x.getFirstName() + " " + x.getLastName(), 0);
			});
			return puntuacion;
		}
		if (!puntuacion.containsKey(jugadorActual.getFirstName() + " " + jugadorActual.getLastName()))
			puntuacion.put(jugadorActual.getFirstName() + " " + jugadorActual.getLastName(), 0);
		Integer puntoJugador = puntuacion.get(jugadorActual.getFirstName() + " " + jugadorActual.getLastName());
		if (fotosCentro.contains(respuesta)) {
			puntoJugador++;
			puntuacion.put(jugadorActual.getFirstName() + " " + jugadorActual.getLastName(), puntoJugador);
			return puntuacion;
		}
		return puntuacion;
	}

	public Map<Integer, List<Integer>> compruebaAcierto(String respuesta, List<String> fotosCentro,
			Map<Integer, List<Integer>> playerCard, String nombreMinijuego, Map<Integer,Integer> carta) {
		Player jugadorActual = playerSesion();
		if (fotosCentro.contains(respuesta))
			return actualizaCartas(playerCard, jugadorActual, nombreMinijuego, carta);
		else
			return playerCard;
	}

	public Map<Integer, List<Integer>> actualizaCartas(Map<Integer, List<Integer>> playerCard, Player jugadorActual,
			String nombreMinijuego, Map<Integer,Integer> idCarta) {

		if (nombreMinijuego.equals("TORRE_INFERNAL")) {
			Integer idCartaMedio = playerCard.get(0).get(playerCard.get(0).size() - 1);
			List<Integer> lista = playerCard.get(jugadorActual.getId());
			lista.add(idCartaMedio);
			playerCard.put(jugadorActual.getId(), lista);
			List<Integer> listaCartas = playerCard.get(0);
			listaCartas.remove(idCartaMedio);
			playerCard.put(0, listaCartas);
		}

		if (nombreMinijuego.equals("EL_FOSO")) {
			Integer idCartaJugador = playerCard.get(jugadorActual.getId())
					.get(playerCard.get(jugadorActual.getId()).size() - 1);
			List<Integer> lista = playerCard.get(0);
			lista.add(idCartaJugador);
			playerCard.put(0, lista);
			List<Integer> listaCartas = playerCard.get(jugadorActual.getId());
			listaCartas.remove(idCartaJugador);
			playerCard.put(jugadorActual.getId(), listaCartas);
		}

		if (nombreMinijuego.equals("LA_PATATA_CALIENTE")) {
			Integer idCartaJugador = playerCard.get(jugadorActual.getId())
					.get(0);
			List<Integer> jugadorRecibeCarta = new ArrayList<Integer>();
			List<Integer> cartasJugadorQueRecibe = new ArrayList<Integer>();
			playerCard.forEach((x, y) -> {
				if (y.contains(idCarta.get(jugadorActual.getId())))
					jugadorRecibeCarta.add(x);
			});
			cartasJugadorQueRecibe.add(0, idCarta.get(jugadorActual.getId()));
			cartasJugadorQueRecibe.add(1, idCartaJugador);
			playerCard.put(jugadorActual.getId(), new ArrayList<Integer>());
			playerCard.put(jugadorRecibeCarta.get(0), cartasJugadorQueRecibe);

		}

		return playerCard;
	}

	public List<Integer> finalizarPartida(String nombreMinijuego, Map<Integer, List<Integer>> playerCards) {
		List<Integer> res = new ArrayList<>();
		if (nombreMinijuego.equals("TORRE_INFERNAL")) {
			if ((playerCards.get(0).size() == 0)) {
				List<Integer> puntos = new ArrayList<>();
				List<Integer> jug = new ArrayList<>();
				playerCards.forEach((x, y) -> {
					if (x != 0) {
						puntos.add(y.size());
						jug.add(x);
					}
				});
				Integer maximo = 0;
				Integer posMax = 0;
				Integer minimo = 60;
				Integer posMin = 0;
				for (int i = 0; i < puntos.size(); i++) {
					if (puntos.get(i) > maximo) {
						maximo = puntos.get(i);
						posMax = i;
					}
					if (puntos.get(i) < minimo) {
						minimo = puntos.get(i);
						posMin = i;
					}
				}
				res.add(0, jug.get(posMax));
				res.add(1, jug.get(posMin));
			}
		}
		if (nombreMinijuego.equals("EL_FOSO")) {
			playerCards.forEach((x, y) -> {
				if (!(listaGanadores.size() == playerCards.size() - 1)) {
					if (x != 0 && y.size() == 0) {
						if (!listaGanadores.contains(x))
							listaGanadores.add(x);
					}
				}
			});

			if (listaGanadores.size() == playerCards.size() - 1) {
				res.add(0, listaGanadores.get(0));
				res.add(1, listaGanadores.get(listaGanadores.size() - 1));
			}
		}
		if (nombreMinijuego.equals("LA_PATATA_CALIENTE")) {
			List<Integer> listKey = new ArrayList<>();
			// playerCards.remove(0);
			if (!(listKey.size() == 2)) {
				playerCards.forEach((x, y) -> {
					listKey.add(x);
					if (y.size() == 0 && x != 0) {
						listaGanadores.add(x);
						listKey.remove(x);
					}
				});
			}
			if (listKey.size() == 2) {
				res.add(0, listaGanadores.get(0));
				res.add(1, listKey.get(1));

			}
		}
		if(!(res.size() == 0))
			this.listaGanadores = new ArrayList<>();
		return res;
	}

	public Map<Integer, List<Integer>> reparteCartaRondaPatataCaliente(Map<Integer, List<Integer>> playerCard) {
		List<Integer> mazo = playerCard.get(0);
		Collections.shuffle(mazo);
		List<Carta> listCard = new ArrayList<>();
		mazo.forEach(x -> listCard.add(cartaService.getCardById(x)));

		playerCard.forEach((x, y) -> {
			if (x != 0) {
				Carta randomCard = getRandomCard(listCard);
				List<Integer> listaProv = new ArrayList<>();
				listaProv.add(randomCard.getId());
				listCard.remove(randomCard);
				playerCard.put(x, listaProv);
			}
		});

		List<Integer> listaMazo = new ArrayList<>();
		listCard.forEach(x -> listaMazo.add(x.getId()));
		playerCard.put(0, listaMazo);

		return playerCard;
	}

}