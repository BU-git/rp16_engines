
package com.bionic.domain.component;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="components")
@XmlRootElement
public class Component {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String eqart = "";
    private int equnr;
    private String herst = "";
    private String typbz = "";
    private String sernr;

    @XmlElement(name = "EQART")
    public String getEqart() {
        return eqart;
    }

    @XmlElement(name = "EQUNR")
    public int getEqunr() {
        return equnr;
    }

    @XmlElement(name = "HERST")
    public String getHerst() {
        return herst;
    }

    @XmlElement(name = "TYPBZ")
    public String getTypbz() {
        return typbz;
    }

    @XmlElement(name = "SERNR")
    public String getSernr() {
        return sernr;
    }

    public void setEqart(String eqart) {
        this.eqart = eqart;
    }

    public void setEqunr(int equnr) {
        this.equnr = equnr;
    }

    public void setHerst(String herst) {
        this.herst = herst;
    }

    public void setTypbz(String typbz) {
        this.typbz = typbz;
    }

    public void setSernr(String sernr) {
        this.sernr = sernr;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Component{" +
                "id=" + id +
                ", eqart='" + eqart + '\'' +
                ", equnr=" + equnr +
                ", herst='" + herst + '\'' +
                ", typbz='" + typbz + '\'' +
                ", sernr='" + sernr + '\'' +
                '}';
    }
}