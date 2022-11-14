package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MinijuegoController {

    private static final String VIEWS_ELEGIR_MINIJUEGO=null;
    private static final String VIEWS_MOSTRAR_MINIJUEGO=null;

    private final MinijuegoService minijuegoService;

	@Autowired
	public MinijuegoController(MinijuegoService minijuegoService, UserService userService, AuthoritiesService authoritiesService) {
		this.minijuegoService = minijuegoService;
	}

    @GetMapping
    public String listAllMinijuegos(ModelMap model) {
        Collection<Minijuego> allMinijuegos = this.minijuegoService.findMinijuegos();
        model.put("minijuegos", allMinijuegos);
        return VIEWS_MOSTRAR_MINIJUEGO;
    }
}
