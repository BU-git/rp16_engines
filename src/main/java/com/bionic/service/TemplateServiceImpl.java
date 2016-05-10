
package com.bionic.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.FieldDao;
import com.bionic.dao.TemplateDao;
import com.bionic.domain.template.CustomTemplateNameFront;
import com.bionic.domain.template.Field;
import com.bionic.domain.template.FieldHolder;
import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;

@Service
@Transactional(readOnly = true)
public class TemplateServiceImpl implements TemplateService{

    @Autowired
    private TemplateDao templateDao;

    @Autowired
    private FieldDao fieldDao;

    @Override
    @Transactional
    public void saveTemplate(TemplateEntity template) {
        templateDao.saveTemplate(template);
    }

    @Override
    @Transactional
    public void save(String name, List<FieldHolder> fields, boolean fromWeb) {
        if(fromWeb && templateDao.findTemplateByName(name).size() > 0) throw new IllegalArgumentException();
        getList(name, fields).forEach(templateDao::save);
    }

    @Override
    public List<TemplateField> findByTemplateName(String name){
        if(name == null) return new LinkedList<>();
        List<TemplateField> list = templateDao.findFieldsByTemplateName(name);
        Collections.sort(list);
        return list;
    }

    @Override
    public List<String> findAll(){
        return templateDao.findAllTemplateNames();
    }

    @Override
    public List<CustomTemplateNameFront> findAllForDataTables(){
        int i = 1;
        List<CustomTemplateNameFront> list = new ArrayList<>();
        List<String> templates = templateDao.findAllTemplateNames();
        for(String s: templates){
            CustomTemplateNameFront custom = new CustomTemplateNameFront();
            custom.setName("<a href='/templates/overview/" + s + "'><p class='black'>" + s + "</p></a>");
            custom.setPosition(i++);
            list.add(custom);
        }
        return list;
    }

    @Override
    @Transactional
    public void removeTemplateByName(String name) {
        if(name == null) return;
        List<TemplateEntity> entities = templateDao.findTemplateByName(name);
        entities.forEach(templateDao::removeTemplate);
    }

    @Override
    public List<TemplateField> findByTemplateId(int id) {
        return templateDao.findByTemplateId(id);
    }

    private List<TemplateField> getList(String name, List<FieldHolder> fields){
        List<TemplateField> list = new ArrayList<>();
        TemplateEntity templateEntity = new TemplateEntity();
        Date dt = Date.valueOf(LocalDate.now());
        templateEntity.setTemplateName(name);
        for(FieldHolder fieldHolder: fields){
            List<Field> fieldList = fieldDao.findByType(fieldHolder.getType());
            if(fieldList.size() < 1) continue;
            Field f = fieldList.get(0);
            TemplateField templateField = new TemplateField();
            templateField.setTemplateEntity(templateEntity);
            templateField.setField(f);
            templateField.setDescription(fieldHolder.getDescription());
            templateField.setCreateDt(dt);
            list.add(templateField);
        }
        return list;
    }

    @Override
    public List<TemplateEntity> findTemplateByName(String name) {
        return templateDao.findTemplateByName(name);
    }

    @Override
    @Transactional
    public TemplateEntity cloneTemplate(TemplateEntity templateEntity) {
        TemplateEntity temp = new TemplateEntity();
        temp.setAssigned(true);
        temp.setTemplateName(templateEntity.getTemplateName());
        List<TemplateField> templateFields = new ArrayList<>();
        for (TemplateField field : templateEntity.getFields()) {
            TemplateField tempField = new TemplateField();
            tempField.setDescription(field.getDescription());
            tempField.setCreateDt(field.getCreateDt());
            tempField.setTemplateEntity(templateDao.findTemplateByName(field.getTemplateEntity().getTemplateName()).get(0));
            tempField.setField(fieldDao.findByType(field.getField().getType()).get(0));
            templateFields.add(tempField);
        }
        temp.setFields(templateFields);
        templateDao.saveTemplate(temp);
        return temp;
    }
}