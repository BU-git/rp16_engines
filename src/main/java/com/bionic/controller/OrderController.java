package com.bionic.controller;

import java.util.List;

import com.bionic.domain.User;
import com.bionic.domain.component.Employee;
import com.bionic.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.Order;
import com.bionic.domain.User;
import com.bionic.domain.component.Employee;
import com.bionic.service.OrderService;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import com.bionic.service.UserService;

@Controller
@SessionAttributes("loggedInUser")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllOrders(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        model.addAttribute("allOrders", orderService.findAllOrders());
        return "orders";
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") long id, @ModelAttribute("user")User user, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:/login";
        }
        Order order = orderService.findById(id);
        model.addAttribute("order",order);
        List<User> userList = userService.getAllUsers();
        model.addAttribute("allUsers", userList);
        return "order";
    }

    @RequestMapping(value = "/changeOrder/{id}", method = RequestMethod.POST)
    public String changeEmployee(@PathVariable("id") long id, @ModelAttribute("user")User user, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        Order order = orderService.findById(id);
        List<User> list = userService.findByEmail(user.getEmail());
        if (!list.isEmpty()) {
            Employee employee = new Employee();
            employee.setName(list.get(0).getName());
            employee.setEmail(list.get(0).getEmail());
            employee.setNumber(list.get(0).getNumber());
            order.setEmployee(employee);
        }
        orderService.save(order);
        return "redirect:/orders/{id}";
    }

    @RequestMapping(value = "/orders/download/{id}", method = RequestMethod.GET)
    public String downloadOrder(@PathVariable long id, HttpServletResponse response, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        Order order = orderService.findById(id);
        boolean exist = Files.exists(Paths.get(order.getPdfLink()));
        if (exist) {
            File pdf = new File(order.getPdfLink());
            try {
                response.setHeader("Content-Disposition", "inline;filename=\"" + id + "\"");
                OutputStream out = response.getOutputStream();
                IOUtils.copy(new FileInputStream(pdf), out);
                out.flush();
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}
