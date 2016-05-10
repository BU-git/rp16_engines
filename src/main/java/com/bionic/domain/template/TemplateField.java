
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
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="templateFields")
public class TemplateField implements Serializable, Comparable<TemplateField> {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @JsonIgnore
    private int id;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Field.class, cascade = CascadeType.PERSIST)
    @JoinColumn(name = "field_id")
    private Field field;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonIgnore
    private TemplateEntity templateEntity;

    @Column(nullable = false, length = 1024)
    private String description;

    @Column(nullable = false)
    @JsonIgnore
    private Date createDt;

    @JsonIgnore
    private Date updateDt;

    @Column(length = 1024)
    private String value;



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
    public String toString() {
        return "******TemplateField {" +
                "id=" + id +
                ", field=" + field +
                ", templateEntity_id=" + templateEntity.getId() +
                ", templateEntity='"+ templateEntity+
                ", description='" + description + '\'' +
                ", createDt=" + createDt +
                ", updateDt=" + updateDt +
                ", value='" + value + '\'' +
                '}';
    }

    @Override
    public int compareTo(TemplateField o) {
        if(o == null) return -1;
        if(o.getId() == this.id) return 0;
        return this.id > o.getId() ? 1 : -1 ;
    }
}