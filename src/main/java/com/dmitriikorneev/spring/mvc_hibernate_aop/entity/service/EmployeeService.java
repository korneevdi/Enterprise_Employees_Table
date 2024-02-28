package com.dmitriikorneev.spring.mvc_hibernate_aop.entity.service;

import com.dmitriikorneev.spring.mvc_hibernate_aop.entity.Employee;

import java.util.List;

public interface EmployeeService {

    public List<Employee> getAllEmployees();

    public void saveEmployee(Employee employee);

    public Employee getEmployee(int id);

    public void deleteEmployee(int id);
}
