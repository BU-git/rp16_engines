
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="templateFields")
public class TemplateField implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @JsonIgnore
    private int id;

    @OneToOne(fetch = FetchType.EAGER, targetEntity = Field.class, cascade = CascadeType.PERSIST)
    private Field field;

    @OneToOne(fetch = FetchType.EAGER, targetEntity = TemplateEntity.class, cascade = CascadeType.PERSIST)
    @JsonIgnore
    private TemplateEntity templateEntity;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    @JsonIgnore
    private Date createDt;

    @JsonIgnore
    private Date updateDt;

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
}