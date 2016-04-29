

package com.bionic.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bionic.dao.FieldDao;
import com.bionic.dao.TemplateDao;
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
    public void save(String name, List<FieldHolder> fields, boolean fromWeb) {
        if(fromWeb && templateDao.findByTemplateName(name).size() > 0) throw new IllegalArgumentException();
        getList(name, fields).forEach(templateDao::save);
    }

    @Override
    public List<String> findAll(){
        return templateDao.findAllTemplateNames();
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

}