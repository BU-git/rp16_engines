
package com.bionic.dao;


import java.util.List;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateDao {

    void saveTemplate(TemplateEntity template);

    void save(TemplateField t);

    TemplateEntity findByTemplateId(long id);

    List<String> findAllTemplateNames();

    List<TemplateField> findFieldsByTemplateName(String name);

    void removeTemplate(TemplateEntity template);

    List<TemplateEntity> findTemplateByName(String name);

}