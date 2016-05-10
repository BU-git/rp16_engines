
package com.bionic.service;

import java.util.List;

import com.bionic.domain.template.CustomTemplateNameFront;
import com.bionic.domain.template.FieldHolder;
import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

public interface TemplateService {

    void saveTemplate(TemplateEntity template);

    void save(String name, List<FieldHolder> fields, boolean fromWeb);

    List<TemplateField> findByTemplateId(int id);

    List<TemplateField> findByTemplateName(String name);

    List<String> findAll();

    List<CustomTemplateNameFront> findAllForDataTables();

    void removeTemplateByName(String name);

    List<TemplateEntity> findTemplateByName (String name);

    TemplateEntity cloneTemplate(TemplateEntity templateEntity);

}