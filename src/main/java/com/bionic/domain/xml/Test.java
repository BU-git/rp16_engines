
package com.bionic.domain.xml;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bionic.domain.template.FieldHolder;
import com.bionic.service.TemplateService;

@Named
public class Test {

    @Autowired
    private XmlFileReader xmlFileReader;

    @Autowired
    private TemplateService templateService;


    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        Test test = (Test) context.getBean("test");
        test.fillTemplates("XTemplate", 25);
    }

    private void fillTemplates(String name, int count){
        for(int i=0; i<count; i++){
            List<FieldHolder> list = new LinkedList<>();
            list.add(generateField(name+i));
            list.add(generateField(i+name));
            list.add(generateField(i+name+i));
            templateService.save(name+i,list,true);
        }
    }

    private FieldHolder generateField(String name){
        FieldHolder holder = new FieldHolder();
        holder.setDescription(name);
        holder.setType("text field");
        return holder;
    }

}