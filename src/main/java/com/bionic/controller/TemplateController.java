
package com.bionic.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bionic.domain.template.TemplateField;
import com.bionic.domain.template.TemplateFieldList;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loggedInUser")
public class TemplateController {

    @RequestMapping(value = "/templates", method = RequestMethod.GET)
    public String templatesPage(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            //model.addAttribute("message", "You need to be logged!");
            return "redirect:login.html";
        }
        return "templates";
    }

    @RequestMapping(path = "/templates/save", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    public String receiveTemplate(@RequestBody TemplateFieldList fields){
        /*System.out.println("Template name: " + templateName);*/
        for(TemplateField f: fields.getFields()){
            System.out.println("Field type: " + f.getFieldType() + ", field description: " + f.getFieldValue());
        }
        return "ok";
    }
}