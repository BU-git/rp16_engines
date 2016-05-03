
package com.bionic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.User;
import com.bionic.service.UserService;

@Controller
@SessionAttributes("loggedInUser")
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register")
    public String getPage(ModelMap model){
        return !model.containsAttribute("loggedInUser") ? "redirect:login": "registration";
    }

    @RequestMapping(path = "/register/user", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> register(@RequestBody User user, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:login");
        if(userService.findByEmail(user.getEmail()).size() > 0) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("user already exist");
        userService.save(user);
        return ResponseEntity.ok("ok");
    }
}