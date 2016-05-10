
package com.bionic.dao;


import java.util.List;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateDao {

    void saveTemplate(TemplateEntity template);

    void save(TemplateField t);

    List<TemplateField> findByTemplateId(int id);

    List<String> findAllTemplateNames();

    List<TemplateField> findFieldsByTemplateName(String name);

    void removeTemplate(TemplateEntity template);

    void removeTemplateField(TemplateField field);

    List<TemplateEntity> findTemplateByName(String name);

}
