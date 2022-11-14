package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.model.NamedEntity;


@Entity
@Table(name="minijuegos")
public class Minijuego extends NamedEntity{

    @ManyToMany
    @JoinTable(name="cartas_minijuego")
    private Collection<Carta> cartas;

    
}
