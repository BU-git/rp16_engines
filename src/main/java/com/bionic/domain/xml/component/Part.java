
package com.bionic.domain.xml.component;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public final class Part {

    private int bdmng;
    private String matnr;
    private String mattx;

    @XmlElement(name = "BDMNG")
    public int getBdmng() {
        return bdmng;
    }

    @XmlElement(name = "MATNR")
    public String getMatnr() {
        return matnr;
    }

    @XmlElement(name = "MATTX")
    public String getMattx() {
        return mattx;
    }

    public void setBdmng(int bdmng) {
        this.bdmng = bdmng;
    }

    public void setMatnr(String matnr) {
        this.matnr = matnr;
    }

    public void setMattx(String mattx) {
        this.mattx = mattx;
    }
}