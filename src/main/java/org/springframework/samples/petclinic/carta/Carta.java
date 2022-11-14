package org.springframework.samples.petclinic.carta;


import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.samples.petclinic.foto.Foto;

import org.springframework.samples.petclinic.model.BaseEntity;


@Entity
@Table(name = "cartas")
public class Carta extends BaseEntity {

    @NotBlank
    @Column(name="url")
    private String url;
    
    @ManyToMany
    @JoinTable(name = "cartas_fotos")
    private Collection<Foto> foto;



}
