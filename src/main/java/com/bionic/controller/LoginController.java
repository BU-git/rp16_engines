package com.bionic.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bionic.domain.User;
import com.bionic.service.UserService;

@Controller
public class LoginController {
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String displayLogin(ModelMap model) {
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user")User user, ModelMap model) {
		String message = null;
		boolean isValidUser = userService.isValidUser(user.getMail(), user.getPassword());
		if (isValidUser) {
			model.addAttribute("loggedInUser", user.getMail());
			return "welcome";
		}
		else {
			message = "Invalid credentials!";
			model.addAttribute("message", message);
			return "login";
		}
		
	}

}
