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
    public void saveTemplate(TemplateEntity template) {
        if (template.getId() == 0)
        em.persist(template);
        else em.merge(template);
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
        System.out.println("remove template");
        em.remove(template);
    }

    @Override
    public void removeTemplateField(TemplateField field){
        System.out.println("remove field");
        em.remove(field);
    }

    @Override
    public List<TemplateField> findByTemplateId(int id) {
        TypedQuery<TemplateField> query = em.createQuery("SELECT tf FROM TemplateField tf WHERE tf.templateEntity.id=:id",
                TemplateField.class);
        query.setParameter("id", id);
        return query.getResultList();
    }

    @Override
    public List<String> findAllTemplateNames() {
        TypedQuery<String> query = em.createQuery("SELECT DISTINCT te.templateName FROM TemplateEntity te", String.class);
        return query.getResultList();
    }
}