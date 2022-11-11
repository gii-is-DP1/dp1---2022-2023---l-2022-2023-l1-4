package org.springframework.samples.petclinic.minijuego;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.samples.petclinic.cartaMinijuego.cartaMinijuego;
import org.springframework.samples.petclinic.model.BaseEntity;


@Entity
@Table(name="minijuego")
public class Minijuego extends BaseEntity{
    private TipoMinijuego tipoMinijuego = TipoMinijuego.La_torre_infernal;

    @ManyToOne
    @JoinColumn(name="cartaMinijuego")
    private cartaMinijuego cartaminijuego;
}
