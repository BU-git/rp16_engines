package com.bionic.service;

import com.bionic.domain.Order;

import java.util.List;

public interface OrderService {
    Order findById(int id);
    List<Order> findAllOrders();
}
