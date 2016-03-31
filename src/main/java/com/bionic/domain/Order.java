package com.bionic.domain;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "ORDERS")
@SequenceGenerator(name = "sequence", sequenceName = "ORDER_SEQ", allocationSize = 1, initialValue = 1)
public class Order {

    @Id
    /*@Column(name = "ORDER_ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "sequence")
    private Long id;*/

    @Column(name = "ORDER_NUMBER")
    private Integer orderNumber;

    @Column(name = "SERVICE_DATE")
    private Date serviceDate;

    @Column(name = "ORDER_TASK")
    private String task;

    @Column(name = "ORDER_ADDRESS")
    private String address;

    public Order() {

    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        this.serviceDate = serviceDate;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
