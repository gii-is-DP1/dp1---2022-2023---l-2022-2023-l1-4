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
package org.springframework.samples.petclinic.persona;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.user.AuthoritiesService;
import org.springframework.samples.petclinic.user.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Mostly used as a facade for all Petclinic controllers Also a placeholder
 * for @Transactional and @Cacheable annotations
 *
 * @author Michael Isvy
 */
@Service
public class PersonaService {

	private PersonaRepository personaRepository;	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthoritiesService authoritiesService;

	@Autowired
	public PersonaService(PersonaRepository personaRepository) {
		this.personaRepository = personaRepository;
	}	

	@Transactional(readOnly = true)
	public Persona encontrarPersonaPorId(int id) throws DataAccessException {
		return personaRepository.findById(id);
	}

	@Transactional(readOnly = true)
	public Collection<Persona> encuentraPersonaPorApellido(String lastName) throws DataAccessException {
		return personaRepository.encuentraPorApellido(lastName);
	}
	@Transactional(readOnly = true)
	public Collection<Persona> encuentraPersonaPorNombre(String firstName) throws DataAccessException {
		return personaRepository.encuentraPorNombre(firstName);
	}

	@Transactional
	public void guardarPersona(Persona persona) throws DataAccessException {
		//crear
		personaRepository.save(persona);		
		//creating user
		userService.saveUser(persona.getUser());
		//creating authorities
		authoritiesService.saveAuthorities(persona.getUser().getUsername(), "persona");
	}		

}
