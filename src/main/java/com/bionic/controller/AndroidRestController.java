package com.bionic.controller;

import com.bionic.domain.Order;
import com.bionic.domain.OrderBrief;
import com.bionic.domain.User;
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

    @RequestMapping(value="/orders/brief/{email:.+}",
            method = RequestMethod.POST,
            produces = "application/json")
    public ResponseEntity<List<OrderBrief>> getBriefOrders(@PathVariable("email") String email) {
        List<OrderBrief> orders = orderService.getBriefOrdersForUser(email);
        return new ResponseEntity<>(orders, HttpStatus.OK);
    }

    @RequestMapping(value = "/orders/get/{number}/{email:.+}",
            method = RequestMethod.POST,
            produces = "application/json")
    public ResponseEntity<Order> getOrderForUser(@PathVariable("number") long number,
                                 @PathVariable("email") String email) {
        Order order = orderService.getOrderForUser(number, email);
        return order != null ? new ResponseEntity<>(order, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

}
