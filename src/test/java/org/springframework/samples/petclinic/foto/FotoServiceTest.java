package org.springframework.samples.petclinic.foto;

import static org.assertj.core.api.Assertions.assertThat;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
public class FotoServiceTest {

    @Autowired
    protected FotoService fotoService;

    @Test
    @Transactional
    public void shouldGetFotoById() {     

        assertThat(fotoService.getFotoById(1).getName()).isEqualTo("Prohibido");
    }
}
