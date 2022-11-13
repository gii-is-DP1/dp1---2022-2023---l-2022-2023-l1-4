package org.springframework.samples.petclinic.game;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.samples.petclinic.model.BaseEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "games")
public class Game  extends BaseEntity{
	
	@Column(unique = true,name = "name")
    @NotBlank
	private String name;
}