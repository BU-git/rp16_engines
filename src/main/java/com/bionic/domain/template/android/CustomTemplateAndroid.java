package com.bionic.domain.template.android;

import java.util.List;

public class CustomTemplateAndroid {

    private long customTemplateID;
    private String customTemplateName;
    private List<CustomTemplateElementAndroid> customTemplateElements;

    public long getCustomTemplateID() {
        return customTemplateID;
    }

    public void setCustomTemplateID(long customTemplateID) {
        this.customTemplateID = customTemplateID;
    }

    public String getCustomTemplateName() {
        return customTemplateName;
    }

    public void setCustomTemplateName(String customTemplateName) {
        this.customTemplateName = customTemplateName;
    }

    public List<CustomTemplateElementAndroid> getCustomTemplateElements() {
        return customTemplateElements;
    }

    public void setCustomTemplateElements(List<CustomTemplateElementAndroid> customTemplateElements) {
        this.customTemplateElements = customTemplateElements;
    }
}