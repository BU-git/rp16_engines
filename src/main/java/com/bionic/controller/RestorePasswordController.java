package com.bionic.controller;

import com.bionic.domain.User;
import com.bionic.service.UserService;
import com.bionic.util.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class RestorePasswordController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/reset", method = RequestMethod.POST)
    public ResponseEntity<HttpStatus> resetPassword(@RequestParam("email") String email,
                                                    @RequestParam("key") String key) {
        List<User> users = userService.findByEmail(email);
        if (!users.isEmpty()) {
            User user = users.get(0);
            if (user.getPasswordHash().equals(key)) {
                userService.restorePassword(email);
            }
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
