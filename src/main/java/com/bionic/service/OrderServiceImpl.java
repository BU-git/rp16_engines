package com.bionic.service;

import java.io.File;
import java.sql.Blob;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import com.bionic.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bionic.dao.OrderDao;
import com.bionic.domain.order.Order;
import com.bionic.domain.order.OrderBrief;
import com.bionic.domain.user.User;
import com.bionic.domain.component.Employee;
import com.bionic.domain.template.TemplateEntity;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private UserService userService;
    @Autowired
    private TemplateService templateService;

    @Override
    public Order findById(long id) {
        return orderDao.findById(id);
    }

    @Override
    public List<OrderBrief> getBriefOrdersForUser(String email) {
        return orderDao.getBriefOrdersForUser(email.toLowerCase().trim());
    }

    @Override
    public Order getOrderForUser(long number, String email) {
        return orderDao.getOrderForUser(number, email.toLowerCase().trim());
    }

    @Override
    @Transactional
    public void update(Order order) {
        orderDao.update(order);
    }

    @Override
    @Transactional
    public void save(Order order){
        if(order == null || findById(order.getNumber()) != null) throw new IllegalArgumentException();
        orderDao.save(order);
    }

    @Override
    @Transactional
    public void remove(long number) {
        if(number < 1) throw new IllegalArgumentException();
        Order order = orderDao.findById(number);
        if(order == null) throw new NoSuchElementException();
        if(order.getCustomTemplateID() > 0) resolveTemplateBind(order.getCustomTemplateID());
        orderDao.remove(order);
        Util.deleteFolder(new File("temp/" + number));
        Util.removeFiles(number);
    }

    private void resolveTemplateBind(long id){
        TemplateEntity t = templateService.findByTemplateId(id);
        if(t == null || orderDao.findAllWithTemplateId(id).size() > 1) return;
        if(t.isActive()) t.setAssigned(false);
        else templateService.remove(t);
    }

    @Override
    @Transactional
    public void assign(long id, String name, String email, String oldName, String oldEmail) {
        Order o = findById(id);
        if(o==null||name==null||email==null||oldEmail==null||oldName==null) throw new IllegalArgumentException("Order can't be null");
        else if (o.getOrderStatus() != 0) {
            switch (o.getOrderStatus()) {
                case 1: throw new IllegalStateException("Order is in progress!");
                case 2: throw new IllegalStateException("Order is completed but not yet uploaded!");
                case 3: throw new IllegalStateException("Order is completed!");
            }
        }
        if(!email.equals(oldEmail)) assignEmployee(email, o);
        if(!oldName.equals(name))   assignTemplate(name, o);
    }

    private void assignEmployee(String email, Order o) {
        List<User> list = userService.findByEmail(email);
        if (list.isEmpty()) return;
        User user = list.get(0);
        Employee employee = new Employee();
        employee.setName(user.getName());
        employee.setEmail(user.getEmail());
        employee.setNumber(user.getNumber());
        o.setEmployee(employee);
        o.setLastServerChangeDate(new Date());
    }

    private void assignTemplate(String name, Order o) {
        templateService.resolveTemplateIsAssigned(o.getCustomTemplateID());
        if (name.equals("default")) o.setCustomTemplateID(0);
        else {
            List<TemplateEntity> templateEntityList = templateService.findTemplatesListByName(name);
            if (templateEntityList.isEmpty()) return;
            TemplateEntity template = templateEntityList.get(0);
            template.setAssigned(true);
            templateService.saveTemplate(template);
            o.setCustomTemplateID(template.getId());
        }
        o.setLastServerChangeDate(new Date());
    }
}