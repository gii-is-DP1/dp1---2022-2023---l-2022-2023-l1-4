package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.game.GameService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MinijuegoController {

    private static final String VIEWS_ELEGIR_MINIJUEGO = null;
    private static final String VIEWS_MOSTRAR_MINIJUEGOS = "minijuegos/MinijuegosList";

    private final MinijuegoService minijuegoService;
    private final GameService gameService;

    @Autowired
    public MinijuegoController(MinijuegoService minijuegoService, GameService gameService) {
        this.minijuegoService = minijuegoService;
        this.gameService = gameService;
    }

    @GetMapping(value = "/minijuegos")
    public String listAllMinijuegos(ModelMap model) {
        Collection<Minijuego> allMinijuegos = this.minijuegoService.getAllMinijuegos();
        model.put("minijuegos", allMinijuegos);
        return VIEWS_MOSTRAR_MINIJUEGOS;
    }

    



}
