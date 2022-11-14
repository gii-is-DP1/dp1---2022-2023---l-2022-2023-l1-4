package org.springframework.samples.petclinic.minijuego;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.samples.petclinic.model.NamedEntity;

@Entity
@Table(name="tipos_minijuego")
public class TipoMinijuego extends NamedEntity{

}
