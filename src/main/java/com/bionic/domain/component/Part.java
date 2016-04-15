
package com.bionic.domain.component;

import com.bionic.domain.Order;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
public class Part {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String bdmng;
    private String matnr;
    private String mattx;

    @ManyToOne
    private Order order;

    @XmlElement(name = "BDMNG")
    public String getBdmng() {
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

    public void setBdmng(String bdmng) {
        this.bdmng = bdmng;
    }

    public void setMatnr(String matnr) {
        this.matnr = matnr;
    }

    public void setMattx(String mattx) {
        this.mattx = mattx;
    }

    @Override
    public String toString() {
        return "Part{" +
                "id=" + id +
                ", bdmng='" + bdmng + '\'' +
                ", matnr='" + matnr + '\'' +
                ", mattx='" + mattx + '\'' +
                ", order=" + order +
                '}';
    }
}