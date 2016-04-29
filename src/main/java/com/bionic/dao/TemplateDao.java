
package com.bionic.dao;


import java.util.List;

import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateDao {

    void save(TemplateField t);

    List<TemplateField> findByTemplateId(int id);

    List<String> findAllTemplateNames();

    List<TemplateEntity> findByTemplateName(String name);

}
