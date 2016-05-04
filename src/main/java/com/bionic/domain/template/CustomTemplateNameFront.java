
package com.bionic.domain.template;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomTemplateNameFront {

    @JsonProperty("#")
    private int position;
    private String name;
    private String action;

    public int getPosition() {
        return position;
    }

    public String getAction() {
        return action;
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

    public void setAction(String action) {
        this.action = action;
    }
}