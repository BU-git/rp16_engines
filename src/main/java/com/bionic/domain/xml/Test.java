
package com.bionic.domain.xml;

import java.io.IOException;

import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Named
public class Test {

    @Autowired
    private XmlFileReader xmlFileReader;

    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        Test test = (Test) context.getBean("test");
        String name = "valid.xml";
        OrderXml order = test.xmlFileReader.convertFromXMLToObject(name);
        if(order != null) System.out.println(order.getExtraInfo().get(0).getDescription());
    }
}
