
package com.bionic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.DataTablesAjaxHolder;
import com.bionic.domain.Role;
import com.bionic.domain.User;
import com.bionic.domain.user.UserWrapper;
import com.bionic.domain.user.UserWrapperHolder;
import com.bionic.service.UserService;

@Controller
@SessionAttributes("loggedInUser")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(path = "/users/new", method = RequestMethod.GET)
    public String getPage(ModelMap model){
        return !model.containsAttribute("loggedInUser") ? "redirect:login": "/registration";
    }

    @RequestMapping(path = "/users/new", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> register(@RequestBody UserWrapper user, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        if(userService.findByEmail(user.getEmail()).size() > 0) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("user already exist");
        User u = new User();
        u.setNumber(user.getNumber());
        u.setRole(user.getRole().equals("0") ? Role.ADMIN : Role.USER);
        u.setName(user.getName());
        u.setEmail(user.getEmail());
        u.setPasswordHash(user.getPassword());
        userService.save(u);
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(path = "/users/all", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DataTablesAjaxHolder> getListOfAllTemplatesForDataTables(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        UserWrapperHolder holder = new UserWrapperHolder();
        holder.setData(userService.findAllForDataTables());
        return ResponseEntity.ok(holder);
    }

    @RequestMapping(path = "/users/all", method = RequestMethod.GET)
    public String showAllUsers(ModelMap model){
        return !model.containsAttribute("loggedInUser") ? "redirect:/login": "users";
    }

    @RequestMapping(value = "/users/update/", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> receiveTemplate(@RequestBody UserWrapper u, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        try {
            userService.update(u);
        }catch (IllegalArgumentException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User with this email already exist");
        }catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getLocalizedMessage());
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(value = "/users/remove/{id}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteTemplateByName(ModelMap model, @PathVariable("id") long id){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.ok("redirect:/login");
        try {
            userService.removeById(id);
        }catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getLocalizedMessage());
        }
        return ResponseEntity.ok("ok");
    }
}