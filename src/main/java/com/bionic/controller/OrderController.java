package com.bionic.controller;

import java.util.ArrayList;
import java.util.List;

import com.bionic.domain.User;
import com.bionic.domain.component.Employee;
import com.bionic.domain.template.TemplateEntity;
import com.bionic.domain.template.TemplateField;
import com.bionic.service.TemplateService;
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
import java.nio.file.Paths;


@Controller
@SessionAttributes("loggedInUser")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private TemplateService templateService;


    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllOrders(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        model.addAttribute("allOrders", orderService.findAllOrders());
        return "orders";
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") long id, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:/login";
        }
        Order order = orderService.findById(id);
        model.addAttribute("order",order);
        List<User> userList = userService.getAllUsers();
        model.addAttribute("allUsers", userList);
        List<String> templateList = templateService.findAll();
        model.addAttribute("allTemplates", templateList);
        return "order";
    }

    @RequestMapping(value = "/assignEmployee/{id}", method = RequestMethod.POST)
    public String assignEmployee(@PathVariable("id") long id, @RequestParam("email")String email, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        Order order = orderService.findById(id);
        List<User> list = userService.findByEmail(email);
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

    @RequestMapping(value = "/assignTemplate/{id}", method = RequestMethod.POST)
    public String assignTemplate(@PathVariable("id") long id, @RequestParam("name")String name, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) {
            return "redirect:login";
        }
        Order order = orderService.findById(id);
        List<TemplateEntity> templateEntityList = templateService.findTemplateByName(name);
        if (!templateEntityList.isEmpty()) {
            for (TemplateEntity templateEntity : templateEntityList) {
                if (!templateEntity.isAssigned()) {
                    templateEntity.setAssigned(true);
                    templateService.saveTemplate(templateEntity);
                    order.setTemplate_id(templateEntity.getId());
                    orderService.save(order);
                    return "redirect:/orders/{id}";
                }
            }
            TemplateEntity temp = templateService.cloneTemplate(templateEntityList.get(0));
            order.setTemplate_id(temp.getId());
            orderService.save(order);
        }
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
