
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Employee {

    private int number;
    private String name;
    private String email;

    @XmlAttribute(name = "nummer")
    public int getNumber() {
        return number;
    }

    @XmlElement(name = "Naam")
    public String getName() {
        return name;
    }
    @XmlElement(name = "Email")
    public String getEmail() {
        return email;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }
}
