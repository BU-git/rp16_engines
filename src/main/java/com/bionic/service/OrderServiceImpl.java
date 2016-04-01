package com.bionic.service;

import com.bionic.dao.OrderDao;
import com.bionic.domain.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import java.sql.Blob;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{

    @Inject
    private OrderDao orderDao;

    @Override
    public Order findById(int id) {
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
}
