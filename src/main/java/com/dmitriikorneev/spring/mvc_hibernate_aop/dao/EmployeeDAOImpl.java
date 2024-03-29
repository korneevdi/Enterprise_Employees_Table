package com.dmitriikorneev.spring.mvc_hibernate_aop.dao;

import com.dmitriikorneev.spring.mvc_hibernate_aop.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository // special annotation for DAO including @Component
public class EmployeeDAOImpl implements EmployeeDAO{

    // dependency on the SessionFactory bean (applicationContext.xml)
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Employee getEmployee(int id) {

        Session session = sessionFactory.getCurrentSession();
        Employee employee = session.get(Employee.class, id);
        return employee;
    }

    @Override
    public List<Employee> getAllEmployees() {

        Session session = sessionFactory.getCurrentSession();
        List<Employee> allEmployees = session.createQuery("from Employee"
                , Employee.class).getResultList(); // get a list of employees through the session

        return allEmployees;
    }

    @Override
    public void saveEmployee(Employee employee) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(employee);
    }

    @Override
    public void deleteEmployee(int id) {

        Session session = sessionFactory.getCurrentSession();
        Query<Employee> query = session.createQuery("delete from Employee where id =: employeeId");
        query.setParameter("employeeId", id);
        query.executeUpdate();
    }
}
