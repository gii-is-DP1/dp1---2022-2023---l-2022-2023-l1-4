package org.springframework.samples.petclinic.logro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogroService {	
	
	private LogroRepository logroRepository;

	@Autowired
	public LogroService(LogroRepository logroRepository){
		this.logroRepository=logroRepository;
	}

	public List<Logro> getAllLogros(){
		return this.logroRepository.findAll();
	}
	
}
