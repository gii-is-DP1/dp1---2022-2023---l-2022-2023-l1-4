package org.springframework.samples.petclinic.minijuego;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.carta.CartaService;
import org.springframework.samples.petclinic.foto.Foto;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.samples.petclinic.player.Player;
import org.springframework.samples.petclinic.player.PlayerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MinijuegoController {

    private static final String VIEWS_ELEGIR_MINIJUEGO = null;
    private static final String VIEWS_MOSTRAR_MINIJUEGOS = "logros/seleccionMinijuego";
    private static final String CARTA = "logros/cartas";

    private final MinijuegoService minijuegoService;
    private final GameService gameService;
    private final CartaService cartaService;
    private final PlayerService playerService;

    private Map<Integer, List<Integer>> playerCards;
    private Map<String, Integer> puntuacion;
    private List<Integer> listaGanadores;
    private String nombreMinijuego = "";
    private Integer gameId = 0, minijuegoId = 0;

    @Autowired
    public MinijuegoController(MinijuegoService minijuegoService, GameService gameService, CartaService cartaService,
            Map<Integer, List<Integer>> playerCards, PlayerService playerService, Map<String, Integer> puntuacion, List<Integer> listaGanadores) {
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
        Collection<Foto> listaCartas = cartaService
                .findNamePhotosByCard(playerCards.get(0).get(playerCards.get(0).size() - 1));
        List<String> listaFotos = new ArrayList<>();
        listaCartas.forEach(x -> listaFotos.add(x.getName()));
        playerCards = minijuegoService.compruebaAcierto(respuesta,
                listaFotos, playerCards, nombreMinijuego);
        puntuacion = minijuegoService.sumarPunto(respuesta, listaFotos, puntuacion, new ArrayList<Player>());
        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }

    @GetMapping(value = "games/{game_id}/minijuegos/{minijuego_id}/jugar")
    public String jugarMinijuego(ModelMap model) {

        Player jugadorActual = minijuegoService.playerSesion();

        model.put("url", cartaService
                .findCardUrl(
                        playerCards.get(jugadorActual.getId()).get(playerCards.get(jugadorActual.getId()).size() - 1)));

        model.put("fotos", cartaService.findNamePhotosByCard(
                playerCards.get(jugadorActual.getId()).get(playerCards.get(jugadorActual.getId()).size() - 1)));

        model.put("cartaCentralUrl", cartaService.findCardUrl(playerCards.get(0).get(playerCards.get(0).size() - 1)));

        model.put("jugadores", puntuacion);

        listaGanadores = minijuegoService.finalizarPartida(nombreMinijuego, playerCards);

        if(listaGanadores.size() != 0)
            return "";
            
        return CARTA;
    }

    @GetMapping(value = "/minijuegos/seleccion")
    public String seleccionarMinijuego(ModelMap model) {
        model.put("minijuegos", minijuegoService.getAllMinijuegos());
        return VIEWS_MOSTRAR_MINIJUEGOS;
    }
}
