
package com.bionic.domain.template;

import java.util.List;

public class TemplateFieldList {

    private List<TemplateField> fields;
    private String templateName;

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public List<TemplateField> getFields() {
        return fields;
    }



    public void setFields(List<TemplateField> fields) {
        this.fields = fields;
    }
}
