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
package org.springframework.samples.persona;
import java.util.Collection;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Juergen Hoeller
 * @author Ken Krebs
 * @author Arjen Poutsma
 * @author Michael Isvy
 */
@Controller
public class PersonaController {

	private static final String VIEWS_JUGADOR_CREATE_OR_UPDATE_FORM = "personas/createOrUpdateJugadorForm";

	private final PersonaService personaService;

	@Autowired
	public PersonaController(PersonaService personaService, UserService userService, AuthoritiesService authoritiesService) {
		this.personaService = personaService;
	}

	@InitBinder
	public void setAllowedFields(WebDataBinder dataBinder) {
		dataBinder.setDisallowedFields("id");
	}

	@GetMapping(value = "/personas/new")
	public String initCreationForm(Map<String, Object> model) {
		Persona persona = new Persona();
		model.put("persona", persona);
		return VIEWS_JUGADOR_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping(value = "/persona/new")
	public String processCreationForm(@Valid Persona persona, BindingResult result) {
		if (result.hasErrors()) {
			return VIEWS_JUGADOR_CREATE_OR_UPDATE_FORM;
		}
		else {
			//crear persona, usuario y autorizacion
			this.personaService.guardarPersona(persona);
			
			return "redirect:/personas/" + persona.getId();
		}
	}

	@GetMapping(value = "/personas/encontrar")
	public String initEncontrarForm(Map<String, Object> model) {
		model.put("persona", new Persona());
		return "personas/encontrarPersonas";
	}

	@GetMapping(value = "/personas")
	public String processEncontrarForm(Persona persona, BindingResult result, Map<String, Object> model) {
		if (persona.getLastName() == null) {
			persona.setLastName(""); // empty string signifies broadest possible search
		}
		//if (persona.getFirstName() == null) {
		//	persona.setFirstName(""); // empty string signifies broadest possible search
		//}

		// encontrar personas por apellido
		Collection<Persona> personasPorApellido = this.personaService.encuentraPersonaPorApellido(persona.getLastName());
		if (personasPorApellido.isEmpty()) {
			// no personas found
			result.rejectValue("apellido", "notFound", "not found");
			return "personas/encontrarPersonas";
		}
		else if (personasPorApellido.size() == 1) {
			// 1 persona found
			persona = personasPorApellido.iterator().next();
			return "redirect:/personas/" + persona.getId();
		}
		else {
			// multiple personas found
			model.put("selections", personasPorApellido);
			return "personas/personasList";
		}

		// encontrar personas por name
	}

	@GetMapping(value = "/personas/{personaId}/editar")
	public String initEditarPersonaForm(@PathVariable("personaId") int personaId, Model model) {
		Persona persona = this.personaService.encontrarPersonaPorId(personaId);
		model.addAttribute(persona);
		return VIEWS_JUGADOR_CREATE_OR_UPDATE_FORM;
	}

	@PostMapping(value = "/personas/{personaId}/editar")
	public String procesoEditarPersonaForm(@Valid Persona persona, BindingResult result,
			@PathVariable("personaId") int personaId) {
		if (result.hasErrors()) {
			return VIEWS_JUGADOR_CREATE_OR_UPDATE_FORM;
		}
		else {
			persona.setId(personaId);
			this.personaService.guardarPersona(persona);
			return "redirect:/personas/personaId}";
		}
	}

	/**
	 * Custom handler for displaying an persona.
	 * @param personaId the ID of the persona to display
	 * @return a ModelMap with the model attributes for the view
	 */
	@GetMapping("/personas/{personaId}")
	public ModelAndView mostrarPersona(@PathVariable("personaId") int personaId) {
		ModelAndView mav = new ModelAndView("personas/personaDetails");
		mav.addObject(this.personaService.encontrarPersonaPorId(personaId));
		return mav;
	}

}
