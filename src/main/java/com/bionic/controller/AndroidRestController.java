package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.User;
import com.bionic.service.OrderService;
import com.bionic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class AndroidRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value="/users", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
    public @ResponseBody List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @RequestMapping(value = "/user/{email:.+}",
            method = {RequestMethod.GET, RequestMethod.POST},
            produces = "application/json")
    public User getUserByEmail(@PathVariable String email) {
        return userService.getUserByEmail(email);
    }

    @RequestMapping(value="/orders/brief/{email:.+}",
            method = {RequestMethod.POST, RequestMethod.GET},
            produces = "application/json")
    public List<OrderBrief> getBriefOrders(@PathVariable("email") String email) {
        return orderService.getBriefOrdersForUser(email);
    }

    @RequestMapping(value = "/orders/{number}/{email:.+}",
            method = {RequestMethod.GET, RequestMethod.POST},
            produces = "application/json")
    public Order getOrderForUser(@PathVariable("number") long number,
                                 @PathVariable("email") String email) {
        return orderService.getOrderForUser(number, email);
    }
}
