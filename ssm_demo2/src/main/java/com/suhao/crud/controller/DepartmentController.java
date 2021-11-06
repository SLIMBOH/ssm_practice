package com.suhao.crud.controller;

import com.suhao.crud.pojo.Department;
import com.suhao.crud.pojo.Msg;
import com.suhao.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/departments")
    @ResponseBody
    public Msg getAllDepartments(){

        List<Department> allDepartments = departmentService.getAllDepartments();
        return Msg.pass().addInfo("departmentInfo", allDepartments);
    }
}
