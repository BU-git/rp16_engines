package com.bionic.domain.component;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="info")
@XmlRootElement
public class Info {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String kindOfLine;
    private String prePost;
    private String sleutel; //key
    private String line;
    private String description;

   /* @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Order order;*/

    @XmlElement(name = "SoortRegel")
    public String getKindOfLine() {
        return kindOfLine;
    }
    @XmlElement(name = "PrePost")
    public String getPrePost() {
        return prePost;
    }

    @XmlElement(name = "Sleutel")
    public String getKey() {
        return sleutel;
    }
    @XmlElement(name = "Regel")
    public String getLine() {
        return line;
    }

    @XmlElement(name = "Omschrijving")
    public String getDescription() {
        return description;
    }

    public void setKindOfLine(String kindOfLine) {
        this.kindOfLine = kindOfLine;
    }

    public void setPrePost(String prePost) {
        this.prePost = prePost;
    }

    public void setKey(String key) {
        this.sleutel = key;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

   /* public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }*/

    @Override
    public String toString() {
        return "Info{" +
                "id=" + id +
                ", kindOfLine='" + kindOfLine + '\'' +
                ", prePost='" + prePost + '\'' +
                ", sleutel='" + sleutel + '\'' +
                ", line='" + line + '\'' +
                ", description='" + description + '\'' +
               // ", order=" + order +
                '}';
    }
}