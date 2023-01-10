package org.springframework.samples.petclinic.minijuego;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.Foto;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MinijuegoController {

    private static final Logger log = LoggerFactory.getLogger(MinijuegoController.class);

    private static final String VIEWS_ELEGIR_MINIJUEGO = null;
    private static final String VIEWS_MOSTRAR_MINIJUEGOS = "logros/seleccionMinijuego";
    private static final String LA_PATATA_CALIENTE = "logros/papasarruga";
    private static final String CARTA = "logros/cartas";
    private static final String ESPERA = "logros/jugadoresEspera";
    private static final String WAITING = "logros/waiting";

    private final MinijuegoService minijuegoService;
    private final GameService gameService;
    private final CartaService cartaService;
    private final PlayerService playerService;

    private Map<Integer, List<Integer>> playerCards;
    private Map<String, Integer> puntuacion;
    private List<Integer> listaGanadores;
    private String nombreMinijuego = "";
    private Integer gameId = 0, minijuegoId = 0, cartaSeleccionada = 0;

    @Autowired
    public MinijuegoController(MinijuegoService minijuegoService, GameService gameService, CartaService cartaService,
            Map<Integer, List<Integer>> playerCards, PlayerService playerService, Map<String, Integer> puntuacion,
            List<Integer> listaGanadores) {
        this.minijuegoService = minijuegoService;
        this.gameService = gameService;
        this.cartaService = cartaService;
        this.playerCards = playerCards;
        this.playerService = playerService;
        this.puntuacion = puntuacion;
        this.listaGanadores = listaGanadores;
    }

    @GetMapping(value = "/minijuegos")
    public String listAllMinijuegos(ModelMap model) {
        Collection<Minijuego> allMinijuegos = this.minijuegoService.getAllMinijuegos();
        model.put("minijuegos", allMinijuegos);
        return VIEWS_MOSTRAR_MINIJUEGOS;
    }

    @GetMapping(value = "/minijuegos/alvarito/{minijuegoId}/repartir")
    public String repartirCartas(@PathVariable("minijuegoId") int id, ModelMap model) {
        log.info("Repartiendo las cartas");
        List<Player> listaJugadores = minijuegoService.getPlayersByGameId(id);

        playerCards = minijuegoService.reparteCartas(minijuegoService.findById(id));

        puntuacion = minijuegoService.sumarPunto("", new ArrayList<String>(), puntuacion, listaJugadores);

        nombreMinijuego = minijuegoService.findById(id).getName().toString();

        gameId = minijuegoService.findById(id).getGame().getId();

        minijuegoId = id;

        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }

    @GetMapping(value = "/minijuegos/actualizar")
    public String compruebaAcierto(@RequestParam(value = "respuesta") String respuesta, ModelMap model) {
        Minijuego minijuego = minijuegoService.findById(minijuegoId);
        if (minijuego.getName().equals("LA_PATATA_CALIENTE")) {
            log.info("Comprobando si acierta");
            Collection<Foto> fotos = cartaService.findNamePhotosByCard(cartaSeleccionada);
            List<String> listaFotos = new ArrayList<>();
            fotos.forEach(x -> listaFotos.add(x.getName()));
            playerCards = minijuegoService.compruebaAcierto(respuesta, listaFotos, playerCards, nombreMinijuego,
                    cartaSeleccionada);
            cartaSeleccionada = 0;
        } else {
            Collection<Foto> listaCartas = cartaService
                    .findNamePhotosByCard(playerCards.get(0).get(playerCards.get(0).size() - 1));
            List<String> listaFotos = new ArrayList<>();
            listaCartas.forEach(x -> listaFotos.add(x.getName()));
            playerCards = minijuegoService.compruebaAcierto(respuesta,
                    listaFotos, playerCards, nombreMinijuego, 0);
            puntuacion = minijuegoService.sumarPunto(respuesta, listaFotos, puntuacion, new ArrayList<Player>());
        }
        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }

    @GetMapping(value = "games/{game_id}/minijuegos/{minijuegoId}/jugar")
    public String jugarMinijuego(@PathVariable("minijuegoId") int id, ModelMap model) {

        Minijuego minijuego = minijuegoService.findById(id);

        Player jugadorActual = minijuegoService.playerSesion();

        if ((minijuego.getName().equals("EL_FOSO")
                && playerCards.get(minijuegoService.playerSesion().getId()).size() != 0)
                || (minijuego.getName().equals("TORRE_INFERNAL") && playerCards.get(0).size() != 0)) {
                    log.info("Jugando El Foso/Torre Inernal");
                    model.put("url", cartaService
                    .findCardUrl(
                            playerCards.get(jugadorActual.getId())
                                    .get(playerCards.get(jugadorActual.getId()).size() - 1)));

            model.put("fotos", cartaService.findNamePhotosByCard(
                    playerCards.get(jugadorActual.getId()).get(playerCards.get(jugadorActual.getId()).size() - 1)));

            model.put("cartaCentralUrl",
                    cartaService.findCardUrl(playerCards.get(0).get(playerCards.get(0).size() - 1)));
        }

        if (minijuego.getName().equals("LA_PATATA_CALIENTE")) {
            log.info("Jugando La Patata Caliente");
            List<Carta> listaCartas = new ArrayList<>();
            playerCards.forEach((x, y) -> {
                if (x != jugadorActual.getId() && x != 0)
                    if (y.size() != 0)
                        listaCartas.add(cartaService.getCardById(y.get(y.size() - 1)));
            });
            if (playerCards.get(jugadorActual.getId()).size() != 0) {
                model.put("miCarta", cartaService
                        .findCardUrl(
                                playerCards.get(jugadorActual.getId())
                                        .get(playerCards.get(jugadorActual.getId()).size() - 1)));

                model.put("misBotones", cartaService.findNamePhotosByCard(
                        playerCards.get(jugadorActual.getId()).get(playerCards.get(jugadorActual.getId()).size() - 1)));
            }

            model.put("listaCartas", listaCartas);

            if (cartaSeleccionada != 0)
                model.put("boton", true);
            else
                model.put("boton", false);

            listaGanadores = minijuegoService.finalizarPartida(nombreMinijuego, playerCards);

            if (listaGanadores.size() != 0) {
                Player ganador = playerService.findPlayerById(listaGanadores.get(0));
                Player perdedor = playerService.findPlayerById(listaGanadores.get(1));
                model.put("lista", listaGanadores);
                model.put("ganador", ganador);
                model.put("perdedor", perdedor);
                model.put("creador", minijuego.getGame().getPlayersList().get(0).getId());
                model.put("jugadorActual", minijuegoService.playerSesion().getId());
                return ESPERA;
            }
            //if (playerCards.get(jugadorActual.getId()).size() == 0)
              //  return WAITING; 

            return LA_PATATA_CALIENTE;
        }

        model.put("jugadores", puntuacion);

        listaGanadores = minijuegoService.finalizarPartida(nombreMinijuego, playerCards);

        if (listaGanadores.size() != 0) {
            Player ganador = playerService.findPlayerById(listaGanadores.get(0));
            Player perdedor = playerService.findPlayerById(listaGanadores.get(1));
            model.put("lista", listaGanadores);
            model.put("ganador", ganador);
            model.put("perdedor", perdedor);
            model.put("creador", minijuego.getGame().getPlayersList().get(0).getId());
            model.put("jugadorActual", minijuegoService.playerSesion().getId());
            return ESPERA;
        }

        return CARTA;
    }

    @GetMapping(value = "/minijuegos/seleccion")
    public String seleccionarMinijuego(ModelMap model) {
        log.info("Seleccionado minijuego");
        model.put("minijuegos", minijuegoService.getAllMinijuegos());
        return VIEWS_MOSTRAR_MINIJUEGOS;
    }

    @GetMapping(value = "/minijuegos/cartaSeleccionada/{carta_id}")
    public String cartaSeleccionada(@PathVariable("carta_id") int id) {
        cartaSeleccionada = id;
        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }
}
