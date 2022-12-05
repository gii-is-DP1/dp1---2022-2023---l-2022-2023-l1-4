package org.springframework.samples.petclinic.round;

import javax.persistence.Entity;

import org.springframework.samples.petclinic.model.BaseEntity;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Round extends BaseEntity{

    private Integer RoundPoints;

}
