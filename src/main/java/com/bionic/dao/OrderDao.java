package com.bionic.dao;

import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;

public interface OrderDao {

    Order findById(long id);
    List<OrderBrief> getBriefOrdersForUser(String email);
    void save(Order order);
    void update(Order order);
    void remove(Order order);
    Order getOrderForUser(Long number, String email);
    List<Order> findAllWithTemplateId(long id);
}