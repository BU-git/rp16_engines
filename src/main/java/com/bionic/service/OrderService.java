package com.bionic.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.order.OrderWrapper;

public interface OrderService {
    Order findById(long id);
    List<Order> findAllOrders();
    List<OrderWrapper> findAllForDataTables();
    Blob createBlob(MultipartFile file);
    List<OrderBrief> getBriefOrdersForUser(String email);
    Order getOrderForUser(long number, String email);
    void save(Order order);
    void remove(long number);
}
