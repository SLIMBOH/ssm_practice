package com.suhao.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.suhao.crud.pojo.Employee;
import com.suhao.crud.pojo.Msg;
import com.suhao.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    private static Integer pageSize = 10;

    /*
        ajax json controller
     */
    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> allEmployees = employeeService.getAllEmployees();
        PageInfo pageInfo = new PageInfo(allEmployees, 5);
        return Msg.pass().addInfo("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/employees", method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmployee(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String, Object> errorMap = new HashMap<String, Object>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for(FieldError error: fieldErrors){
                errorMap.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.failed().addInfo("errInfo",  errorMap);
        }
        employeeService.addEmployeeInfo(employee);
        return  Msg.pass();
    }

    @RequestMapping(value = "/checkName", method = RequestMethod.GET)
    @ResponseBody
    public Msg checkEmpName(@RequestParam(value = "empName") String name){
        String nameRegex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!name.matches(nameRegex)){
            return Msg.failed().addInfo("errInfo", "username must be the combination of 6-16 letters");
        }
        int ans = employeeService.getEmployeeByName(name);
        if(ans == 0){
            return Msg.pass();
        }else{
            return Msg.failed().addInfo("errInfo", "username has been used");
        }
    }

    @RequestMapping(value = "/employees/{static_empId}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("static_empId") Integer static_empId){
        Employee emp = employeeService.getEmployeeById(static_empId);
        return Msg.pass().addInfo("empInfo", emp);
    }

    @RequestMapping(value = "/employees/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg editEmpInfo(Employee employee){
        employeeService.editEmployeeInfo(employee);
        return Msg.pass();
    }

    @RequestMapping(value = "/employees/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("id") String id){
//        System.out.println(id);
        if (id.contains("-")) {
            String[] ids = id.split("-");
            List<Integer> idList = new ArrayList<Integer>();
            for (String i : ids) {
                idList.add(Integer.parseInt(i));
            }
            employeeService.deleteBatch(idList);
        } else {
            Integer empId = Integer.parseInt(id);
            employeeService.deleteEmployeeById(empId);
        }
        return Msg.pass();
    }



    /*
        jsp controller
     */
//    @RequestMapping(value = "/employees")
//    public String allEmployees(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum, Model model){
//        PageHelper.startPage(pageNum, pageSize);
//        List<Employee> allEmployees = employeeService.getAllEmployees();
//        PageInfo pageInfo = new PageInfo(allEmployees, 5);
//        model.addAttribute("pageInfo", pageInfo);
//        return "list";
//    }
}
