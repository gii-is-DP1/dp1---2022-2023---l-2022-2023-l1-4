package org.springframework.samples.petclinic.partida;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

import org.springframework.samples.petclinic.model.BaseEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Partida  extends BaseEntity{
    
	@Column(name = "name")
    @NotBlank
	private String name;
}