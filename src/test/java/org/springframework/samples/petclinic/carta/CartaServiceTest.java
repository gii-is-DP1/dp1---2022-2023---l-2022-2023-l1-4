package org.springframework.samples.petclinic.carta;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.foto.Foto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class CartaServiceTest {

    @Autowired
    protected CartaService cartaService;

    @Test
    @Transactional
    public void shouldGetAllCartas() {
        Collection<Carta> cartas = this.cartaService.getAll();
        assertThat(cartas.size()).isEqualTo(55);
    }
    @Test
    @Transactional
    public void shouldGetCartaById() {
        Carta carta = this.cartaService.getCardById(1);
        assertThat(carta.getId()).isEqualTo(1);
    }
    @Test
    @Transactional
    public void shouldFindPhotosByCartaId() {
        Integer cartaId = 1;
        assertThat(cartaService.findNamePhotosByCard(cartaId));
    }

    @Test
    @Transactional
    public void shouldFindCartaUrlById() {
       Integer cartaId = 1;
        assertThat(cartaService.findCardUrl(cartaId));
    }

}
