package com.bionic.domain.order;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.bionic.domain.Order;
import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderWrapper {

    private static final String COMPLETED_STATUS = "<div class='completed'></div>";
    private static final String NOT_COMPLETED_STATUS = "<div class='not_completed'></div>";

    @JsonProperty("Order number")
    private long number;
    @JsonProperty("Status")
    private String orderStatus;
    @JsonProperty("Service date")
    private String serviceDate;
    @JsonProperty("Installation")
    private String installation;
    @JsonProperty("Task")
    private String task;
    @JsonProperty("Address")
    private String address;


    public OrderWrapper(Order o){
        this.number = o.getNumber();
        this.address = o.getRelation().getTown();
        setOrderStatus(o.getOrderStatus());
        setServiceDate(o.getDate());
        this.installation = o.getInstallation().getName();
        this.task = o.getTasks().size() > 0 ? o.getTasks().get(0).getLtxa1() : "";
    }


    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        switch (orderStatus){
            case 4: {
                this.orderStatus = COMPLETED_STATUS;
                break;
            }
            default: this.orderStatus = NOT_COMPLETED_STATUS;
        }
    }

    public String getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Date serviceDate) {
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        this.serviceDate = df.format(serviceDate);
    }

    public String getInstallation() {
        return installation;
    }

    public void setInstallation(String installation) {
        this.installation = installation;
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