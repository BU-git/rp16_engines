package com.bionic.dao;

import com.bionic.domain.component.Employee;

import java.util.List;

public interface EmployeeDao {
    List<Employee> findByEmail (String email);
}
