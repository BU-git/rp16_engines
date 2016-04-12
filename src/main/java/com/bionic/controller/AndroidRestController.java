package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.User;
import com.bionic.service.OrderService;
import com.bionic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class AndroidRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value="/users", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
        /*return new ArrayList<User>() {
            {
                add(new User("Admin", "Admin", "admin@kvt.com"));
                add(new User("Admin2", "Admin2", "admin2@kvt.com"));
            }
        };*/
    }

    @RequestMapping(value="/orders/brief?user={email}",
            method = {RequestMethod.POST, RequestMethod.GET},
            produces = "application/json")
    public List<OrderBrief> getBriefOrders(@PathVariable("email") String email) {
        return orderService.getBriefOrdersForUser(email);
    }

    @RequestMapping(value = "/orders/{number}/{email}",
            method = {RequestMethod.GET, RequestMethod.POST},
            produces = "application/json")
    public Order getOrderForUser(@PathVariable("number") long number,
                                 @PathVariable("email") String email) {
        return orderService.getOrderForUser(number, email);
    }
}
