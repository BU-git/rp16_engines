package com.bionic.domain;

import java.sql.Blob;
import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import com.bionic.domain.component.Component;
import com.bionic.domain.component.Employee;
import com.bionic.domain.component.Info;
import com.bionic.domain.component.Installation;
import com.bionic.domain.component.Part;
import com.bionic.domain.component.Relation;
import com.bionic.domain.component.Task;
import org.hibernate.annotations.*;

@Entity
@Table(name = "ORDERS")
@XmlRootElement(name = "Order")
public class Order {

    @Id
    private long number;
    private String orderType;
    private Date date;
    private String reference;
    private String note;

    @OneToOne(cascade = CascadeType.ALL)
    private Relation relation;

    @OneToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private Employee employee;

    @OneToOne(cascade = CascadeType.ALL)
    private Installation installation;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SUBSELECT)
    private List<Task> tasks;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SUBSELECT)
    private List<Component> components;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SUBSELECT)
    private List<Part> parts;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SUBSELECT)
    private List<Info> extraInfo;

    // Service fields

    /**
     * This is time when this order was imported to BO Server.
     * After import it never changed.
     * NotNull
     */
    private Timestamp importTimestamp;

    /**
     * This is time when this order was changed in BO Server.
     * If order changed in BO this field has to be updated.
     * This field will be used by Android App to check if order has to be updated from server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * This field will NOT changed in Android App.
     * NotNull
     */
    private Timestamp lastServerChangeTimestamp;

    /**
     * This is time when this order was changed in Android.
     * If order changed in Android App this field has to be updated.
     * This field will be used by Android App to check if order need to be updated to server.
     * This field will NOT changed in BO Server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * NotNull
     */
    private Timestamp lastAndroidChangeTimestamp;

    /**
     * boolean flag is needed for showing a red cross or a green check mark. true - if order is done.
     */
    private boolean done;

    /*@Lob
    private Blob pdf;*/


    @XmlElementWrapper(name = "ExtraInfo")
    @XmlElement(name = "Info", type = Info.class)
    public List<Info> getExtraInfo() {
        return extraInfo;
    }

    @XmlElement(name = "Notitie")
    public String getNote() {
        return note;
    }

    @XmlElementWrapper(name = "Onderdelen")
    @XmlElement(name = "Onderdeel", type = Part.class)
    public List<Part> getParts() {
        return parts;
    }

    @XmlElementWrapper(name = "Componenten")
    @XmlElement(name = "Component", type = Component.class)
    public List<Component> getComponents() {
        return components;
    }

    @XmlElementWrapper(name = "Taken")
    @XmlElement(name = "Taak", type = Task.class)
    public List<Task> getTasks() {
        return tasks;
    }

    @XmlElement(name = "Installatie", type = Installation.class)
    public Installation getInstallation() {
        return installation;
    }

    @XmlElement(name = "Referentie")
    public String getReference() {
        return reference;
    }

    @XmlElement(name = "Datum")
    public Date getDate() {
        return date;
    }

    @XmlElement(name = "Medewerker", type = Employee.class)
    public Employee getEmployee() {
        return employee;
    }

    @XmlElement(name = "Relatie", type = Relation.class)
    public Relation getRelation() {
        return relation;
    }

    @XmlAttribute(name = "nummer")
    public long getNumber() {
        return number;
    }

    @XmlElement(name = "OrderType")
    public String getOrderType() {
        return orderType;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public void setRelation(Relation relation) {
        this.relation = relation;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public void setInstallation(Installation installation) {
        this.installation = installation;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public void setComponents(List<Component> components) {
        this.components = components;
    }

    public void setParts(List<Part> parts) {
        this.parts = parts;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setExtraInfo(List<Info> extraInfo) {
        this.extraInfo = extraInfo;
    }

    public Timestamp getImportTimestamp() {
        return importTimestamp;
    }

    public void setImportTimestamp(Timestamp importTimestamp) {
        this.importTimestamp = importTimestamp;
    }

    public Timestamp getLastServerChangeTimestamp() {
        return lastServerChangeTimestamp;
    }

    public void setLastServerChangeTimestamp(Timestamp lastServerChangeTimestamp) {
        this.lastServerChangeTimestamp = lastServerChangeTimestamp;
    }

    public Timestamp getLastAndroidChangeTimestamp() {
        return lastAndroidChangeTimestamp;
    }

    public void setLastAndroidChangeTimestamp(Timestamp lastAndroidChangeTimestamp) {
        this.lastAndroidChangeTimestamp = lastAndroidChangeTimestamp;
    }

   /* public Blob getPdf() {
        return pdf;
    }

    public void setPdf(Blob pdf) {
        this.pdf = pdf;
    }*/

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }
}


