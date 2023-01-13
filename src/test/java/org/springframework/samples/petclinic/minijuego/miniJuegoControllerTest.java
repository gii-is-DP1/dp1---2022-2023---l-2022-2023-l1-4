package org.springframework.samples.petclinic.minijuego;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.configuration.SecurityConfiguration;
import org.springframework.samples.petclinic.foto.Foto;
import org.springframework.samples.petclinic.foto.FotoService;
import org.springframework.samples.petclinic.game.Game;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.User;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(controllers = MinijuegoController.class, excludeFilters = @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE, classes = WebSecurityConfigurer.class), excludeAutoConfiguration = SecurityConfiguration.class)
public class MinijuegoControllerTest {

    @Autowired
    private MinijuegoController minijuegoController;

    @MockBean
    private PlayerService playerService;

    @MockBean
    private MinijuegoService minijuegoService;


    @MockBean
    private UserService userService;

    @MockBean
    private FotoService fotoService;

    @MockBean
    private CartaService cartaService;

    @MockBean
    private GameService gameService;

    @MockBean
    private AuthoritiesService authoritiesService;

    @Autowired
    private MockMvc mockMvc;

    private Minijuego minijuego;

    private Player jugador;

    private Game juego;

    private Carta carta;

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


        List<Carta> cartas = new ArrayList<>();
        List<Foto> fotos = new ArrayList<>();

        Foto foto = new Foto();

        Game game = new Game();
        Minijuego minijuego1 = new Minijuego();
        Minijuego minijuego2 = new Minijuego();

        minijuego1.setId(5);
        minijuego1.setName("Torre Infernal");
        minijuego2.setId(6);
        minijuego2.setName("El Foso");

        game.setId(10);
        game.setName("Test setUp");
        game.setNumPlayers(2);
        game.setPlayersList(players);

        gameService.save(game);

        Foto foto1 = foto;
        foto1.setId(100);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto2 = foto;
        foto1.setId(101);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto3 = foto;
        foto1.setId(102);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto4 = foto;
        foto1.setId(103);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto5 = foto;
        foto1.setId(104);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto6 = foto;
        foto1.setId(105);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto7 = foto;
        foto1.setId(106);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        Foto foto8 = foto;
        foto1.setId(107);
        foto1.setName("Mano");
        foto1.setColourCode("Red");
        fotoService.saveFoto(foto);

        fotos.add(foto1);
        fotos.add(foto2);
        fotos.add(foto3);
        fotos.add(foto4);
        fotos.add(foto5);
        fotos.add(foto6);
        fotos.add(foto7);
        fotos.add(foto8);
        
        Carta carta = new Carta();

        Carta carta1 = carta;
        carta1.setId(100);
        carta1.setFoto(fotos);
  
        Carta carta2 = carta;
        carta2.setId(101);
        carta2.setFoto(fotos);

        Carta carta3 = carta;
        carta3.setId(102);
        carta3.setFoto(fotos);

        Carta carta4 = carta;
        carta4.setId(103);
        carta4.setFoto(fotos);

        cartas.add(carta1);
        cartas.add(carta2);
        cartas.add(carta3);
        cartas.add(carta4);

        minijuego1.setId(3);
        minijuego1.setGame(game);
        minijuego1.setName("LA_PATATA_CALIENTE");

        minijuego2.setId(4);
        minijuego2.setGame(game);
        minijuego2.setName("TORRE_INFERNAL");
        
        List<Minijuego> listaMinijuego = new ArrayList<>();
        listaMinijuego.add(minijuego1);
        listaMinijuego.add(minijuego2);

        juego = game;
        /*  given(this.minijuegoService.findById(3)).willReturn(minijuego1);
        given(this.gameService.findGameById(10)).willReturn(game);
        given(this.minijuegoService.rondasPartida(10)).willReturn(listaRonda);
        given(this.minijuegoService.findById(3)).willReturn(round1);
        given(this.minijuegoService.findById(4)).willReturn(round2);
        given(this.minijuegoService.findFotoById(100)).willReturn(figura1);
        given(this.playerService.findPlayerById(20)).willReturn(player1);
    */

    
   

       



/* 
	@WithMockUser
	@Test
	void reparteCartas() throws Exception {
		mockMvc.perform(get("/minijuegos/alvarito/" + 3 + "/repartir"))
				.andExpect(status().is3xxRedirection())
				.andExpect(view().name("redirect:/games/" + 10 +"/minijuegos/"+ 3 + "/jugar"));
	}

}
*/
    }
}