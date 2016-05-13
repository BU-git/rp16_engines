package com.bionic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.Order;
import com.bionic.domain.User;
import com.bionic.domain.component.Employee;
import com.bionic.domain.order.OrderWrapperHolder;
import com.bionic.domain.template.TemplateEntity;
import com.bionic.service.OrderPaginationService;
import com.bionic.service.OrderService;
import com.bionic.service.TemplateService;
import com.bionic.service.UserService;


@Controller
@SessionAttributes("loggedInUser")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private TemplateService templateService;
    @Autowired
    private OrderPaginationService orderPaginationService;

    private static final int NOT_COMPLETED_ORDERS = 0;
    private static final int ALL_ORDERS = 1;
    private static final int COMPLETED_ORDERS = 2;

    @RequestMapping(value = "/orders", method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllOrders(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        return "orders";
    }

    @RequestMapping(value = "/orders/all")
    @ResponseBody
    public ResponseEntity<OrderWrapperHolder> showAll(@RequestParam Map<String,String> allRequestParams, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        return ResponseEntity.ok(getOrderWrapperHolder(allRequestParams, ALL_ORDERS));
    }

    @RequestMapping(value = "/orders/not-completed")
    @ResponseBody
    public ResponseEntity<OrderWrapperHolder> showNotCompleted(@RequestParam Map<String,String> allRequestParams, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        return ResponseEntity.ok(getOrderWrapperHolder(allRequestParams, NOT_COMPLETED_ORDERS));
    }

    @RequestMapping(value = "/orders/remove/{number}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> removeOrderByNumber(@PathVariable("number") long number, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        try {
            orderService.remove(number);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("oops");
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(value = "/orders/completed")
    @ResponseBody
    public ResponseEntity<OrderWrapperHolder> showCompleted(@RequestParam Map<String,String> allRequestParams, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        return ResponseEntity.ok(getOrderWrapperHolder(allRequestParams, COMPLETED_ORDERS));
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") long id, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
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
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
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
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
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
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
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

    private OrderWrapperHolder getOrderWrapperHolder(Map<String, String> allRequestParams, int target){
        try{
            int start = Integer.parseInt(allRequestParams.get("start"));
            int length = Integer.parseInt(allRequestParams.get("length"));
            int column = Integer.parseInt(allRequestParams.get("order[0][column]"));
            String searchValue = allRequestParams.get("search[value]");
            String sortDir = allRequestParams.get("order[0][dir]");
            switch (target){
                case NOT_COMPLETED_ORDERS: return orderPaginationService.getAllOrders(start / length, length, searchValue, sortDir, column, NOT_COMPLETED_ORDERS);
                case ALL_ORDERS: return orderPaginationService.getAllOrders(start/length, length, searchValue, sortDir, column, ALL_ORDERS);
                case COMPLETED_ORDERS: return orderPaginationService.getAllOrders(start / length, length, searchValue, sortDir, column, COMPLETED_ORDERS);
                default: return new OrderWrapperHolder();
            }
        }catch (Exception e){
            return new OrderWrapperHolder();
        }
    }
}