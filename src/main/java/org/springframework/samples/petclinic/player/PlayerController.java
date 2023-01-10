package org.springframework.samples.petclinic.player;

import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlayerController {

	private static final Logger log = LoggerFactory.getLogger(PlayerController.class);

	private static final String VIEWS_PLAYER_CREATE_OR_UPDATE_FORM = "players/createOrUpdatePlayerForm";

	private final PlayerService playerService;

	private final UserService userService;

	@Autowired
	public PlayerController(PlayerService playerService, UserService userService,
			AuthoritiesService authoritiesService) {
		this.playerService = playerService;
		this.userService = userService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping(value = "/players/new")
	public String initCreationForm(Map<String, Object> model) {
		log.info("Inicializando formulario de creación del jugador");
		Player player = new Player();
		model.put("player", player);
		return VIEWS_PLAYER_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping(value = "/players/new")
	public String processCreationForm(@Valid Player player, BindingResult result) {
		if (result.hasErrors()) {
			log.info("Error en el formulario");
			return VIEWS_PLAYER_CREATE_OR_UPDATE_FORM;
		} else {
			// crear player, usuario y autorizacion
			log.info("Jugador creado correctamente");
			this.playerService.savePlayer(player);

			return "redirect:/";
		}
	}

	@GetMapping(value = "/players/find")
	public String initFindForm(Map<String, Object> model) {
		log.info("Inicializando formulario de busqueda de usuarios");
		model.put("player", new Player());
		return "players/findPlayers";
	}

	@GetMapping(value = "/players")
	public String processFindForm(Player player, @PageableDefault(page = 0, size = 2) Pageable pageable,
			BindingResult result, Map<String, Object> model) {
		if (player.getLastName() == null) {
			player.setLastName("");
		}

		Page<Player> playersPage = this.playerService.findPlayerByLastName(player.getLastName(), pageable);
		if (playersPage.isEmpty()) {
			// no players found
			result.rejectValue("lastName", "notFound", "not found");
			return "players/findPlayers";
		} else if (playersPage.getTotalElements() == 1) {
			// 1 player found
			player = playersPage.iterator().next();
			return "redirect:/players/" + player.getId();

		}

		else {
			model.put("selections", playersPage);
			player = playersPage.iterator().next();
			return "players/playersList";
		}
	}

	@GetMapping(value = "/players/{playerId}/edit")
	public String initUpdatePlayerForm(@PathVariable("playerId") int playerId, Model model) {
		log.info("Inicializando formulario de actualización de usuarios");
		Player player = this.playerService.findPlayerById(playerId);
		model.addAttribute(player);
		return VIEWS_PLAYER_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping(value = "/players/{playerId}/edit")
	public String processUpdateOwnerForm(@Valid Player player, BindingResult result,
			@PathVariable("playerId") int playerId) {
		if (result.hasErrors()) {
			log.info("Error en la actualización de usuario");
			return VIEWS_PLAYER_CREATE_OR_UPDATE_FORM;
		} else {
			log.info("Usuario actualizado correctamente");
			player.setId(playerId);
			this.playerService.savePlayer(player);
			return "redirect:/players/{playerId}";
		}
	}

	@GetMapping("/players/{playerId}")
	public ModelAndView showPlayer(@PathVariable("playerId") int playerId) {
		log.info("Mostrando jugador");
		ModelAndView mav = new ModelAndView("players/playerDetails");
		mav.addObject(this.playerService.findPlayerById(playerId));
		return mav;
	}

	@GetMapping("/myProfile")
	public String showIdPlayer(Player player, BindingResult result, Map<String, Object> model) {
		log.info("Mostrando perfil del jugador");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Player jugador = this.playerService.findPlayerByUsername(this.userService.findUser(username).orElse(null));
		return "redirect:/players/" + jugador.getId();

	}

	@GetMapping("/players/delete/{playerId}")
	public String deletePartida(@PathVariable("playerId") int playerId) {
		log.info("Eliminando jugador");
		playerService.deletePlayer(playerId);
		return "redirect:/players";
	}

}
