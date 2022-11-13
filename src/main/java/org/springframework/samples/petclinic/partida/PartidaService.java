package org.springframework.samples.petclinic.partida;

import java.util.Collection;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PartidaService {
    
    private PartidaRepository partidaRepository;

    @Autowired
    public PartidaService(PartidaRepository partidaRepository){
        this.partidaRepository= partidaRepository;
    }

    @Transactional
    public List<Partida> getAllPartidas(){
        return partidaRepository.findAll();
    }
    @Transactional
    public Partida save(Partida p){
        return partidaRepository.save(p);
    }

    @Transactional(readOnly = true)
	public Partida encontrarPartidaPorId(int id) throws DataAccessException {
		return partidaRepository.findById(id);
	}

    @Transactional(readOnly = true)
	public Collection<Partida> encuentraPartidaPorNombre(String name) throws DataAccessException {
		return partidaRepository.encuentraPorNombre(name);
	}

  
 
}
