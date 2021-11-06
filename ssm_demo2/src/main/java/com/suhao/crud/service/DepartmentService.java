package com.suhao.crud.service;

import com.suhao.crud.dao.DepartmentMapper;
import com.suhao.crud.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAllDepartments(){
        return departmentMapper.selectAll();
    }
}
