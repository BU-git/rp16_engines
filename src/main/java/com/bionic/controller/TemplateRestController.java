
package com.bionic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.service.TemplateService;

@RestController
public class TemplateRestController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/templates/get", method = RequestMethod.POST,
            produces = "application/json")
    public TemplateEntity getAllTemplates(@RequestParam("number") long id){
        return templateService.findByTemplateId(id);
    }
}