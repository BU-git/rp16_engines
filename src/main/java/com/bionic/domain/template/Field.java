
package com.bionic.domain.template;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="fields")
public class Field {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @JsonIgnore
    private long id;

    private String type;

    public long getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setType(String type) {
        this.type = type;
    }
}