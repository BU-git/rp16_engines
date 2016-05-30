package com.bionic.domain.order;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.bionic.domain.component.Component;
import com.bionic.domain.component.Employee;
import com.bionic.domain.component.Info;
import com.bionic.domain.component.Installation;
import com.bionic.domain.component.Part;
import com.bionic.domain.component.Relation;
import com.bionic.domain.component.Task;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@XmlRootElement(name = "Order")
@Table(name="orders")
public class Order implements Serializable, Comparable<Order>{

    @Id
    private long number;
    private String orderType;

    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    private String reference;
    private String note;

    @OneToOne(cascade = CascadeType.ALL)
    private Relation relation;

    @OneToOne(cascade = CascadeType.ALL)
    private Employee employee;

    @OneToOne(cascade = CascadeType.ALL)
    private Installation installation;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(value = FetchMode.SELECT)
    @JoinTable(name="orders_tasks")
    private List<Task> tasks;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name="orders_components")
    private List<Component> components;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name="orders_parts")
    private List<Part> parts;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(FetchMode.SELECT)
    @JoinTable(name="orders_info")
    private List<Info> extraInfo;

    // Service fields

    /**
     * This is time when this order was imported to BO Server.
     * After import it never changed.
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date importDate;

    /**
     * This is time when this order was changed in BO Server.
     * If order changed in BO this field has to be updated.
     * This field will be used by Android App to check if order has to be updated from server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * This field will NOT changed in Android App.
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastServerChangeDate;

    /**
     * This is time when this order was changed in Android.
     * If order changed in Android App this field has to be updated.
     * This field will be used by Android App to check if order need to be updated to server.
     * This field will NOT changed in BO Server.
     * When order is imported to BO Server this time is set the same value as lastServerChangeTimestamp
     * NotNull
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastAndroidChangeDate;

    /**
     * Order status
     */
    private int orderStatus;

    private final static int ORDER_STATUS_NOT_STARTED = 0;
    private final static int ORDER_STATUS_IN_PROGRESS = 1;
    private final static int ORDER_STATUS_COMPLETE = 2;
    private final static int ORDER_STATUS_COMPLETE_UPLOADED = 3;

    @JsonIgnore
    private String pdfLink;

    private long customTemplateID;

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

    public void setDate(Date date) {
        this.date = date;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setRelation(Relation relation) {
        this.relation = relation;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
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

    public void setExtraInfo(List<Info> extraInfo) {
        this.extraInfo = extraInfo;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public Date getLastServerChangeDate() {
        return lastServerChangeDate;
    }

    public void setLastServerChangeDate(Date lastServerChangeDate) {
        this.lastServerChangeDate = lastServerChangeDate;
    }

    public Date getLastAndroidChangeDate() {
        return lastAndroidChangeDate;
    }

    public void setLastAndroidChangeDate(Date lastAndroidChangeDate) {
        this.lastAndroidChangeDate = lastAndroidChangeDate;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPdfLink() {
        return pdfLink;
    }

    public void setPdfLink(String pdfLink) {
        this.pdfLink = pdfLink;
    }

    public long getCustomTemplateID() {
        return customTemplateID;
    }

    public void setCustomTemplateID(long customTemplateID) {
        this.customTemplateID = customTemplateID;
    }

    @Override
    public String toString() {
        return "Order{" +
                "number=" + number +
                ", orderType='" + orderType + '\'' +
                ", date=" + date +
                ", reference='" + reference + '\'' +
                ", note='" + note + '\'' +
                ", relation=" + relation +
                ", employee=" + employee +
                ", installation=" + installation +
                ", tasks=" + tasks +
                ", components=" + components +
                ", parts=" + parts +
                ", extraInfo=" + extraInfo +
                ", importTimestamp=" + importDate +
                ", lastServerChangeTimestamp=" + lastServerChangeDate +
                ", lastAndroidChangeTimestamp=" + lastAndroidChangeDate +
                ", status=" + orderStatus +
                '}';
    }

    @Override
    public int compareTo(Order o) {
        if(o == null) return 1;
        if(this.number == o.getNumber() ) return 0;
        return this.number > o.getNumber() ? -1 : 1;
    }
}