
package com.bionic.domain.template;

import java.util.List;

public class TemplateFieldList {

    private String templateName;

    private List<FieldHolder> fields;

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public List<FieldHolder> getFields() {
        return fields;
    }

    public void setFields(List<FieldHolder> fields) {
        this.fields = fields;
    }

}