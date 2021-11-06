package com.suhao.crud.dao;

import com.suhao.crud.pojo.Employee;
import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int selectByName(String empName);

    List<Employee> selectAll();

    Employee selectByPrimaryKeyWithDeptInfo(Integer empId);

    List<Employee> selectAllWithDeptInfo();

    int updateByPrimaryKey(Employee record);
}