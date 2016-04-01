package com.bionic.dao;

import com.bionic.domain.Order;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.io.IOException;
import java.sql.Blob;
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

    @Override
    public Blob createBlob(MultipartFile file) {
        Blob blob = null;
        Session session = em.unwrap(Session.class);
        try {
            blob = Hibernate.getLobCreator(session).createBlob(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return blob;
    }
}
