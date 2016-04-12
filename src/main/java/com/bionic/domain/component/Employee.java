
package com.bionic.domain.component;

import com.bionic.domain.Order;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
public class Employee {

    private int number;
    private String name;

    @Id
    private String email;

    @OneToOne
    private Order order;

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
