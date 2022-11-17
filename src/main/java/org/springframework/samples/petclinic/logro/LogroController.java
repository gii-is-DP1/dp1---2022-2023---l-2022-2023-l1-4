package org.springframework.samples.petclinic.logro;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/logros")
public class LogroController {
    private static final String LOGRO_LISTING="logros/LogrosListing";
    private static final String LOGRO_EDIT="logros/EditLogro";

    @Autowired
    LogroService logroService;
    
     @GetMapping
     public ModelAndView showLogrosListing() {
         ModelAndView result=new ModelAndView(LOGRO_LISTING);
         result.addObject("logros",logroService.getAllLogros());
         return result;
     }
     
     @GetMapping("/delete/{id}")
     public ModelAndView deleteRoom(@PathVariable("id") int id) {
         logroService.removeLogro(id);
         ModelAndView result=showLogrosListing();
         result.addObject("message", "Room removed successfully");
         return result;
     }
     
     
     @GetMapping("/edit/{id}")
     public ModelAndView editRoom(@PathVariable("id") int id) {
         ModelAndView result=new ModelAndView(LOGRO_EDIT);
         Logro logro=logroService.getLogro(id);
         if(logro!=null)
             result.addObject("logro", logro);
         else
             result=showLogrosListing();                          
         return result;
     }
     
     @PostMapping("/edit/{id}")
     public ModelAndView editRoom(@PathVariable("id") int id, @Valid Logro logro,BindingResult br) {        
         ModelAndView result=null;
         if(br.hasErrors()) {
             result=new ModelAndView(LOGRO_EDIT);
             result.addAllObjects(br.getModel());         
         }else {
             Logro logroToUpdate=logroService.getLogro(id);
             
             if(logroToUpdate!=null) {
                 BeanUtils.copyProperties(logro, logroToUpdate,"id");                 
                 logroService.save(logroToUpdate);
                 result=showLogrosListing();
                 result.addObject("message", "Logro saved succesfully!");
             }else {
                 result=showLogrosListing();             
                 result.addObject("message", "Logro with id "+id+" not found!");
             }
         }                                                
         return result;
     }
     
     @GetMapping("/create")
     public ModelAndView createRoom() {
         ModelAndView result=new ModelAndView(LOGRO_EDIT);
         Logro logro=new Logro();         
         result.addObject("logro", logro);                                  
         return result;
     }
     
     
     @PostMapping("/create")
     public ModelAndView saveNewRoom(@Valid Logro logro,BindingResult br) {        
         ModelAndView result=null;
         if(br.hasErrors()) {
             result=new ModelAndView(LOGRO_EDIT);
             result.addAllObjects(br.getModel());         
         }else {                          
             logroService.save(logro);
             result=showLogrosListing();
             result.addObject("message", "Logro saved succesfully!");             
         }                                                
         return result;
     }
     
     
}
