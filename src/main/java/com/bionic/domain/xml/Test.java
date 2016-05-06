
package com.bionic.domain.xml;

import java.io.IOException;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bionic.domain.template.TemplateField;
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
       /* String name = "src/main/resources/xml/4013731.xml";
        Order order = test.xmlFileReader.convertFromXMLToObject(name);
        if(order != null) System.out.println(order.getRelation());;*/
        TemplateField templateField = new TemplateField();
        /*List<TemplateField> list = new LinkedList<>();*/
        /*TemplateEntity templateEntity = new TemplateEntity();
        test.templateService.findAll().forEach(System.out::println);*/
        int i = 1;
        for(TemplateField f: test.templateService.findByTemplateName("NSA")){
            System.out.println(f.getTemplateEntity().getId());
        }

        /*System.out.println(test.templateService.findFieldsByTemplateName("Template X").get(0).getTemplateEntity().getTemplateName());*/

        /*Field field = new Field();
        field.setType("text");

        template.setTemplateName("Testing shit");
        templateField.setTemplate(template);
        templateField.setField(field);
        templateField.setValue("hello world");

        list.add(templateField);*/

    }

}