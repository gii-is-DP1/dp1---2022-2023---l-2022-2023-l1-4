package org.springframework.samples.petclinic.game;

import java.util.Collection;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameService {
    
    private GameRepository gameRepository;

    @Autowired
    public GameService(GameRepository gameRepository){
        this.gameRepository= gameRepository;
    }

    @Transactional
    public List<Game> getAllGames(){
        return gameRepository.findAll();
    }
    @Transactional
    public Game save(Game g){
        return gameRepository.save(g);
    }

    @Transactional(readOnly = true)
	public Game findGameById(int id) throws DataAccessException {
		return gameRepository.findById(id);
	}

    @Transactional(readOnly = true)
	public Collection<Game> findGameByName(String name) throws DataAccessException {
		return gameRepository.findByName(name);
	}
  
    @Transactional(readOnly = true)
	public Collection<Player> findPlayersGame(int gameId) throws DataAccessException {
		return gameRepository.findPlayersGame(gameId);
	}
 
}
