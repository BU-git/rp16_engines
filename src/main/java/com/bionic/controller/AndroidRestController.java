package com.bionic.controller;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;
import com.bionic.domain.user.User;
import com.bionic.service.OrderService;
import com.bionic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class AndroidRestController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value="/users", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<User> getUserByEmail(@RequestParam("email") String email) {
        User user = userService.getUserByEmail(email);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @RequestMapping(value="/orders/brief",
            method = RequestMethod.POST,
            produces = "application/json")
    public ResponseEntity<List<OrderBrief>> getBriefOrders(@RequestParam("email") String email) {
        List<OrderBrief> orders = orderService.getBriefOrdersForUser(email);
        return new ResponseEntity<>(orders, HttpStatus.OK);
    }

    @RequestMapping(value = "/orders/get",
            method = RequestMethod.POST,
            produces = "application/json")
    public ResponseEntity<Order> getOrderForUser(@RequestParam("number") long number,
                                 @RequestParam("email") String email) {
        Order order = orderService.getOrderForUser(number, email);
        return order != null ? new ResponseEntity<>(order, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

}
