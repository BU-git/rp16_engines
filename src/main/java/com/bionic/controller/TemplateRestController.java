
package com.bionic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bionic.domain.template.TemplateField;
import com.bionic.service.TemplateService;

@RestController
public class TemplateRestController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/templates/get/{number}",
            method = {RequestMethod.GET, RequestMethod.POST},
            produces = "application/json")
    public List<TemplateField> getAllTemplates(@PathVariable("number") int id){
        return templateService.findByTemplateId(id);
    }
}