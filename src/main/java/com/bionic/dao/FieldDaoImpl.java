
package com.bionic.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.bionic.domain.template.Field;

@Repository
public class FieldDaoImpl implements FieldDao{

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Field> findByType(String type) {
        TypedQuery<Field> query = em.createQuery("SELECT field FROM Field field WHERE field.type=:id", Field.class);
        query.setParameter("id", type);
        return query.getResultList();
    }
}