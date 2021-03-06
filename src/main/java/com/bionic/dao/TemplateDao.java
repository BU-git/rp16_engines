
package com.bionic.dao;


import java.util.List;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateDao {

    void saveTemplate(TemplateEntity temp);

    void save(TemplateField t);

    TemplateEntity findByTemplateId(long id);

    List<String> findAllTemplateNames();

    List<TemplateField> findFieldsByTemplateName(String name);

    void remove(TemplateEntity template);

    List<TemplateEntity> findTemplateByName(String name);

    List<TemplateEntity> findAll();

}