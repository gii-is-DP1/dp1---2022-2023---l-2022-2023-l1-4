package org.springframework.samples.petclinic.logro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logros")
public class LogroController {
    private static final String LOGRO_LISTING="logros/LogrosListing";
    private LogroService logroService;

    @Autowired
    public LogroController(LogroService logroService){
        this.logroService=logroService;
    }

    @GetMapping
    public String listAllLogros(ModelMap model){
        List<Logro> allLogros = this.logroService.getAllLogros();
        model.put("logros", allLogros);
        return LOGRO_LISTING;
    }
    
}
