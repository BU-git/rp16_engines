package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.service.OrderService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.Blob;

@Controller
public class OrderController {

    @Inject
    private OrderService service;

    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllOrders(ModelMap model) {
        model.addAttribute("allOrders", service.findAllOrders());
        return "orders";
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") int id, ModelMap model) {
        Order order = service.findById(id);
        model.addAttribute("order",order);
        return "order";
    }

    @RequestMapping(value = "/orders/download/{id}", method = RequestMethod.GET)
    public String downloadOrder(@PathVariable int id, HttpServletResponse response, ModelMap model) {
        Order order = service.findById(id);
        if (order != null) {
            try {
                response.setHeader("Content-Disposition", "inline;filename=\"" + order.getOrderNumber() + "\"");
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
        }
        return null;
        //return "orders";
    }
}
