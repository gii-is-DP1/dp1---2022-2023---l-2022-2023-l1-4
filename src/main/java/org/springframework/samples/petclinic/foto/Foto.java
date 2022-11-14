package org.springframework.samples.petclinic.foto;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.samples.petclinic.model.NamedEntity;

@Entity
@Table(name = "fotos")
public class Foto extends NamedEntity{

    
}
