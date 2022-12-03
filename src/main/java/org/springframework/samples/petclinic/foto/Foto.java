package org.springframework.samples.petclinic.foto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.samples.petclinic.model.NamedEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "fotos")
@Getter
@Setter

public class Foto extends NamedEntity{

    @Column(name = "colour_code")
    private String colourCode;

}
