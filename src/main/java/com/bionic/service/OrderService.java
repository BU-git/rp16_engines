package com.bionic.service;

import java.util.List;
import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;

public interface OrderService {
    Order findById(long id);
    List<OrderBrief> getBriefOrdersForUser(String email);
    Order getOrderForUser(long number, String email);
    void update(Order order);
    void save(Order order);
    void remove(long number);
    void assign(long id, String name, String email, String oldName, String oldEmail);
}
