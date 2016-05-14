
package com.bionic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.service.TemplateService;

@RestController
public class TemplateRestController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/templates/get/{number}", method = RequestMethod.POST,
            produces = "application/json")
    public TemplateEntity getAllTemplates(@PathVariable("number") long id){
        return templateService.findByTemplateId(id);
    }
}