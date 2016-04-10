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

import java.util.List;

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
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.POST)
	public String login(@ModelAttribute("user")User user, ModelMap model) {
		List<User> list = userService.getUser(user.getMail(), user.getPassword());
		if(!list.isEmpty()){
			model.addAttribute("loggedInUser", list.get(0));
			return "dashboard";
		}
		else {
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
    public String logOut (SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:login";
    }
}
