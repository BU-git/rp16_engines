package com.bionic.controller;

import com.bionic.domain.User;
import com.bionic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class AndroidRestController {

    @Autowired
    private UserService service;

    @RequestMapping(value="/users", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
    public List<User> getAllUsers() {
        return service.getAllUsers();
        /*return new ArrayList<User>() {
            {
                add(new User("Admin", "Admin", "admin@kvt.com"));
                add(new User("Admin2", "Admin2", "admin2@kvt.com"));
            }
        };*/
    }
}
