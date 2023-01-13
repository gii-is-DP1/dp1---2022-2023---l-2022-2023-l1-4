package org.springframework.samples.petclinic.foto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FotoService {
    FotoRepository fotoRepository;

    @Autowired
    public FotoService(FotoRepository fotoRepository) {
		this.fotoRepository = fotoRepository;
	}

    @Transactional(readOnly = true)
    public Foto getNameFotoById(int id) throws DataAccessException{
        return fotoRepository.findNameById(id);
    }
    @Transactional(readOnly = true)
    public Foto getFotoById(int id) throws DataAccessException{
        return fotoRepository.findFotoById(id);
    }

    @Transactional
	public void saveFoto(Foto foto) throws DataAccessException {
		fotoRepository.save(foto);
	}
}
