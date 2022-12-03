package org.springframework.samples.petclinic.instructions;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InstructionController {
    
    private static final String VIEWS_INSTRUCTIONS = "instructions";
   
    @GetMapping(value = "/instructions")
	public String initInstruction(Map<String, Object> model) {
		return VIEWS_INSTRUCTIONS;
	}
}