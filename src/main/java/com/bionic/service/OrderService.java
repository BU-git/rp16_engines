package com.bionic.service;

import com.bionic.domain.Order;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;
import java.util.List;

public interface OrderService {
    Order findById(int id);
    List<Order> findAllOrders();
    Blob createBlob(MultipartFile file);
}
