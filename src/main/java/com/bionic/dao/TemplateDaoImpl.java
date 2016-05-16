package com.bionic.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

@Repository
public class TemplateDaoImpl implements TemplateDao{

    @PersistenceContext
    private EntityManager em;

    @Override
    public void saveTemplate(TemplateEntity temp) {
        if (temp.getId() == 0) {
            em.persist(temp);
        }
        else
            em.merge(temp);
    }

    @Override
    public void save(TemplateField t) {
        em.persist(t);
    }

    @Override
    public List<TemplateEntity> findTemplateByName(String name){
        TypedQuery<TemplateEntity> query = em.createQuery("SELECT te FROM TemplateEntity te WHERE te.templateName =:name",
                TemplateEntity.class);
        query.setParameter("name", name);
        return query.getResultList();
    }

    @Override
    public List<TemplateField> findFieldsByTemplateName(String name){
        TypedQuery<TemplateEntity> entityTypedQuery = em.createQuery("SELECT te FROM TemplateEntity te WHERE te.templateName =:name", TemplateEntity.class);
        entityTypedQuery.setParameter("name", name);
        return entityTypedQuery.setMaxResults(1).getSingleResult().getFields();
    }

    @Override
    public void removeTemplate(TemplateEntity template) {
        em.remove(template);
    }

    @Override
    public TemplateEntity findByTemplateId(long id) {
        return em.find(TemplateEntity.class, id);
    }

    @Override
    public List<String> findAllTemplateNames() {
        TypedQuery<String> query = em.createQuery("SELECT DISTINCT te.templateName FROM TemplateEntity te", String.class);
        return query.getResultList();
    }

    @Override
    public List<TemplateEntity> findAll() {
        TypedQuery<TemplateEntity> query = em.createQuery("SELECT te FROM TemplateEntity te", TemplateEntity.class);
        return query.getResultList();
    }
}