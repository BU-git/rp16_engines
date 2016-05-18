
package com.bionic.domain.template;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="templateFields")
public class TemplateField implements Serializable, Comparable<TemplateField> {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @JsonIgnore
    private int id;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Field.class, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "field_id")
    @JsonIgnore
    private Field field;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonIgnore
    private TemplateEntity templateEntity;

    @Column(nullable = false, length = 1024)
    @JsonProperty("elementText")
    private String description;

    @Column(nullable = false)
    @JsonIgnore
    private Date createDt;

    @JsonIgnore
    private Date updateDt;

    @Column(length = 1024)
    @JsonProperty("elementValue")
    private String value;

    @Transient
    @JsonProperty("elementType")
    public long getElementType() {
        return field.getId();
    }

    public int getId() {
        return id;
    }

    public Field getField() {
        return field;
    }

    public String getValue() {
        return value;
    }

    public Date getCreateDt() {
        return createDt;
    }

    public Date getUpdateDt() {
        return updateDt;
    }

    public TemplateEntity getTemplateEntity() {
        return templateEntity;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setField(Field field) {
        this.field = field;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }

    public void setUpdateDt(Date updateDt) {
        this.updateDt = updateDt;
    }

    public void setTemplateEntity(TemplateEntity templateEntity) {
        this.templateEntity = templateEntity;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int compareTo(TemplateField  o) {
        if(o == null) return 1;
        if(o.getId() == this.id) return 0;
        return this.id > o.getId() ? 1 : -1 ;
    }
}