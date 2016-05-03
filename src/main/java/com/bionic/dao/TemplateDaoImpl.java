package com.bionic.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import com.bionic.domain.template.TemplateField;

@Repository
public class TemplateDaoImpl implements TemplateDao{

    @PersistenceContext
    private EntityManager em;

    @Override
    public void save(TemplateField t) {
        em.persist(t);
    }

    @Override
    public List<TemplateField> findByTemplateName(String name){
        TypedQuery<TemplateField> query = em.createQuery("SELECT DISTINCT te FROM TemplateField te, TemplateEntity t" +
                        " WHERE te.templateEntity.templateName =:name AND te.templateEntity.id = t.id", TemplateField.class);
        query.setParameter("name", name);
        return query.getResultList();
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