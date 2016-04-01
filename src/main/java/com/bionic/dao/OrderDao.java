package com.bionic.dao;

import com.bionic.domain.Order;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;
import java.util.List;

public interface OrderDao {

    Order findById(int id);
    List<Order> findAllOrders();
    Blob createBlob(MultipartFile file);
}
