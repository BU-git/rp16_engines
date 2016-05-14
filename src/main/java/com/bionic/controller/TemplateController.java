
package com.bionic.controller;

import java.util.List;

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

import com.bionic.domain.DataTablesAjaxHolder;
import com.bionic.domain.template.web.CustomTemplateHolder;
import com.bionic.domain.template.web.CustomTemplateNameFront;
import com.bionic.domain.template.web.CustomTemplateFieldList;
import com.bionic.service.TemplateService;

@Controller
@SessionAttributes("loggedInUser")
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "/templates/new", method = RequestMethod.GET)
    public String templatesPage(ModelMap model){
        return !model.containsAttribute("loggedInUser") ? "redirect:/login" : "/templates";
    }

    @RequestMapping(path = "/templates/save", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> receiveTemplate(@RequestBody CustomTemplateFieldList fields, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        try {
            templateService.save(fields.getTemplateName(), fields.getFields(), true);
        }catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Template with this name already exist");
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(path = "/templates", method = RequestMethod.GET)
    public String getListOfAllTemplates(ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        return "/templateOverview";
    }

    @RequestMapping(path = "/templates", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DataTablesAjaxHolder> getListOfAllTemplatesForDataTables(ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        CustomTemplateHolder holder = new CustomTemplateHolder();
        List<CustomTemplateNameFront> list = templateService.findUniqueTemplateNames();
        holder.setData(list);
        return ResponseEntity.ok(holder);
    }

    @RequestMapping(value = "/templates/remove/{name}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteTemplateByName(ModelMap model, @PathVariable("name") String name){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        try {
            templateService.removeTemplateByName(name);
        }catch(Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("oops");
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(value = "/templates/get/{name}", method = RequestMethod.GET)
    public String getSingleTemplateOverview(ModelMap model, @PathVariable("name") String name){
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        model.addAttribute("list", templateService.findFieldsByTemplateName(name));
        return "singleTemplate";
    }
}