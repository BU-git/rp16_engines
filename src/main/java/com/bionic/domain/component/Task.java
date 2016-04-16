
package com.bionic.domain.component;

import com.bionic.domain.Order;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="task")
@XmlRootElement
public class Task {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String vornr;
    private String ltxa1;
    private String steus;
    private String ktsch;

    @ManyToOne
    private Order order;

    @XmlElement(name = "VORNR")
    public String getVornr() {
        return vornr;
    }

    @XmlElement(name = "LTXA1")
    public String getLtxa1() {
        return ltxa1;
    }

    @XmlElement(name = "STEUS")
    public String getSteus() {
        return steus;
    }

    @XmlElement(name = "KTSCH")
    public String getKtsch() {
        return ktsch;
    }

    public void setVornr(String vornr) {
        this.vornr = vornr;
    }

    public void setLtxa1(String ltxa1) {
        this.ltxa1 = ltxa1;
    }

    public void setSteus(String steus) {
        this.steus = steus;
    }

    public void setKtsch(String ktsch) {
        this.ktsch = ktsch;
    }

    @Override
    public String toString() {
        return "Task{" +
                "vornr='" + vornr + '\'' +
                ", ltxa1='" + ltxa1 + '\'' +
                ", steus='" + steus + '\'' +
                ", ktsch='" + ktsch + '\'' +
                ", order=" + order +
                '}';
    }
}