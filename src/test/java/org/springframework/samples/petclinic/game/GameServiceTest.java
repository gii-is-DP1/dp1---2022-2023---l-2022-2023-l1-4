package org.springframework.samples.petclinic.game;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Collection;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.samples.petclinic.user.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@DataJpaTest(includeFilters = @ComponentScan.Filter(Service.class))
class GameServiceTests {
        private static final Boolean TRUE = null;
        @Autowired
    protected GameService gameService;

    @Test
    void shouldFindGamesByLastName() {
        Collection<Game> games = this.gameService.findGameByName("caca");
        assertThat(games.size()).isEqualTo(1);

        games = this.gameService.findGameByName("Daviss");
        assertThat(games.isEmpty()).isTrue();
    }



    @Test
    @Transactional
    public void shouldInsertGame() {
        Collection<Game> games = this.gameService.findGameByName("cacatua");
        int found = games.size();

        Game game = new Game();
        game.setName("cacatua");
        game.setNumPlayers(2);
        game.setStartGame(TRUE);

        this.gameService.save(game);
        assertThat(game.getId().longValue()).isNotEqualTo(0);

        games = this.gameService.findGameByName("cacatua");
        assertThat(games.size()).isEqualTo(found + 1);
    }


}