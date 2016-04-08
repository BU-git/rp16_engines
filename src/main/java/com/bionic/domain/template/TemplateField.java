
package com.bionic.domain.template;

import java.io.Serializable;

public class TemplateField implements Serializable {

    public String fieldValue;
    public String fieldType;

    public String getFieldValue() {
        return fieldValue;
    }

    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }

    public String getFieldType() {
        return fieldType;
    }

    public void setFieldType(String fieldType) {
        this.fieldType = fieldType;
    }
}
