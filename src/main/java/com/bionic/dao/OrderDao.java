package com.bionic.dao;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;
import java.util.List;

public interface OrderDao {

    Order findById(long id);
    List<Order> findAllOrders();
    Blob createBlob(MultipartFile file);
    void createOrder(Order order);
    List<OrderBrief> getBriefOrdersForUser(String email);

    Order getOrderForUser(long number, String email);
}
