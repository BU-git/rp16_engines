
package com.bionic.service;

import java.util.List;

import com.bionic.domain.template.web.CustomTemplateNameFront;
import com.bionic.domain.template.web.CustomTemplateFieldHolder;
import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateService {

    void saveTemplate(TemplateEntity template);

    void save(String name, List<CustomTemplateFieldHolder> fields, boolean fromWeb);

    TemplateEntity findByTemplateId(long id);

    List<TemplateField> findFieldsByTemplateName(String name);

    List<String> findAll();

    List<CustomTemplateNameFront> findUniqueTemplateNames();

    void removeTemplateByName(String name);

    List<TemplateEntity> findTemplatesListByName(String name);

    TemplateEntity cloneTemplate(TemplateEntity templateEntity);

}