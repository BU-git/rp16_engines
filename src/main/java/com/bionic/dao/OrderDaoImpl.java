package com.bionic.dao;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;
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
    public List<OrderBrief> getBriefOrdersForUser(String email) {
        TypedQuery<Order> query = em.createQuery("SELECT o FROM Order o WHERE LOWER(o.employee.email) LIKE :email", Order.class);
        query.setParameter("email", email);
        List<Order> orders = query.getResultList();
        return orders.stream().map(o -> new OrderBrief(o.getNumber(),
                o.getImportDate(),
                o.getLastServerChangeDate(),
                o.getLastAndroidChangeDate())).collect(Collectors.toList());
    }

    @Override
    public Order getOrderForUser(Long number, String email) {
        Order order = em.find(Order.class, number);
        if(order != null) {
            String emailTemp = order.getEmployee().getEmail();
            if (emailTemp.equalsIgnoreCase(email)) {
                return order;
            }
        }
        return null;
    }

    @Override
    public void update(Order order){
        em.merge(order);
    }

    @Override
    public void save(Order order) {
        em.persist(order);
    }

    @Override
    public void remove(Order order) {
        em.remove(order);
    }

    @Override
    public List<Order> findAllWithTemplateId(long id){
        return  em.createQuery("SELECT o FROM Order o WHERE o.customTemplateID =:id", Order.class)
                .setParameter("id", id)
                .getResultList();
    }
}