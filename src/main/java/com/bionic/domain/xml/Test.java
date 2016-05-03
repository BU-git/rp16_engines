
package com.bionic.domain.xml;

import java.io.IOException;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bionic.domain.Order;

@Named
public class Test {

    @Autowired
    private XmlFileReader xmlFileReader;


    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        Test test = (Test) context.getBean("test");
        String name = "src/main/resources/xml/4013731.xml";
        Order order = test.xmlFileReader.convertFromXMLToObject(name);
        if(order != null) System.out.println(order.getRelation());;
    }

}