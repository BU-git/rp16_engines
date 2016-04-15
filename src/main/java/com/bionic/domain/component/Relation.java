
package com.bionic.domain.component;

import com.bionic.domain.Order;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
public class Relation {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String name;
    private String town;
    private String contactPerson;
    private String telephone;
    private int number;

    @OneToOne
    private Order order;

    @XmlAttribute(name = "nummer")
    public int getNumber() {
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
    @XmlElement(name = "Telephone", defaultValue = "")
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

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", town='" + town + '\'' +
                ", contactPerson='" + contactPerson + '\'' +
                ", telephone='" + telephone + '\'' +
                ", number=" + number +
                ", order=" + order +
                '}';
    }
}