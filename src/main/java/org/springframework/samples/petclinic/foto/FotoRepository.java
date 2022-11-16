package org.springframework.samples.petclinic.foto;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FotoRepository extends CrudRepository<Foto,Integer>{

    @Query("SELECT f.name FROM Foto f WHERE f.id =:id")
	public Foto findNameById(@Param("id") int id);
   
}
