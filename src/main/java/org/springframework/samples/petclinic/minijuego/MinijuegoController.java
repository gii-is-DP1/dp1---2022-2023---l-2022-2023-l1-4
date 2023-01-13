package org.springframework.samples.petclinic.minijuego;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

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

    private static final String VIEWS_MOSTRAR_MINIJUEGOS = "logros/seleccionMinijuego";
    private static final String LA_PATATA_CALIENTE = "logros/papasarruga";
    private static final String CARTA = "logros/cartas";
    private static final String FINAL_MINIJUEGOS = "logros/finalMinijuegos";

    private final MinijuegoService minijuegoService;
    private final GameService gameService;
    private final CartaService cartaService;
    private final PlayerService playerService;

    private Map<Integer, List<Integer>> playerCards;
    private Map<Integer, Integer> ganadorRonda;
    private Map<Integer, Integer> perdedorRonda;
    private Map<String, Integer> puntuacion;
    private List<Integer> listaGanadores;
    private String nombreMinijuego = "";
    private Integer gameId = 0, minijuegoId = 0, cartaSeleccionada = 0, ronda = 1;

    @Autowired
    public MinijuegoController(MinijuegoService minijuegoService, GameService gameService, CartaService cartaService,
            Map<Integer, List<Integer>> playerCards, PlayerService playerService, Map<String, Integer> puntuacion,
            List<Integer> listaGanadores, Map<Integer, Integer> ganadorRonda, Map<Integer, Integer> perdedorRonda) {
        this.minijuegoService = minijuegoService;
        this.gameService = gameService;
        this.cartaService = cartaService;
        this.playerCards = playerCards;
        this.playerService = playerService;
        this.puntuacion = puntuacion;
        this.listaGanadores = listaGanadores;
        this.ganadorRonda = ganadorRonda;
        this.perdedorRonda = perdedorRonda;
    }

    @GetMapping(value = "/games/{gameId}/minijuegos/{minijuegoId}/repartir")
    public String repartirCartas(@PathVariable("minijuegoId") int id, @PathVariable("gameId") int idGame,
            ModelMap model) {

        List<Player> listaJugadores = minijuegoService.getPlayersByGameId(idGame);

        this.listaGanadores = new ArrayList<>();

        this.ronda = 1;

        playerCards = minijuegoService.reparteCartas(minijuegoService.findById(id));

        puntuacion = minijuegoService.sumarPunto("", new ArrayList<String>(), puntuacion, listaJugadores);

        nombreMinijuego = minijuegoService.findById(id).getName().toString();

        gameId = idGame;

        minijuegoId = id;

        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }

    @GetMapping(value = "/minijuegos/actualizar")
    public String compruebaAcierto(@RequestParam(value = "respuesta") String respuesta, ModelMap model) {
        Minijuego minijuego = minijuegoService.findById(minijuegoId);
        if (minijuego.getName().equals("LA_PATATA_CALIENTE")) {
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
    public String jugarMinijuego(@PathVariable("minijuegoId") int id, ModelMap model, HttpServletResponse response) {

        List<Minijuego> listMinijuegos = gameService.findMinijuegos(gameId);
        Integer idUltimoMinijuego = listMinijuegos.get(listMinijuegos.size() - 1).getId();
        if (idUltimoMinijuego > id) {
            return "redirect:/games/" + gameId + "/minijuegos/" + idUltimoMinijuego + "/jugar";
        }

        //response.addHeader("Refresh", "1");

        Minijuego minijuego = minijuegoService.findById(id);

        Player jugadorActual = minijuegoService.playerSesion();

        if ((minijuego.getName().equals("EL_FOSO")
                && playerCards.get(minijuegoService.playerSesion().getId()).size() != 0)
                || (minijuego.getName().equals("TORRE_INFERNAL") && playerCards.get(0).size() != 0)) {
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
            List<Carta> listaCartas = new ArrayList<>();
            playerCards.forEach((x, y) -> {
                if (x != jugadorActual.getId() && x != 0)
                    if (y.size() != 0) {
                        listaCartas.add(cartaService.getCardById(y.get(y.size() - 1)));
                    }
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
                ganadorRonda.put(ronda, listaGanadores.get(0));
                perdedorRonda.put(ronda, listaGanadores.get(1));
                ronda += 1;
                if (ronda != minijuego.getNumRounds()) {
                    playerCards = minijuegoService.reparteCartaRondaPatataCaliente(playerCards);
                    return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
                }
            }

            if (ganadorRonda.containsKey(minijuego.getNumRounds())
                    && perdedorRonda.containsKey(minijuego.getNumRounds())) {

                List<Integer> listaG = new ArrayList<>();
                List<Integer> listaP = new ArrayList<>();

                ganadorRonda.forEach((x, y) -> listaG.add(y));
                perdedorRonda.forEach((x, y) -> listaP.add(y));

                List<Integer> g = listaG.stream()
                        .collect(Collectors.groupingBy(s -> s))
                        .entrySet()
                        .stream()
                        .filter(e -> e.getValue().size() > 1)
                        .map(e -> e.getKey())
                        .collect(Collectors.toList());

                List<Integer> p = listaP.stream()
                        .collect(Collectors.groupingBy(s -> s))
                        .entrySet()
                        .stream()
                        .filter(e -> e.getValue().size() > 1)
                        .map(e -> e.getKey())
                        .collect(Collectors.toList());

                Player ganador = playerService.findPlayerById(g.get(0));
                Player perdedor = playerService.findPlayerById(p.get(0));

                Minijuego minijuegoNuevo = minijuego;
                minijuegoService.actualizarGanadores(minijuegoNuevo, ganador, perdedor);

                model.put("gameId", gameId);
                model.put("lista", listaGanadores);
                model.put("ganador", ganador);
                model.put("perdedor", perdedor);
                model.put("creador", minijuego.getGame().getPlayersList().get(0).getId());
                model.put("jugadorActual", minijuegoService.playerSesion().getId());
                return FINAL_MINIJUEGOS;
            }

            return LA_PATATA_CALIENTE;
        }

        model.put("jugadores", puntuacion);

        listaGanadores = minijuegoService.finalizarPartida(nombreMinijuego, playerCards);

        if (listaGanadores.size() != 0) {
            Player ganador = playerService.findPlayerById(listaGanadores.get(0));
            Player perdedor = playerService.findPlayerById(listaGanadores.get(1));

            Minijuego minijuegoNuevo = minijuego;
            minijuegoService.actualizarGanadores(minijuegoNuevo, ganador, perdedor);

            model.put("gameId", gameId);
            model.put("lista", listaGanadores);
            model.put("ganador", ganador);
            model.put("perdedor", perdedor);
            model.put("creador", minijuego.getGame().getPlayersList().get(0).getId());
            model.put("jugadorActual", minijuegoService.playerSesion().getId());
            return FINAL_MINIJUEGOS;
        }
        
        return CARTA;
    }

    @GetMapping(value = "/games/{gameId}/minijuegos/seleccion")
    public String seleccionarMinijuego(@PathVariable("gameId") int id, ModelMap model) {
        List<String> listaMinijuegosNombre = new ArrayList<>();
        listaMinijuegosNombre.add(TipoMinijuego.TORRE_INFERNAL.toString());
        listaMinijuegosNombre.add(TipoMinijuego.EL_FOSO.toString());
        listaMinijuegosNombre.add(TipoMinijuego.LA_PATATA_CALIENTE.toString());
        model.put("minijuegos", listaMinijuegosNombre);
        return VIEWS_MOSTRAR_MINIJUEGOS;
    }

    @GetMapping(value = "/minijuegos/cartaSeleccionada/{carta_id}")
    public String cartaSeleccionada(@PathVariable("carta_id") int id) {
        cartaSeleccionada = id;
        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoId + "/jugar";
    }

    @GetMapping("/games/{gameId}/primera")
    public String primera(@PathVariable("gameId") int gameId, ModelMap model) {
        Minijuego minijuegoNuevo = new Minijuego();
        minijuegoNuevo.setGame(gameService.findGameById(gameId));
        minijuegoNuevo.setName(TipoMinijuego.TORRE_INFERNAL.toString());
        minijuegoNuevo = minijuegoService.save(minijuegoNuevo);

        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoNuevo.getId() + "/repartir";
    }

    @GetMapping("/games/{gameId}/minijuegos/{minijuego}/nuevaRonda")
    public String nuevaRonda(@RequestParam(value = "rondas", required = false) Integer rondas,
            @PathVariable("gameId") int gameId,
            @PathVariable("minijuego") String nombreMinijuego, ModelMap model) {
        Minijuego minijuegoNuevo = new Minijuego();
        minijuegoNuevo.setGame(gameService.findGameById(gameId));
        minijuegoNuevo.setName(nombreMinijuego);
        if (nombreMinijuego.equals(TipoMinijuego.LA_PATATA_CALIENTE.toString()))
            minijuegoNuevo.setNumRounds(rondas);
        minijuegoNuevo = minijuegoService.save(minijuegoNuevo);
        return "redirect:/games/" + gameId + "/minijuegos/" + minijuegoNuevo.getId() + "/repartir";
    }
}