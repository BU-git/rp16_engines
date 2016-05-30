package com.bionic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderStatus;
import com.bionic.domain.order.OrderWrapperHolder;
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

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String showAllOrders(ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        return "orders";
    }

    @RequestMapping(value = "/orders/all")
    @ResponseBody
    public ResponseEntity<OrderWrapperHolder> showAll(@RequestParam Map<String,String> allRequestParams, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        return ResponseEntity.ok(orderPaginationService.getAllOrders(allRequestParams, OrderStatus.ALL));
    }

    @RequestMapping(value = "/orders/not-completed")
    @ResponseBody
    public ResponseEntity<OrderWrapperHolder> showNotCompleted(@RequestParam Map<String,String> allRequestParams, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        return ResponseEntity.ok(orderPaginationService.getAllOrders(allRequestParams, OrderStatus.NOT_COMPLETED));
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
        return ResponseEntity.ok(orderPaginationService.getAllOrders(allRequestParams, OrderStatus.COMPLETED));
    }

    @RequestMapping(value = "/orders/{id}", method = RequestMethod.GET)
    public String showOrder(@PathVariable("id") long id, @ModelAttribute("warning")String warning, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        model.addAttribute("order",orderService.findById(id));
        model.addAttribute("allUsers", userService.getAllUsers());
        model.addAttribute("allTemplates", templateService.findAllTemplates());
        return "order";
    }

    @RequestMapping(value = "/order/assign", method = RequestMethod.POST)
    public String assign(@RequestParam long id, @RequestParam String email,@RequestParam String name,
                         @RequestParam String oldEmail, @RequestParam String oldName, ModelMap model){
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        if(oldEmail.equals(email) && oldName.equals(name)) return "redirect:/orders/"+id;
        try{
            orderService.assign(id, name, email, oldName, oldEmail);
        }catch (Exception e){
            model.addAttribute("warning", e.getMessage());
        }
        return "redirect:/orders/" + id;
    }

    @RequestMapping(value = "/orders/download/{id}", method = RequestMethod.GET)
    public String downloadOrder(@PathVariable long id, HttpServletResponse response, ModelMap model) {
        if (!model.containsAttribute("loggedInUser")) return "redirect:/login";
        Order order = orderService.findById(id);
        String link = order.getPdfLink();
        if (link == null) return "orders";
        boolean exist = Files.exists(Paths.get(link));
        if (exist) {
            File pdf = new File(order.getPdfLink());
            try {
                response.setHeader("Content-Disposition", "inline;filename=\"" + id + ".zip" +"\"");
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