
package com.bionic.domain.xml;

import java.io.IOException;
import java.util.ArrayList;
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
        test.fillTemplates("XTemplate", 15);
    }

    private void theSameNameTemplate(String name, int count){
        for(int i=0; i<count; i++){
            List<FieldHolder> list = new ArrayList<>();
            list.add(generateField(name+i,"text field"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(name+i,"text field"));
            templateService.save(name,list,false);
        }
    }

    private void fillTemplates(String name, int count){
        for(int i=0; i<count; i++){
            List<FieldHolder> list = new LinkedList<>();
            list.add(generateField(name+i,"text field"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(i+name,"text area"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(i+name+i, "check box"));
            list.add(generateField(name+i,"text field"));
            list.add(generateField(i+name,"text area"));
            list.add(generateField(i+name,"text area"));
            list.add(generateField(i+name+i, "check box"));
            list.add(generateField(i+name+i, "check box"));
            list.add(generateField(i+name+i, "check box"));
            templateService.save(name+i,list,true);
        }
    }

    private FieldHolder generateField(String name, String type){
        FieldHolder holder = new FieldHolder();
        holder.setDescription(name);
        holder.setType(type);
        return holder;
    }

}