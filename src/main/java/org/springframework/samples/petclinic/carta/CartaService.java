package org.springframework.samples.petclinic.carta;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.samples.petclinic.foto.Foto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartaService {
    CartaRepository cartaRepository;

    @Autowired
    public CartaService(CartaRepository cartaRepository) {
		this.cartaRepository = cartaRepository;
	}

    @Transactional(readOnly = true)
    public Collection<Carta> getAll() throws DataAccessException{
        return cartaRepository.findAll();
    }
    
    @Transactional(readOnly = true)
	public Carta getCardById(int id) throws DataAccessException {
		return cartaRepository.findCardById(id);
	}

    @Transactional(readOnly = true)
	public Collection<Foto> findNamePhotosByCard(int id) throws DataAccessException {
		return cartaRepository.findNamePhotosByCard(id);
	}

    @Transactional(readOnly = true)
	public String findCardUrl(int id) throws DataAccessException {
		return cartaRepository.findCardUrl(id);
	} 
 
}
