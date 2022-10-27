package org.springframework.samples.petclinic.logro;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

import org.springframework.samples.petclinic.model.BaseEntity;

@Entity
public class Logro extends BaseEntity{

	@NotBlank
    @Column(unique = true)
	private String nombre;

    @NotBlank
	private Integer nivel;
}
