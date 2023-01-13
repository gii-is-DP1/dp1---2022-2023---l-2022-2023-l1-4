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
import org.springframework.http.MediaType;
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


	private static String VIEWS_GAME_CREATE_OR_UPDATE_FORM = "games/new";
	private static final int TEST_GAME_ID = 40;
	private static final int TEST_PLAYER_ID = 6;
	@Autowired
	@MockBean
	private GameController gameController;

	@MockBean
	private GameService gameService;

	@MockBean
	private AuthoritiesService authoritiesService;

	@Autowired
	private MockMvc mockMvc;

	private Game game;

	@BeforeEach
	void setUp() {
		game = new Game();
		game.setName("PruebaPost");
		game.setNumPlayers(2);
		game.setId(TEST_GAME_ID);

	}

	@Test
	@WithMockUser
	public void shouldReturnCreateGameViewOnNewGame() throws Exception {
		mockMvc.perform(get("/games/new"))
				.andExpect(status().isOk())
				.andExpect(view().name(VIEWS_GAME_CREATE_OR_UPDATE_FORM));
	}
	@WithMockUser(value = "spring")
	@Test
	void testProcessCreationFormSuccess() throws Exception {
		mockMvc.perform(post("/games/new").param("name", "PruebaPost").param("numPlayers", "2").with(csrf()))
		.andExpect(status().isOk());
	}

	@WithMockUser(value = "spring")
	@Test
	void testProcessInitFindForm() throws Exception {
		given(this.gameService.getAllGames()).willReturn(Lists.newArrayList(game, new Game()));

		mockMvc.perform(get("/games"))
		.andExpect(status().isOk())
		.andExpect(view().name("games"));
	}

	@WithMockUser(value = "spring")
	@Test
	void testJoinGame() throws Exception {
		mockMvc.perform(get("/games"))
		.andExpect(status().isOk())
		.andExpect(view().name("games"));
	}

}