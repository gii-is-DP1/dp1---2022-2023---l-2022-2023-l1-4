package org.springframework.samples.petclinic.partida;

import java.util.Collection;

import java.util.Map;


import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller

public class PartidaController {

    
    private static final String VIEWS_PARTIDA_CREATE_OR_UPDATE_FORM = "partidas/createOrUpdatePartidaForm";

    private PartidaService partidaService;

    @Autowired
    public PartidaController(PartidaService partidaService){
        this.partidaService = partidaService;
    }

    @InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}
    
   
    @GetMapping(value = "/partidas/new")
	public String initCreationForm(Map<String, Object> model) {
		Partida partida = new Partida();
		model.put("partida", partida);
		return VIEWS_PARTIDA_CREATE_OR_UPDATE_FORM;
	}


    @PostMapping(value = "/partidas/new")
	public String processCreationForm(@Valid Partida partida, BindingResult result) {
		if (result.hasErrors()) {
			return VIEWS_PARTIDA_CREATE_OR_UPDATE_FORM;
		}
		else {
			this.partidaService.save(partida);
			return "redirect:/partidas"; //change
		}
	}


    @GetMapping(value = "/partidas/encontrar")
	public String initEncontrarForm(Map<String, Object> model) {
		model.put("partida", new Partida());
		return "partidas/encontrarPartidas";
	}

	@GetMapping(value = "/partidas")
	public String processEncontrarForm(Partida partida, BindingResult result, Map<String, Object> model) {
		if (partida.getName() == null) {
			partida.setName(""); // empty string signifies broadest possible search
		}

		Collection<Partida> partidasPorNombre = this.partidaService.encuentraPartidaPorNombre(partida.getName());
		if (partidasPorNombre.isEmpty()) {
			// no partidas found
			result.rejectValue("name", "notFound", "not found");
			return "partidas/encontrarPartidas";
		}
		else if (partidasPorNombre.size() == 1) {
			// 1 partida found
			partida = partidasPorNombre.iterator().next();
			return "redirect:/partidas/" + partida.getId();
		}
		else {
			// multiple partidas found
			model.put("selections", partidasPorNombre);
			return "partidas/partidasList";
		}
	}


    @GetMapping("/partidas/{partidaId}")
	public ModelAndView mostrarPartida(@PathVariable("partidaId") int partidaId) {
		ModelAndView mav = new ModelAndView("partidas/partidaDetails");
		mav.addObject(this.partidaService.encontrarPartidaPorId(partidaId));
		return mav;
	}


    
}
