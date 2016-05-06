package com.bionic.controller;

import com.bionic.domain.User;
import com.bionic.domain.component.Employee;
import com.bionic.service.EmployeeService;
import com.bionic.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.bionic.domain.Order;
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
        Employee employee = employeeService.findByEmail(user.getEmail());
        if (employee != null) {
            Employee empl = new Employee();
            empl.setEmail(employee.getEmail());
            empl.setName(employee.getName());
            empl.setNumber(employee.getNumber());
            order.setEmployee(empl);
        }
        else {
            employee = new Employee();
            employee.setEmail(user.getEmail());
            employee.setName(user.getName());
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
