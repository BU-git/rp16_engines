package com.bionic.controller;

import javax.inject.Inject;
import com.bionic.domain.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.bionic.domain.User;
import com.bionic.service.UserService;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import java.util.List;

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

	@ModelAttribute
	public User createUser() {
		return new User(null, null, null, null, Role.ADMIN);
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String authorization(@ModelAttribute("user")User user, ModelMap model) {
		User userTemp = userService.adminLogin(user.getEmail(), user.getPasswordHash());
		if (userTemp != null) {
			model.addAttribute("loggedInUser", userTemp);
			return "dashboard";
		} else {
			String message = "Invalid credentials!";
			model.addAttribute("message", message);
			return "login";
		}
	}


    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboardPage(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        return "dashboard";
    }

    @RequestMapping("/logout")
    public String logOut (SessionStatus sessionStatus, ModelMap model) {
		model.clear();
        sessionStatus.setComplete();
        return "redirect:login";
    }
}
