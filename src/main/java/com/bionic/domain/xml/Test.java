
package com.bionic.domain.xml;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bionic.domain.Role;
import com.bionic.domain.User;
import com.bionic.domain.template.TemplateField;
import com.bionic.domain.template.web.CustomTemplateFieldHolder;
import com.bionic.service.TemplateService;
import com.bionic.service.UserService;

@Named
public class Test {

    @Autowired
    private XmlFileReader xmlFileReader;

    @Autowired
    private TemplateService templateService;

    @Autowired
    private UserService userService;


    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        Test test = (Test) context.getBean("test");
        /*test.fillUsers("Johny", 30);
        test.fillTemplates("Template", 15);*/
       /* test.xmlFileReader.convertFromXMLToObject("4014981.xml");*/
        /*test.testOrder("Template fucking test");*/
    }

    private void testOrder(String name){
        List<TemplateField> list = templateService.findFieldsByTemplateName(name);
        Collections.sort(list);
        for(TemplateField f: list){
            System.out.println(f);
        }
    }
    private void fillUsers(String name, int count){
        for(int i = 0; i < count; i++){
            User u = new User();
            u.setEmail(name+i+"@gmail.com");
            u.setName(name + " " +i);
            u.setRole(Role.USER);
            u.setNumber(i);
            u.setPasswordHash("admin");
            userService.save(u);
        }
    }

    private void theSameNameTemplate(String name, int count){
        for(int i=0; i<count; i++){
            List<CustomTemplateFieldHolder> list = new ArrayList<>();
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
            List<CustomTemplateFieldHolder> list = new LinkedList<>();
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

    private CustomTemplateFieldHolder generateField(String name, String type){
        CustomTemplateFieldHolder holder = new CustomTemplateFieldHolder();
        holder.setDescription(name);
        holder.setType(type);
        return holder;
    }

}