package com.bionic.dao;

import com.bionic.domain.Order;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {


    @PersistenceContext
    private EntityManager em;

    @Override
    public Order findById(int id) {
        return em.find(Order.class, id);
    }

    @Override
    public List<Order> findAllOrders() {
        TypedQuery<Order> query = em.createQuery("SELECT order FROM Order order", Order.class);
        return query.getResultList();
    }
}
