<%--
  Created by IntelliJ IDEA.
  User: artorias
  Date: 2021/10/31
  Time: 下午6:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Page</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/jquery/jquery-3.5.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add Employee</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="xxx">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W"> Female
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="xxx@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="empEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Edit Employee Info</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="static_empName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="W"> Female
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="xxx@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_update_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
            </div>
        </div>
    </div>
</div>

<div class="container">


    <div class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>

    <div class="row">
        <div class="col-md-4">
            <button class="btn-primary" id="emp_add_modal_btn">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                ADD
            </button>
            <button class="btn-danger" id="emp_delete_all_btn">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                DELETE
            </button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all">
                        </th>
                        <th>#</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Management</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>

        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">

    var totalPages, currentPage;

    $(function () {
        to_page(1);
    });

    function show_validate_msg(tag,status,msg){

        $(tag).parent().removeClass("has-success has-error");
        $(tag).next("span").text("");

        if("success"==status){
            $(tag).parent().addClass("has-success");
            $(tag).next("span").text(msg);
        }else if("error" == status){
            $(tag).parent().addClass("has-error");
            $(tag).next("span").text(msg);
        }
    }

    $("#emp_add_modal_btn").click(function () {

        reset_form("#empAddModal form");

        getDepts("#empAddModal select");

        $("#empAddModal").modal({
            backdrop: "static"
        })
    });

    $("#empName_add_input").change(function(){

        var empName = this.value;

        $.ajax({
            url:"${APP_PATH}/checkName",
            data:"empName="+empName,
            type:"get",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success", "");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error", result.extend.errInfo);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    $("#emp_save_btn").click(function () {

        if (!validate_add_form()) {
            return false;
        }

        // alert($(this).attr("ajax-va"));

        if($(this).attr("ajax-va")=="error"){
            return false;
        }

        // alert($("#empAddModal form").serialize());
        $.ajax({
            url:"${APP_PATH}/employees",
            type:"POST",

            data:$("#empAddModal form").serialize(),
            success:function(result){

                if(result.code == 100){

                    $("#empAddModal").modal('hide');

                    to_page(totalPages);
                }else{
                    if(undefined != result.extend.errInfo.email){

                        show_validate_msg("#email_add_input", "error", result.extend.errInfo.email);
                    }

                    if(undefined != result.extend.errInfo.empName){

                        show_validate_msg("#empName_add_input", "error", result.extend.errInfo.empName);
                    }
                }
            }
        });

    });

    function reset_form(tag){
        $(tag)[0].reset();
        $(tag).find("*").removeClass("has-error has-success");
        $(tag).find(".help-block").text("");
    }

    function getDepts(tag) {

        $(tag).empty();

        $.ajax({
            url: "${APP_PATH}/departments",
            type: "GET",
            success:function (result) {
                $.each(result.extend.departmentInfo, function () {
                    let option = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    option.appendTo(tag);
                });
            }
        })
    }

    function getEmpInfo(id) {

        $.ajax({
            url: "${APP_PATH}/employees/" + id,
            type: "GET",
            success:function (result) {
                var emp = result.extend.empInfo;
                $("#static_empName").text(emp.empName);
                $("#email_update_input").val(emp.email);
                $("#empEditModal input[name=gender]").val([emp.gender]);
                $("#empEditModal select").val([emp.deptId]);
            }
        })
    }

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/employees",
            data:"pn=" + pn,
            type:"get",
            success:function(result){
                /*console.log(result)*/
                build_employee_table(result);
                build_page_info(result);
                build_page_navigator(result);
            }
        });
    }

    function build_employee_table(result){

        $("#emp_table tbody").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps, function(index, item) {
            /*alert(item.empName);*/
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empId  = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = $("<td></td>").append(item.gender == "M" ? "Male" : "Female");
            var email = $("<td></td>").append(item.email);
            var deptName = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
            .append("Edit");
            editBtn.attr("staticId", item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("delete");
            deleteBtn.attr("staticId", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(deleteBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(deptName)
                .append(btnTd)
                .appendTo("#emp_table tbody");
        })
    }

    function build_page_info(result) {

        $("#page_info_area").empty();

        totalPages = result.extend.pageInfo.pages;
        currentPage = result.extend.pageInfo.pageNum;
        var pageNum = result.extend.pageInfo.pageNum;
        var total = result.extend.pageInfo.total;
        var pages = result.extend.pageInfo.pages;

        $("#page_info_area").append("This is page " + pageNum + " of " + pages + ", " + total + " data totally.");
    }

    function build_page_navigator(result) {

        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("First Page").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else{
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("Last Page").attr("href","#"));

        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));

            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }

            numLi.click(function(){
                to_page(item);
            });

            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $(document).on("click",".edit_btn",function(){

        getDepts("#empEditModal select");

        getEmpInfo($(this).attr("staticId"));

        $("#emp_update_btn").attr("empId", $(this).attr("staticId"));

        $("#empEditModal").modal({
            backdrop:"static"
        });
    });

    $("#emp_update_btn").click(function(){

        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input", "error", "invalid email form");
            return false;
        }else{
            show_validate_msg("#email_update_input", "success", "");
        }
        // alert("click");

        $.ajax({
            url:"${APP_PATH}/employees/"+$(this).attr("empID"),
            type:"PUT",
            data:$("#empEditModal form").serialize(),
            success:function(result){

                $("#empEditModal").modal("hide");

                to_page(currentPage);
            }
        });
    });

    $(document).on("click",".delete_btn",function(){

        var name = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("staticId");
        if(confirm("Do you want to delete "+ name +"`s infomation？")){
            $.ajax({
                url:"${APP_PATH}/employees/"+id,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    $("#check_all").click(function(){
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    $(document).on("click",".check_item",function(){
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    $("#emp_delete_all_btn").click(function(){

        if($(".check_item:checked").length >= 1) {

            var names = "";

            var ids = "";

            $.each($(".check_item:checked"),function(){
                names += $(this).parents("tr").find("td:eq(2)").text()+",";
                ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });

            names = names.substring(0, names.length-1);

            ids = ids.substring(0, ids.length-1);

            //弹出确认删除对话框
            if(confirm("Do you want to delete "+ names +"`s infomation？")){
                $.ajax({
                    url:"${APP_PATH}/employees/"+ids,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        to_page(currentPage);
                    }
                });
            }
        } else {
            alert("At least choose one employee, please.");
        }
    });

    function validate_add_form() {

        let empName = $("#empName_add_input").val();
        let regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error", "username must be the combination of 6-16 letters");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }

        let email = $("#email_add_input").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "email format is invalid");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

</script>

</body>
</html>
