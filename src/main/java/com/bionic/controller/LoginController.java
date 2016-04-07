package com.bionic.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bionic.domain.User;
import com.bionic.service.UserService;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("loggedInUser")
public class LoginController {

	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String displayLogin(ModelMap model) {
		if (model.containsAttribute("loggedInUser")) {
			return "dashboard";
		}
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String authorization(@ModelAttribute("user")User user, ModelMap model) {
		String message = null;
		boolean isValidUser = userService.isValidUser(user.getMail(), user.getPassword());
		if (isValidUser) {
			model.addAttribute("loggedInUser", user.getMail());
			return "dashboard";
		} else {
			message = "Invalid credentials!";
			model.addAttribute("message", message);
			return "login";
		}
	}

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboardPage(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
			//model.addAttribute("message", "You need to be logged!");
            return "redirect:login.html";
        }
        return "dashboard";
    }

    @RequestMapping("/logout")
    public String logOut (SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "redirect:login.html";
    }

	@RequestMapping(value = "/templates", method = RequestMethod.GET)
	public String templatesPage(ModelMap model) {
		if (!model.containsAttribute("loggedInUser")) {
			//model.addAttribute("message", "You need to be logged!");
			return "redirect:login.html";
		}
		return "templates";
	}
}
