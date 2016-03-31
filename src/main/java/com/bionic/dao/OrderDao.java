package com.bionic.dao;

import com.bionic.domain.Order;

import java.util.List;

public interface OrderDao {

    Order findById(int id);
    List<Order> findAllOrders();
}
