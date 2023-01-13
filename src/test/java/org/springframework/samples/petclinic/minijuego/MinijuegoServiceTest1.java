package org.springframework.samples.petclinic.minijuego;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.FotoService;
import org.springframework.samples.petclinic.game.Game;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.samples.petclinic.mazo.MazoService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.samples.petclinic.user.User;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.samples.petclinic.util.AuthenticationService;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Integration test of the Service and the Repository layer.
 * <p>
 * ClinicServiceSpringDataJpaTests subclasses benefit from the following
 * services provided
 * by the Spring TestContext Framework:
 * </p>
 * <ul>
 * <li><strong>Spring IoC container caching</strong> which spares us unnecessary
 * set up
 * time between test execution.</li>
 * <li><strong>Dependency Injection</strong> of test fixture instances, meaning
 * that we
 * don't need to perform application context lookups. See the use of
 * {@link Autowired @Autowired} on the <code>{@link
 * MinijuegoServiceTests#clinicService clinicService}</code> instance variable,
 * which uses
 * autowiring <em>by type</em>.
 * <li><strong>Transaction management</strong>, meaning each test method is
 * executed in
 * its own transaction, which is automatically rolled back by default. Thus,
 * even if tests
 * insert or otherwise change database state, there is no need for a teardown or
 * cleanup
 * script.
 * <li>An {@link org.springframework.context.ApplicationContext
 * ApplicationContext} is
 * also inherited and can be used for explicit bean lookup if necessary.</li>
 * </ul>
 *
 * @author Ken Krebs
 * @author Rod Johnson
 * @author Juergen Hoeller
 * @author Sam Brannen
 * @author Michael Isvy
 * @author Dave Syer
 */

 
@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
class MinijuegoServiceTest {
	@Autowired
	protected MinijuegoService minijuegoService;
    @Autowired
    protected PlayerService playerService;
    @Autowired
    protected CartaService cartaService;
    @Autowired
    protected GameService gameService;
    @Autowired
    protected FotoService fotoService;

   

   

    @Test
    @Transactional
    public void shouldGetAllMinijuegos() {
        Collection<Minijuego> minijuegos = this.minijuegoService.getAllMinijuegos();
        assertThat(minijuegos.size()).isEqualTo(3);
    }
    @Test
    @Transactional
    public void shouldGetMinijuegoByName() {
        assertThat(minijuegoService.getMinijuegoByName("LA_PATATA_CALIENTE"));
    }
    @Test
    @Transactional
    public void shouldGetMinijuegoById() {
        assertThat(minijuegoService.findById(1));
    }

    @Test
    @Transactional
    public void shouldGetPlayersByGameId() {

        Integer gameId=4;
        assertThat(minijuegoService.getPlayersByGameId(gameId).size()>0);
    }
    @Test
    @Transactional
    public void shouldGetRandomCard() {
        Collection<Carta> mazo = cartaService.getAll();
        List<Carta> cardsList = new ArrayList<>();
        mazo.forEach(x -> cardsList.add(x));
        Carta carta1 = minijuegoService.getRandomCard(cardsList);
        Carta carta2 = minijuegoService.getRandomCard(cardsList);
        assertThat(!carta1.equals(carta2));
    }


    @Test
    void shouldreparteCartasTest(){
    String nombreMinijuego1 = "LA_PATATA_CALIENTE";
    String nombreMinijuego2 = "TORRE_INFERNAL";
    String nombreMinijuego3 = "EL_FOSO";
    Minijuego minijuego1 = minijuegoService.getMinijuegoByName(nombreMinijuego1);
    Minijuego minijuego2 = minijuegoService.getMinijuegoByName(nombreMinijuego2);
    Minijuego minijuego3 = minijuegoService.getMinijuegoByName(nombreMinijuego3);
    Map<Integer,List<Integer>> map1 = new HashMap<>();
    Map<Integer,List<Integer>> map2 = new HashMap<>();
    Map<Integer,List<Integer>> map3 = new HashMap<>();
    map1 = minijuegoService.reparteCartas(minijuego1);
    map2= minijuegoService.reparteCartas(minijuego2);
    map3 = minijuegoService.reparteCartas(minijuego3);

    assertThat(map1.size()!=0);
    assertThat(map2.size()!=0);
    assertThat(map3.size()!=0);
    }

    
    @Test
    void shouldActualizarCartaTorreInfernalYFoso(){
        Map<Integer,List<Integer>> playerCard = new HashMap<>();
        Map<Integer,List<Integer>> comprueba = new HashMap<>();
        List<Integer> cartas = new ArrayList<>(); 
        List<Integer> cartas2 = new ArrayList<>(); 
        cartas.add(5);
        cartas.add(2);
        cartas2.add(27);
        cartas2.add(46);
        Player jugadorActual = playerService.findPlayerById(3);
        String nombreMinijuego = "TORRE_INFERNAL";
        Map<Integer,Integer> idCarta = new HashMap<>();
        idCarta.put(jugadorActual.getId(),3);
        playerCard.put(3, cartas);
        playerCard.put(0, cartas2);


        comprueba = minijuegoService.actualizaCartas(playerCard, jugadorActual, nombreMinijuego, idCarta);
        assertThat(!(comprueba.equals(playerCard)));
    }


    @Test
    void shouldFinalizarPartida(){
        String nombreMinijuego = "TORRE_INFERNAL";
        Map<Integer,List<Integer>> playerCards = new HashMap<>();
        List<Integer> cartas = new ArrayList<>();
        List<Integer> cartas2 = new ArrayList<>();
        cartas.add(4);
        cartas.add(45);
        cartas2.add(7);
        playerCards.put(2, cartas);
        playerCards.put(1, cartas2);
        playerCards.put(0, new ArrayList<>());
        List<Integer> comprueba = new ArrayList<>();
        comprueba = minijuegoService.finalizarPartida(nombreMinijuego, playerCards);
        assertThat(comprueba.size()==2);
        
    }

}