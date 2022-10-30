package org.springframework.samples.petclinic.logro;

import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import org.springframework.samples.petclinic.model.NamedEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Logro extends NamedEntity{

    @NotBlank
	@Min(0)
	private Integer nivel;

}
