
package com.bionic.domain.template;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="templates")
public class TemplateEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String templateName;

    public String getTemplateName() {
        return templateName;
    }

    public int getId() {
        return id;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public void setId(int id) {
        this.id = id;
    }
}