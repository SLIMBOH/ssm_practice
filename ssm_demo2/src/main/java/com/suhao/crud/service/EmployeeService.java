package com.suhao.crud.service;

import com.suhao.crud.dao.EmployeeMapper;
import com.suhao.crud.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAllEmployees(){
        return employeeMapper.selectAllWithDeptInfo();
    }

    public Employee getEmployeeById(Integer empId){
        return employeeMapper.selectByPrimaryKeyWithDeptInfo(empId);
    }

    public int getEmployeeByName(String name){
//        EmployeeExample example = new EmployeeExample();
//        EmployeeExample.Criteria criteria = example.createCriteria();
//        criteria.andEmpNameEqualTo(name);
       return employeeMapper.selectByName(name);
    }

    public int deleteEmployeeById(int id){
        return employeeMapper.deleteByPrimaryKey(id);
    }

    public int editEmployeeInfo(Employee employee){
        return employeeMapper.updateByPrimaryKey(employee);
    }

    public int addEmployeeInfo(Employee employee){
        return employeeMapper.insert(employee);
    }

    public void deleteBatch(List<Integer> idList) {
        int i = 0;
        while(i < idList.size()) {
            employeeMapper.deleteByPrimaryKey(idList.get(i));
            i++;
        }
    }
}
