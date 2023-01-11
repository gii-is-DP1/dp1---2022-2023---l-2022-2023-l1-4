/*
 * Copyright 2002-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
class MinijuegoServiceTests {
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

    System.out.println("buscameee" + map1);
    assertThat(map1.size()!=0);
    assertThat(map2.size()!=0);
    assertThat(map3.size()!=0);
    }

    // @Test
    // void shouldsumarPunto(){

    //     Map<String, Integer> puntuacion = new HashMap<>();
    //     Map<String, Integer> comprueba = new HashMap<>();
    //     String respuesta = "caramelo";
    //     List<String> fotosCentro = new ArrayList<>();
    //     List<Player> listJugadores = new ArrayList<>();
    //     Player player = playerService.findPlayerById(3);
    //     System.out.println("buscameee" + player);

    //     puntuacion.put("Fernando Barroso",0);
    //     fotosCentro.add("caramelo" );
    //     listJugadores.add(player);

    //     comprueba = minijuegoService.sumarPunto(respuesta, fotosCentro,puntuacion,listJugadores);
        
    //     assertThat(comprueba.get("Fernando Barroso").equals(1));

    // }


    @Test
    void shouldActualizarCarta(){
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
        Integer idCarta = 3;
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