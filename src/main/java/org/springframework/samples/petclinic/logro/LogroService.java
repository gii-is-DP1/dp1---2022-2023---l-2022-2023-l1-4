package org.springframework.samples.petclinic.logro;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class LogroService {	
	
	private LogroRepository logroRepository;

	@Autowired
	public LogroService(LogroRepository logroRepository) {
		this.logroRepository = logroRepository;
	}

	@Transactional(readOnly = true)
	public List<Logro> getAllLogros() {
		return this.logroRepository.findAll();
	}

	@Transactional
	public void removeLogro(long id) {
		this.logroRepository.deleteById(id);
	}

	@Transactional(readOnly = true)
	public Logro getLogro(int id) {
		Optional<Logro> logro = this.logroRepository.findById((long) id);
		return logro.isPresent() ? logro.get() : null;
	}

	@Transactional
	public Logro save(Logro logro) {
		return this.logroRepository.save(logro);
	}
	
}
