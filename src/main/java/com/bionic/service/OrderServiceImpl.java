package com.bionic.service;

import com.bionic.dao.OrderDao;
import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.sql.Blob;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderDao orderDao;

    @Override
    public Order findById(long id) {
        return orderDao.findById(id);
    }

    @Override
    public List<Order> findAllOrders() {
        return orderDao.findAllOrders();
    }

    @Override
    public Blob createBlob(MultipartFile file) {
        return orderDao.createBlob(file);
    }

    @Transactional
    @Override
    public void createOrder(Order order) {
        orderDao.createOrder(order);
    }

    @Override
    public List<OrderBrief> getBriefOrdersForUser(String email) {
        return orderDao.getBriefOrdersForUser(email);
    }

    @Override
    public Order getOrderForUser(long number, String email) {
        return orderDao.getOrderForUser(number, email);
    }
}
