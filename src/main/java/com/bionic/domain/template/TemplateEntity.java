
package com.bionic.domain.template;

import java.util.Collections;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="templates")
public class TemplateEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @JsonProperty("customTemplateID")
    private long id;

    @Column(nullable = false)
    @JsonProperty("customTemplateName")
    private String templateName;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "templateEntity", fetch = FetchType.EAGER)
    @JsonProperty("customTemplateElements")
    private List<TemplateField> fields;

    @JsonIgnore
    private boolean assigned;

    public boolean isAssigned() {
        return assigned;
    }

    public void setAssigned(boolean assigned) {
        this.assigned = assigned;
    }

    public String getTemplateName() {
        return templateName;
    }

    public long getId() {
        return id;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<TemplateField> getFields() {
        Collections.sort(fields);
        return fields;
    }

    public void setFields(List<TemplateField> fields) {
        this.fields = fields;
    }
}