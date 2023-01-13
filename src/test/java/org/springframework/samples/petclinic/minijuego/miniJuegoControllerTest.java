// package org.springframework.samples.petclinic.minijuego;

// import static org.assertj.core.api.Assertions.assertThat;

// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;

// import javax.swing.text.View;

// import org.junit.jupiter.api.Test;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
// import org.springframework.context.annotation.ComponentScan;
// import org.springframework.samples.petclinic.carta.Carta;
// import org.springframework.samples.petclinic.carta.CartaService;
// import org.springframework.samples.petclinic.foto.FotoService;
// import org.springframework.samples.petclinic.game.Game;
// import org.springframework.samples.petclinic.game.GameService;
// import org.springframework.samples.petclinic.mazo.MazoService;
// import org.springframework.samples.petclinic.player.Player;
// import org.springframework.samples.petclinic.player.PlayerService;
// import org.springframework.samples.petclinic.user.User;
// import org.springframework.samples.petclinic.user.UserService;
// import org.springframework.samples.petclinic.util.AuthenticationService;
// import org.springframework.security.test.context.support.WithMockUser;
// import org.springframework.stereotype.Service;
// import org.springframework.test.web.servlet.MockMvc;
// import org.springframework.transaction.annotation.Transactional;
// import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
// import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
// import org.springframework.boot.test.mock.mockito.MockBean;

// import ch.qos.logback.core.status.Status;

// /**
//  * Integration test of the Service and the Repository layer.
//  * <p>
//  * ClinicServiceSpringDataJpaTests subclasses benefit from the following
//  * services provided
//  * by the Spring TestContext Framework:
//  * </p>
//  * <ul>
//  * <li><strong>Spring IoC container caching</strong> which spares us unnecessary
//  * set up
//  * time between test execution.</li>
//  * <li><strong>Dependency Injection</strong> of test fixture instances, meaning
//  * that we
//  * don't need to perform application context lookups. See the use of
//  * {@link Autowired @Autowired} on the <code>{@link
//  * MinijuegoControllerTests#clinicService clinicService}</code> instance variable,
//  * which uses
//  * autowiring <em>by type</em>.
//  * <li><strong>Transaction management</strong>, meaning each test method is
//  * executed in
//  * its own transaction, which is automatically rolled back by default. Thus,
//  * even if tests
//  * insert or otherwise change database state, there is no need for a teardown or
//  * cleanup
//  * script.
//  * <li>An {@link org.springframework.context.ApplicationContext
//  * ApplicationContext} is
//  * also inherited and can be used for explicit bean lookup if necessary.</li>
//  * </ul>
//  *
//  * @author Ken Krebs
//  * @author Rod Johnson
//  * @author Juergen Hoeller
//  * @author Sam Brannen
//  * @author Michael Isvy
//  * @author Dave Syer
//  */

// @DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
// class MinijuegoControllerTest {
// 	@Autowired
// 	protected MinijuegoService minijuegoService;
//     @Autowired
//     protected PlayerService playerService;
//     @Autowired
//     protected CartaService cartaService;
//     @Autowired
//     protected GameService gameService;
//     @Autowired
//     protected FotoService fotoService;


//     @WithMockUser
//     @Test
//     void reparteCartas() throws Exception{
//         mockMvc.perform(get("/minijuegos/alvarito/"+ this.minijuegoService.findById(1)+ "/repartir"))
//         .andExpect(status().is3xxReddirection())
//         .andExpect(view().name("redirect:/games/{gameId}/minijuegos/{minijuegoId}"));
//     }

    

// }