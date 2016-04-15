package com.bionic.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.Order;
import com.bionic.domain.xml.XmlFileReader;
import com.bionic.service.OrderService;

@Controller
@SessionAttributes("loggedInUser")
public class OrderController {

    @Autowired
    private OrderService service;

   @Autowired
    private XmlFileReader xmlFileReader;

    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllOrders(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        model.addAttribute("allOrders", service.findAllOrders());
        return "orders";
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") long id, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:/login";
        }
        Order order = service.findById(id);
        model.addAttribute("order",order);
        return "order";
    }

    @RequestMapping(value = "/orders/download/{id}", method = RequestMethod.GET)
    public String downloadOrder(@PathVariable long id, HttpServletResponse response, ModelMap model) {
       /* if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        Order order = service.findById(id);
        if (order != null) {
            try {
                response.setHeader("Content-Disposition", "inline;filename=\"" + order.getNumber() + "\"");
                OutputStream out = response.getOutputStream();
                Blob pdf = order.getPdf();
                if (pdf != null) {
                    IOUtils.copy(pdf.getBinaryStream(), out);
                    out.flush();
                    out.close();
                } else {
                    model.addAttribute("message", "Pdf-file not found!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/
        return null;
        //return "orders";
    }
/*
    @RequestMapping(value = "/new")
    public String newOrder(){
        try {
            Order order = xmlFileReader.convertFromXMLToObject("C:\\Users\\fan\\Desktop\\BionicProjectDocs\\xml\\4008692.xml");
            order.setLastServerChangeTimestamp(new Timestamp(new Date().getTime()));
            service.createOrder(order);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }*/
}
