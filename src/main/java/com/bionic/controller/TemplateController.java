
package com.bionic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.template.CustomTemplateHolder;
import com.bionic.domain.template.TemplateFieldList;
import com.bionic.service.TemplateService;

@Controller
@SessionAttributes("loggedInUser")
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/templates", method = RequestMethod.GET)
    public String templatesPage(ModelMap model){
        return !model.containsAttribute("loggedInUser") ? "redirect:/login" : "templates";
    }

    @RequestMapping(path = "/templates/save", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> receiveTemplate(@RequestBody TemplateFieldList fields, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        try {
            templateService.save(fields.getTemplateName(), fields.getFields(), true);
        }catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Template with this name already exist");
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(path = "templates/overview")
    public String getListOfAllTemplates(ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        model.addAttribute("templates", templateService.findAll());
        return "templateOverview";
    }

    @RequestMapping(path = "templates/all"/*, consumes = MediaType.APPLICATION_JSON_VALUE*/)
    @ResponseBody
    public ResponseEntity<CustomTemplateHolder> getListOfAllTemplatesForDataTables(ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        CustomTemplateHolder holder = new CustomTemplateHolder();
        holder.setData(templateService.findAllForDataTables());
        return ResponseEntity.ok(holder);
    }

    @RequestMapping(value = "templates/remove/{name}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteTemplateByName(ModelMap model, @PathVariable("name") String name){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        templateService.removeTemplateByName(name);
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(value = "templates/overview/{name}", method = RequestMethod.GET)
    public String getSingleTemplateOverview(ModelMap model, @PathVariable("name") String name){
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        model.addAttribute("list", templateService.findByTemplateName(name));
        return "singleTemplate";
    }
}