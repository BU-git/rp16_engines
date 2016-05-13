
package com.bionic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bionic.domain.template.android.CustomTemplateAndroid;
import com.bionic.domain.template.android.CustomTemplateElementAndroid;
import com.bionic.domain.template.TemplateField;
import com.bionic.service.TemplateService;

@RestController
public class TemplateRestController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value = "get/template/{number}",
            method = {RequestMethod.GET, RequestMethod.POST},
            produces = "application/json")
    public CustomTemplateAndroid getAllTemplates(@PathVariable("number") int id){
        return getCustomTemplate(templateService.findByTemplateId(id));
    }

    private CustomTemplateAndroid getCustomTemplate(List<TemplateField> list){
        List<CustomTemplateElementAndroid> elementAndroidList = new ArrayList<>();
        for(TemplateField tf: list){
            CustomTemplateElementAndroid elementAndroid = new CustomTemplateElementAndroid();
            elementAndroid.setElementText(tf.getDescription());
            elementAndroid.setElementType(tf.getField().getId());
            elementAndroidList.add(elementAndroid);
        }
        CustomTemplateAndroid customTemplate = new CustomTemplateAndroid();
        customTemplate.setCustomTemplateElements(elementAndroidList);
        customTemplate.setCustomTemplateID(list.get(0).getTemplateEntity().getId());
        customTemplate.setCustomTemplateName(list.get(0).getTemplateEntity().getTemplateName());
        return customTemplate;
    }
}