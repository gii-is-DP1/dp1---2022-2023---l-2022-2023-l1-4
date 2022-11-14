package org.springframework.samples.petclinic.mazo;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.springframework.samples.petclinic.carta.Carta;
import org.springframework.samples.petclinic.model.BaseEntity;

@Entity
public class Mazo extends BaseEntity{

    @OneToMany
    Collection<Carta> cartas;

}
