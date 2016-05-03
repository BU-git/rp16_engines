package com.bionic.service;


import com.bionic.dao.EmployeeDao;
import com.bionic.domain.component.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Employee findByEmail(String email) {
        List<Employee> list = employeeDao.findByEmail(email);
        if(!list.isEmpty())
        return list.get(0);
        else return null;
    }
}
