package org.springframework.samples.petclinic.game;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.samples.petclinic.model.BaseEntity;
import org.springframework.samples.petclinic.player.Player;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "games")
public class Game  extends BaseEntity{
	
	@Column(unique = true,name = "name")
    @NotBlank
	@Size(min = 4, max = 15, message="El nombre de la partida tiene que tener entre 4 y 15 caracteres")
	private String name;

	@NotNull
	@Min(2)
	@Max(8)
	private Integer numPlayers;

	@Column(name = "start_game")
	private Boolean startGame;

	@ManyToMany
	private List<Player> playersList;
}