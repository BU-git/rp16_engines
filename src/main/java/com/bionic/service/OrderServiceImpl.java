package com.bionic.service;

import com.bionic.dao.OrderDao;
import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.order.OrderWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collections;
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
        List<Order> list = orderDao.findAllOrders();
        Collections.sort(list);
        return list;
    }

    @Override
    public List<OrderWrapper> findAllForDataTables(){
        List<Order> list = findAllOrders();
        List<OrderWrapper> result = new ArrayList<>();
        for(Order o: list){
            OrderWrapper wrapper = new OrderWrapper(o);
            result.add(wrapper);
        }
        return result;
    }

    @Override
    public Blob createBlob(MultipartFile file) {
        return orderDao.createBlob(file);
    }

    @Override
    public List<OrderBrief> getBriefOrdersForUser(String email) {
        String emailTemp = email.toLowerCase().trim();
        return orderDao.getBriefOrdersForUser(emailTemp);
    }

    @Override
    public Order getOrderForUser(long number, String email) {
        String emailTemp = email.toLowerCase().trim();
        return orderDao.getOrderForUser(number, emailTemp);
    }

    @Override
    @Transactional
    public void save(Order order){
        orderDao.saveOrder(order);
    }
}
