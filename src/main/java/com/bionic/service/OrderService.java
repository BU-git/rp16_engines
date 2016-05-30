package com.bionic.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;

public interface OrderService {
    Order findById(long id);
    List<Order> findAllOrders();
    Blob createBlob(MultipartFile file);
    List<OrderBrief> getBriefOrdersForUser(String email);
    Order getOrderForUser(long number, String email);
    void update(Order order);
    void save(Order order);
    void remove(long number);
    void assign(long id, String name, String email, String oldName, String oldEmail);
}
