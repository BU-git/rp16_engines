package com.bionic.domain.template.web;

import java.util.List;

import com.bionic.domain.DataTablesAjaxHolder;

public class CustomTemplateHolder implements DataTablesAjaxHolder<CustomTemplateNameFront>{

    private List<CustomTemplateNameFront> data;

    @Override
    public List<CustomTemplateNameFront> getData() {
        return data;
    }

    @Override
    public void setData(List<CustomTemplateNameFront> data) {
        this.data = data;
    }
}
