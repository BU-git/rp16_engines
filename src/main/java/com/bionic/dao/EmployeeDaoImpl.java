package com.bionic.dao;


import com.bionic.domain.component.Employee;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Employee> findByEmail(String email) {
        TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e WHERE LOWER(e.email) = :email", Employee.class);
        query.setParameter("email", email);
        return query.getResultList();
    }
}
