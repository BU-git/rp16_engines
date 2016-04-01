
package com.bionic.domain.xml;


import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import com.bionic.domain.xml.component.Component;
import com.bionic.domain.xml.component.Employee;
import com.bionic.domain.xml.component.Info;
import com.bionic.domain.xml.component.Installation;
import com.bionic.domain.xml.component.Part;
import com.bionic.domain.xml.component.Relation;
import com.bionic.domain.xml.component.Task;

@XmlRootElement(name = "Order")
public class OrderXml {

    private int number;
    private String orderType;
    private Date date;
    private String reference;
    private String note;

    private Relation relation;
    private Employee employee;
    private Installation installation;
    private List<Task> tasks;
    private List<Component> components;
    private List<Part> parts;
    private List<Info> extraInfo;

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
    public int getNumber() {
        return number;
    }

    @XmlElement(name = "OrderType")
    public String getOrderType() {
        return orderType;
    }

    public void setNumber(int number) {
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
}
