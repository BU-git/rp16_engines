package com.bionic.service;


import com.bionic.domain.component.Employee;


public interface EmployeeService {
    Employee findByEmail(String email);
}
