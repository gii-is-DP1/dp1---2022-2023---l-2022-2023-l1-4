package org.springframework.samples.petclinic.minijuego;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.samples.petclinic.game.Game;
import org.springframework.samples.petclinic.model.NamedEntity;
import org.springframework.samples.petclinic.player.Player;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="minijuegos")
public class Minijuego extends NamedEntity{

	@OneToOne
	private Player ganador;

	@OneToOne
	private Player perdedor;

	private Integer numRounds;

    @ManyToOne
	@JoinColumn(name = "game_id")
	private Game game;

    
}
