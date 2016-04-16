package com.bionic.dao;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.component.Employee;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class OrderDaoImpl implements OrderDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Order findById(long id) {
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

    @Override
    @Transactional
    public void createOrder(Order order) {
        em.merge(order);
       // em.persist(order);
    }

    @Override
    public List<OrderBrief> getBriefOrdersForUser(String email) {
        TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o WHERE LOWER(o.employee.email) LIKE :email", Order.class);
        query.setParameter("email", email.toLowerCase() + "@kvt.nl");
        List<Order> orders = query.getResultList();
        return orders.stream().map(o -> new OrderBrief(o.getNumber(),
                o.getImportDate(),
                o.getLastServerChangeDate(),
                o.getLastAndroidChangeDate())).collect(Collectors.toList());
    }

    @Override
    public Order getOrderForUser(Long number, String email) {
        Order order = em.find(Order.class, number);
        String emailTemp = order.getEmployee().getEmail();
        if (emailTemp.equalsIgnoreCase(email + "@kvt.nl")) {
            return order;
        }
        return null;

        /*TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o " +
                "WHERE LOWER(o.employee.email) LIKE :email " +
                "AND o.number = :num", Order.class);
        query.setParameter("email", email.toLowerCase()+"@kvt.nl");
        query.setParameter("num", number);
        return query.getSingleResult();*/
    }

    @Override
    public void save(Order order) {
        em.merge(order);
    }

}
