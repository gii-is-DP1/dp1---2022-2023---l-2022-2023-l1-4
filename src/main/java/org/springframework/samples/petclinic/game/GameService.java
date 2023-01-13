package org.springframework.samples.petclinic.game;

import java.util.Collection;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.minijuego.Minijuego;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameService {

    private static final Logger log = LoggerFactory.getLogger(GameService.class);
    PlayerService playerService;
    UserService userService;

    private GameRepository gameRepository;

    @Autowired
    public GameService(GameRepository gameRepository, PlayerService playerService, UserService userService) {
        this.gameRepository = gameRepository;
        this.playerService = playerService;
        this.userService = userService;
    }

    @Transactional
    public List<Game> getAllGames() {
        log.info("Buscando todas las partidas");
        return gameRepository.findAll();
    }

    @Transactional
    public List<Minijuego> findMinijuegos(Integer gameId){
        return gameRepository.findMinijuegos(gameId);
    }

    @Transactional
    public Game save(Game g) {
        log.info("Guardando la partida");
        return gameRepository.save(g);
    }

    @Transactional(readOnly = true)
    public Game findGameById(int id) throws DataAccessException {
        log.info("Encontrando partida por id");
        return gameRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public Collection<Game> findGameByName(String name) throws DataAccessException {
        log.info("Encontrando partida por nombre");
        return gameRepository.findByName(name);
    }

    @Transactional(readOnly = true)
    public Collection<Player> findPlayersGame(int gameId) throws DataAccessException {
        log.info("Encontrando jugadores por id de la partida");
        return gameRepository.findPlayersGame(gameId);
    }

    @Transactional
    public Player playerSesion() throws DataAccessException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Player player = this.playerService.findPlayerByUsername(this.userService.findUser(username).orElse(null));
        log.info("Encontrando jugador actual de la partida");
        return player;
    }

}
