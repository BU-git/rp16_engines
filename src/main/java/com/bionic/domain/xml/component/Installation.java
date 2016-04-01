
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Installation {

    private String name;
    private String address;
    private String postCode;
    private String town;

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
}
