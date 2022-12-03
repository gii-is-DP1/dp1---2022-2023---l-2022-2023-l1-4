package org.springframework.samples.petclinic.game;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.util.AuthenticationService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {

	private static final String VIEWS_GAME_CREATE_OR_UPDATE_FORM = "games/createOrUpdateGameForm";

	private GameService gameService;
	private AuthenticationService authenticationService;

	@Autowired
	public GameController(GameService gameService, AuthenticationService authtAuthenticationService) {
		this.gameService = gameService;
		this.authenticationService = authtAuthenticationService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping(value = "/games/new")
	public String initCreationForm(Map<String, Object> model) {
		Game game = new Game();
		model.put("game", game);
		return VIEWS_GAME_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping(value = "/games/new")
	public String processCreationForm(@Valid Game game, BindingResult result) {

		if (result.hasErrors()) {
			return VIEWS_GAME_CREATE_OR_UPDATE_FORM;

		} else {
			Player player = authenticationService.getPlayer();


			List<Player> listPlayers = new ArrayList<Player>();
			listPlayers.add(player);
			game.setPlayersList(listPlayers);
			game.setStartGame(true);
			this.gameService.save(game);
			return "redirect:/games/" + game.getId() + "/waiting";
		}
	}

	@GetMapping(value = "/games/join/{gameId}")
	public String joinGame(@PathVariable("gameId") int gameId) {
		System.out.println(gameId);
		List<Player> listaProv = new ArrayList<Player>();
		gameService.findPlayersGame(gameId).forEach(x -> listaProv.add(x));
		Player player = authenticationService.getPlayer();
		listaProv.add(player);
		Game game = gameService.findGameById(gameId);
		game.setPlayersList(listaProv);
		gameService.save(game);
		return "redirect:/games/" + gameId + "/waiting";
	}

	@GetMapping(value = "/games/find")
	public String initFindForm(Map<String, Object> model) {
		model.put("game", new Game());
		return "games/findGames";
	}

	@GetMapping(value = "/games")
	public String processFindForm(Game game, BindingResult result, Map<String, Object> model) {
		if (game.getName() == null) {
			game.setName(""); // empty string signifies broadest possible search
		}

		Collection<Game> gamesPorNombre = this.gameService.findGameByName(game.getName());
		if (gamesPorNombre.isEmpty()) {
			// no games found
			result.rejectValue("name", "notFound", "not found");
			return "games/findGames";
		} else if (gamesPorNombre.size() == 1) {
			// 1 game found
			game = gamesPorNombre.iterator().next();
			return "redirect:/games/" + game.getId();
		} else {
			// multiple games found
			model.put("selections", gamesPorNombre);
			return "games/gamesList";
		}
	}

	@GetMapping("/games/{gameId}")
	public ModelAndView mostrarGame(@PathVariable("gameId") int gameId) {
		ModelAndView mav = new ModelAndView("games/gameDetails");
		mav.addObject(this.gameService.findGameById(gameId));
		return mav;
	}

	@GetMapping("/games/{gameId}/waiting")
	public String refreshPage(@PathVariable("gameId") int gameId, Map<String, Object> model,
			HttpServletResponse response) {

		response.addHeader("Refresh", "1");
		Game game = this.gameService.findGameById(gameId);



        while((game.getPlayersList().size()) <= (game.getNumPlayers()) || (game.getStartGame()==false))  {
            model.put("now", game.getPlayersList().size() + "/" + game.getNumPlayers());
            return "games/waitingPage";
        }
        response.reset();

       // List<Round> rondasPartida = this.roundService.rondasPartida(game.getId());
       //Round round = rondasPartida.get(0);


		// List<Round> rondasPartida = this.roundService.rondasPartida(game.getId());
		// Round round = rondasPartida.get(0);

		return "redirect:/waitingPage";

	}

}