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

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

/**
 * Spring Data JPA OwnerRepository interface
 *
 * @author Michael Isvy
 * @since 15.1.2013
 */

public interface PersonaRepository extends Repository<Persona, Integer> {

	/**
	 * Save an <code>Owner</code> to the data store, either inserting or updating it.
	 * @param persona the <code>Owner</code> to save
	 * @see BaseEntity#isNew
	 */
	void save(Persona persona) throws DataAccessException;

	/**
	 * Retrieve <code>Owner</code>s from the data store by last name, returning all owners
	 * whose last name <i>starts</i> with the given name.
	 * @param apellido Value to search for
	 * @return a <code>Collection</code> of matching <code>Owner</code>s (or an empty
	 * <code>Collection</code> if none found)
	 */	

	@Query("SELECT DISTINCT persona FROM Persona persona WHERE persona.lastName =:lastName")
	public Collection<Persona> encuentraPorApellido(@Param("lastName") String lastName);

	@Query("SELECT DISTINCT persona FROM Persona persona WHERE persona.firstName =:firstName")
	public Collection<Persona> encuentraPorNombre(@Param("firstName") String firstName);

	/**
 	 * Retrieve an <code>Owner</code> from the data store by id.
	 * @param id the id to search for
	 * @return the <code>Owner</code> if found
	 * @throws org.springframework.dao.DataRetrievalFailureException if not found
	 */	
	@Query("SELECT persona FROM Persona persona WHERE persona.id =:id")
	public Persona findById(@Param("id") int id);
}
