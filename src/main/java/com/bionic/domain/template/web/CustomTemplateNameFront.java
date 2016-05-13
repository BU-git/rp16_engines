
package com.bionic.domain.template.web;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomTemplateNameFront {

    @JsonProperty("#")
    private int position;
    @JsonProperty("Name")
    private String name;

    public int getPosition() {
        return position;
    }

    public String getName() {
        return name;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public void setName(String name) {
        this.name = name;
    }

}