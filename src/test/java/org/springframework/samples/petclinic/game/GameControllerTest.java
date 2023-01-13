package org.springframework.samples.petclinic.game;
import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.is;
import static org.mockito.BDDMockito.given;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.assertj.core.util.Lists;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.samples.petclinic.configuration.SecurityConfiguration;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

/**
 * Test class for {@link GameController}
 *
 * @author Colin But
 */

@WebMvcTest(controllers = GameController.class, excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSecurityConfigurer.class), excludeAutoConfiguration = SecurityConfiguration.class)
class GameControllerTests {

	private static final int TEST_GAME_ID = 1
	;

	@Autowired
	private GameController gameController;

	@MockBean
	private GameService gameService;

	@Autowired
	private MockMvc mockMvc;

	private Game game;

	/*@BeforeEach
	void setUp(){
		game = new Game();
		game.setId(TEST_GAME_ID);
		game.setName("Prueba");
		game.setNumPlayers(2);

	}*/
/* 
	@BeforeEach
	void setup() {

		
		User user1 = new User();
        user1.setUsername("user1");
        Player player1 = new Player();
        player1.setId(20);
        player1.setFirstName("George");
        player1.setLastName("Franklin");
        player1.setTelephone("6085551023");
        player1.setUser(user1);

        User user2 = new User();
        user2.setUsername("user2");
        Player player2 = new Player();
        player2.setId(30);
        player2.setFirstName("Abraham");
        player2.setLastName("Lincon");
        player2.setTelephone("123456789");
        player2.setUser(user2);

        List<Player> players = new ArrayList<>();
        players.add(player1);
        players.add(player2);
        

        Minijuego minijuego1 = new Minijuego();
        Minijuego minijuego2 = new Minijuego();
        minijuego1.setId(5);
        minijuego1.setName("Torre Infernal");
        minijuego2.setId(6);
        minijuego2.setName("El Foso");

		game = new Game();
		game.setId(TEST_GAME_ID);
		game.setName("Prueba");
		game.setNumPlayers(3);
		gameService.save(game);

	}
	*/
	@WithMockUser(value = "spring")
	@Test
	void testInitCreationForm() throws Exception {
		mockMvc.perform(get("/games/new"))
            .andExpect(status().isOk()).andExpect(model().attributeExists("game"))
            .andExpect(view().name("games/createOrUpdateGameForm"));
		}
	/*
	@WithMockUser(value = "spring")
	@Test
	void testProcessCreationFormSuccess() throws Exception {
		mockMvc.perform(post("/games/new").param("name", "Prueba").param("numPlayers", "2"))
		.andExpect(view().name("redirect:/games/rondas/new"));
	}
*/



	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessCreationFormSuccess() throws Exception {
	// 	mockMvc.perform(post("/games/new").param("name", "partidaPrueba").param("lastName", "Bloggs").with(csrf())
	// 			.param("email", "joe@gmail.com").param("telephone", "666681623"))
	// 			.andExpect(status().is3xxRedirection());
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessCreationFormHasErrors() throws Exception {
	// 	mockMvc.perform(post("/games/new").with(csrf()).param("firstName", "Joe").param("lastName", "Bloggs")
	// 			.param("email", "emailincorrecto")).andExpect(status().isOk()).andExpect(model().attributeHasErrors("game"))
	// 			.andExpect(model().attributeHasFieldErrors("game", "telephone"))
	// 			.andExpect(view().name("games/createOrUpdateGameForm"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testInitFindForm() throws Exception {
	// 	mockMvc.perform(get("/games/find")).andExpect(status().isOk()).andExpect(model().attributeExists("game"))
	// 			.andExpect(view().name("games/findGames"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessFindFormSuccess() throws Exception {
	// 	given(this.gameService.findGameByLastName("")).willReturn(Lists.newArrayList(carlos, new Game()));

	// 	mockMvc.perform(get("/games")).andExpect(status().isOk()).andExpect(view().name("games/gamesList"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessFindFormByLastName() throws Exception {
	// 	given(this.gameService.findGameByLastName(partidaPrueba.getLastName())).willReturn(Lists.newArrayList(partidaPrueba));

	// 	mockMvc.perform(get("/games").param("lastName", "Nuchera")).andExpect(status().is3xxRedirection())
	// 			.andExpect(view().name("redirect:/games/" + TEST_GAME_ID));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessFindFormNoGamesFound() throws Exception {
	// 	mockMvc.perform(get("/games").param("lastName", "Unknown Surname")).andExpect(status().isOk())
	// 			.andExpect(model().attributeHasFieldErrors("game", "lastName"))
	// 			.andExpect(model().attributeHasFieldErrorCode("game", "lastName", "notFound"))
	// 			.andExpect(view().name("games/findGames"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testInitUpdateGameForm() throws Exception {
	// 	mockMvc.perform(get("/games/{gameId}/edit", TEST_GAME_ID)).andExpect(status().isOk())
	// 			.andExpect(model().attributeExists("game"))
	// 			.andExpect(model().attribute("game", hasProperty("lastName", is("Nuchera"))))
	// 			.andExpect(model().attribute("game", hasProperty("firstName", is("Carlos"))))
	// 			.andExpect(model().attribute("game", hasProperty("email", is("carlosnuchera98@gmail.com"))))
	// 			.andExpect(model().attribute("game", hasProperty("telephone", is("669081623"))))
	// 			.andExpect(view().name("games/createOrUpdateGameForm"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessUpdateGameFormSuccess() throws Exception {
	// 	mockMvc.perform(post("/games/{gameId}/edit", TEST_GAME_ID).with(csrf()).param("firstName", "Joe")
	// 			.param("lastName", "Bloggs").param("address", "123 Caramel Street").param("city", "London")
	// 			.param("telephone", "01616291589")).andExpect(status().is3xxRedirection())
	// 			.andExpect(view().name("redirect:/games/{gameId}"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testProcessUpdateGameFormHasErrors() throws Exception {
	// 	mockMvc.perform(post("/games/{gameId}/edit", TEST_GAME_ID).with(csrf()).param("firstName", "Joe")
	// 			.param("lastName", "Bloggs").param("email", "joe@gmail.com")).andExpect(status().isOk())
	// 			.andExpect(model().attributeHasErrors("game"))
	// 			.andExpect(model().attributeHasFieldErrors("game", "telephone"))
	// 			.andExpect(view().name("games/createOrUpdateGameForm"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testShowPlayer() throws Exception {
	// 	mockMvc.perform(get("/players/{playerId}", TEST_GAME_ID)).andExpect(status().isOk())
	// 			.andExpect(model().attribute("player", hasProperty("lastName", is("Nuchera"))))
	// 			.andExpect(model().attribute("player", hasProperty("firstName", is("Carlos"))))
	// 			.andExpect(model().attribute("player", hasProperty("email", is("carlosnuchera98@gmail.com"))))
	// 			.andExpect(model().attribute("player", hasProperty("telephone", is("669081623"))))
	// 			.andExpect(view().name("players/playerDetails"));
	// }

	// @WithMockUser(value = "spring")
	// @Test
	// void testDeletePlayerById() throws Exception {
	// 	mockMvc.perform(get("/players/delete/{playerId}", TEST_PLAYER_ID)).andExpect(status().isOk())
	// 			.andExpect(model().attribute("player", hasProperty("lastName", is("Nuchera"))))
	// 			.andExpect(model().attribute("player", hasProperty("firstName", is("Carlos"))))
	// 			.andExpect(model().attribute("player", hasProperty("email", is("carlosnuchera98@gmail.com"))))
	// 			.andExpect(model().attribute("player", hasProperty("telephone", is("669081623"))))
	// 			.andExpect(view().name("players"));
	// }

}