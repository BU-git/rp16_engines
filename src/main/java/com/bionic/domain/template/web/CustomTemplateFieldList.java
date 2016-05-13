
package com.bionic.domain.template.web;

import java.util.List;

public class CustomTemplateFieldList {

    private String templateName;

    private List<CustomTemplateFieldHolder> fields;

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public List<CustomTemplateFieldHolder> getFields() {
        return fields;
    }

    public void setFields(List<CustomTemplateFieldHolder> fields) {
        this.fields = fields;
    }

}