package com.bionic.controller;

import com.bionic.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.inject.Inject;

@Controller
public class OrderController {

    @Inject
    private OrderService service;

    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showList(ModelMap model) {
        model.addAttribute("allOrders", service.findAllOrders());
        return "orders";
    }

}
