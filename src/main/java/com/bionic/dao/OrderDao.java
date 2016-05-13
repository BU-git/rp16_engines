package com.bionic.dao;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;

public interface OrderDao {

    Order findById(long id);
    List<Order> findAllOrders();
    Blob createBlob(MultipartFile file);
    List<OrderBrief> getBriefOrdersForUser(String email);
    void saveOrder(Order order);
    void remove(Order order);
    Order getOrderForUser(Long number, String email);
}