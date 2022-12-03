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

	private static final int TEST_GAME_ID = 1;

    private static final Boolean TRUE = null;

	@Autowired
	private GameController gameController;

	@MockBean
	private GameService gameService;

	@MockBean
	private UserService userService;

	@MockBean
	private AuthoritiesService authoritiesService;

	@Autowired
	private MockMvc mockMvc;

	private Game partidaPrueba;

	@BeforeEach
	void setup() {

		partidaPrueba = new Game();
		partidaPrueba.setId(TEST_GAME_ID);
		partidaPrueba.setName("partidaPrueba");
		partidaPrueba.setNumPlayers(2);
		partidaPrueba.setStartGame(TRUE);
		given(this.gameService.findGameById(TEST_GAME_ID)).willReturn(partidaPrueba);

	}

	@WithMockUser(value = "spring")
	@Test
	void testInitCreationForm() throws Exception {
		mockMvc.perform(get("/games/new")).andExpect(status().isOk()).andExpect(model().attributeExists("game"))
				.andExpect(view().name("games/createOrUpdateGameForm"));
	}

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