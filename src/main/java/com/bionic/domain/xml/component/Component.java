
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Component {

    private String eqart = "";
    private int equnr;
    private String herst = "";
    private String typbz = "";
    private int sernr;

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
    public int getSernr() {
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

    public void setSernr(int sernr) {
        this.sernr = sernr;
    }
}