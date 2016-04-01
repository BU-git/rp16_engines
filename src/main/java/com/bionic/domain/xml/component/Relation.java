
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Relation {

    private String name;
    private String town;
    private String contactPerson;
    private String telephone;
    private String number;

    @XmlAttribute(name = "nummer")
    public String getNumber() {
        return number;
    }

    @XmlElement(name="Plaats")
    public String getTown() {
        return town;
    }
    @XmlElement(name = "Naam")
    public String getName() {
        return name;
    }
    @XmlElement(name = "ContactPerson")
    public String getContactPerson() {
        return contactPerson;
    }
    @XmlElement(name = "Telephone")
    public String getTelephone() {
        return telephone;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}