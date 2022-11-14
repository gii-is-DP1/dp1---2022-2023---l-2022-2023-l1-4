package org.springframework.samples.petclinic.minijuego;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MinijuegoService {
    MinijuegoRepository minijuegoRepository;

    @Autowired
    public MinijuegoService(MinijuegoRepository minijuegoRepository) {
		this.minijuegoRepository = minijuegoRepository;
	}

    @Transactional(readOnly = true)	
	public Collection<Minijuego> findMinijuegos() {
		return minijuegoRepository.findAll();
	}	

    @Transactional(readOnly = true)
	public Minijuego findMinijuegoByName(String name) {
		return minijuegoRepository.findMinijuegoByName(name);
	}
}
