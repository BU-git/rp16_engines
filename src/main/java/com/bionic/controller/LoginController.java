package com.bionic.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bionic.domain.User;
import com.bionic.service.UserService;

@Controller
@SessionAttributes("loggedInUser")
public class LoginController {

	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String displayLogin(@ModelAttribute User user, ModelMap model) {
		model.addAttribute("user", user);
		return "login";
	}
	
	@ModelAttribute
	public User createUser() {
		return new User();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user")User user, ModelMap model) {
		try{
		User loggedInUser = userService.getUser(user.getMail(), user.getPassword());
			model.addAttribute("loggedInUser", loggedInUser);
			return "dashboard";
		}
		catch (Exception ex) {
			String message = "Invalid credentials!";
			model.addAttribute("message", message);
			return "login";
		}
	}

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboardPage(@ModelAttribute("loggedInUser") User user, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "login";
        }
        model.addAttribute("loggedInUser",user);
        return "dashboard";
    }

    @RequestMapping("/logout")
    public String logOut (SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "login";
    }

}
