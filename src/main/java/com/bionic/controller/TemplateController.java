
package com.bionic.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bionic.domain.template.TemplateField;
import com.bionic.domain.template.TemplateFieldList;

@Controller
public class TemplateController {

    @RequestMapping(value = "/templates", method = RequestMethod.GET)
    public String makeTemplate(){
        return "templates";
    }

    @RequestMapping(path = "/templates/save", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    public String receiveTemplate(@RequestBody TemplateFieldList fields){
        for(TemplateField f: fields.getFields()){
            System.out.println("template name: "+fields.getTemplateName() + ", Field type: " + f.getFieldType() + ", field description: " + f.getFieldValue());
        }
        return "ok";
    }
}