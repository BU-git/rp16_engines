
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Info {

    private String kindOfLine;
    private String prePost;
    private String key;
    private String line;
    private String description;

    @XmlElement(name = "SoortRegel")
    public String getKindOfLine() {
        return kindOfLine;
    }
    @XmlElement(name = "PrePost")
    public String getPrePost() {
        return prePost;
    }

    @XmlElement(name = "Sleutel")
    public String getKey() {
        return key;
    }
    @XmlElement(name = "Regel")
    public String getLine() {
        return line;
    }

    @XmlElement(name = "Omschrijving")
    public String getDescription() {
        return description;
    }

    public void setKindOfLine(String kindOfLine) {
        this.kindOfLine = kindOfLine;
    }

    public void setPrePost(String prePost) {
        this.prePost = prePost;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}