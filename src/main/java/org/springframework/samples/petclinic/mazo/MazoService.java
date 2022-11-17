package org.springframework.samples.petclinic.mazo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MazoService {

    MazoRepository mazoRepository;

    @Autowired
	public MazoService(MazoRepository mazoRepository) {
		this.mazoRepository = mazoRepository;
    }

    
}
