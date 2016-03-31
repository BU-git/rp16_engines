package com.bionic.dao;

import com.bionic.domain.Order;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class OrderDaoImpl implements OrderDao {


    @PersistenceContext
    private EntityManager em;

    @Override
    public Order findById(int id) {
        return em.find(Order.class, id);
    }
}
