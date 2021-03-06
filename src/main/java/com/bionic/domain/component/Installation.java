
package com.bionic.domain.component;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="installations")
@XmlRootElement
public class Installation {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String name;
    private String address;
    private String postCode;
    private String town;

/*    @OneToOne
    private Order order;*/

    @XmlElement(name = "Naam")
    public String getName() {
        return name;
    }
    @XmlElement(name = "Adres")
    public String getAddress() {
        return address;
    }

    @XmlElement(name = "PostCode")
    public String getPostCode() {
        return postCode;
    }

    @XmlElement(name = "Plaats")
    public String getTown() {
        return town;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public void setTown(String town) {
        this.town = town;
    }

    @Override
    public String toString() {
        return "Installation{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", postCode='" + postCode + '\'' +
                ", town='" + town + '\'' +
               // ", order=" + order +
                '}';
    }
}
