package com.bionic.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
//@Table(name = "ORDERS")
@SequenceGenerator(name = "sequence", sequenceName = "ORDER_SEQ", allocationSize = 1, initialValue = 1)
public class Order {

    @Id
    @Column(name = "ORDER_ID")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "sequence")
    private Long id;

    @Column(name = "ORDER_NUMBER")
    private Integer orderNumber;

    @Column(name = "SERVICE_DATE")
    private Date serviceDate;

    @Column(name = "ORDER_TASK")
    private String task;

    @Column(name = "ORDER_ADDRESS")
    private String address;
}
