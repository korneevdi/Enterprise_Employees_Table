package com.dmitriikorneev.spring.mvc_hibernate_aop.service;

import com.dmitriikorneev.spring.mvc_hibernate_aop.entity.Employee;
import com.dmitriikorneev.spring.mvc_hibernate_aop.dao.EmployeeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service // mark a class as service
public class EmployeeServiceImpl implements EmployeeService{

    // dependency on DAO
    @Autowired
    private EmployeeDAO employeeDAO;

    @Override
    @Transactional
    public List<Employee> getAllEmployees() {

        return employeeDAO.getAllEmployees(); // call a method from DAO
    }

    @Override
    @Transactional
    public void saveEmployee(Employee employee) {
        employeeDAO.saveEmployee(employee);
    }

    @Override
    @Transactional
    public Employee getEmployee(int id) {

        return employeeDAO.getEmployee(id);
    }

    @Override
    @Transactional
    public void deleteEmployee(int id) {
        employeeDAO.deleteEmployee(id);
    }
}
