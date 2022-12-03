package org.springframework.samples.petclinic.minijuego;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.samples.petclinic.game.Game;
import org.springframework.samples.petclinic.model.NamedEntity;


@Entity
@Table(name="minijuegos")
public class Minijuego extends NamedEntity{
    
    @ManyToOne
	@JoinColumn(name = "game_id")
	private Game game;

    @ManyToOne
	@JoinColumn(name = "tipos_minijuegos_name")
	TipoMinijuego tipoMiniJuego;
}
