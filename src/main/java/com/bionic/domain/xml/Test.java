
package com.bionic.domain.xml;

import java.io.IOException;

import javax.inject.Named;

import com.bionic.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Named
public class Test {

    @Autowired
    private XmlFileReader xmlFileReader;

    public static void main(String[] args) throws IOException {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/application-config.xml");
        Test test = new Test();
        String name = "spring/valid.xml";
        Order order = test.xmlFileReader.convertFromXMLToObject(name);
        if(order != null) System.out.println(order.getExtraInfo().get(0).getDescription());
    }
}
