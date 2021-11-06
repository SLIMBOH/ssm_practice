package com.suhao.crud.dao;

import com.suhao.crud.pojo.Department;
import com.suhao.crud.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {

    @Autowired
    DepartmentMapper departmentDao;

    @Autowired
    EmployeeMapper employeeDao;

    @Autowired
    SqlSession session;

    @Test
    public void testDao(){
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper bean = applicationContext.getBean(DepartmentMapper.class);
//        System.out.println(departmentDao);

//        departmentDao.insert(new Department(null, "Development"));
//        departmentDao.insert(new Department(null, "Test"));

//        employeeDao.insert(new Employee(null, "tom", "1", "tom@gmail.com",1));
//        employeeDao.insert(new Employee(null, "jerry", "1", "jerry@gmail.com",2));

//        EmployeeMapper empMapper = session.getMapper(EmployeeMapper.class);
//        int i = 0;
//        while(i < 1000) {
//            i++;
//            String s = UUID.randomUUID().toString().substring(0, 5) + i;
//            empMapper.insert(new Employee(null, s, "M", s + "@gmail.com",1));
//        }

        System.out.println(employeeDao.selectAllWithDeptInfo());

    }
}
