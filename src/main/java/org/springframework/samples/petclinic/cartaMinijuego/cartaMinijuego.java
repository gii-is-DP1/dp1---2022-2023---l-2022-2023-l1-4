package org.springframework.samples.petclinic.cartaMinijuego;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.minijuego.Minijuego;
import org.springframework.samples.petclinic.model.BaseEntity;

@Entity
@Table (name = "cartaMinijuego")
public class cartaMinijuego extends BaseEntity{

    @OneToMany
    //@JoinColumn(name="cartas")
    private Collection<Carta> cartas;

    @OneToMany
    @JoinColumn(name="minijuego")
    private Collection<Minijuego> minijuegos;
}