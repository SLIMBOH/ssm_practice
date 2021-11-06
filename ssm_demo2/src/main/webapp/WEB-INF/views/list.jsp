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
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/jquery/jquery-3.5.1.min.js"></script>
</head>
<body>

    <div class="container">


        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>

        <div class="row">
            <div class="col-md-4">
                <button class="btn-primary">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    ADD
                </button>
                <button class="btn-danger">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    DELETE
                </button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Management</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"Male":"Female"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.dept.deptName}</th>
                            <th>
                                <button class="btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    Edit
                                </button>
                                <button class="btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    DELETE
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                This is page ${pageInfo.pageNum} of ${pageInfo.pages}, ${pageInfo.total} data totally.
            </div>

            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/employees?pn=1">First Page</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/employees?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNumber">
                            <c:if test="${pageNumber == pageInfo.pageNum}">
                                <li class="active"><a href="#">${pageNumber}</a></li>
                            </c:if>
                            <c:if test="${pageNumber != pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/employees?pn=${pageNumber}">${pageNumber}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/employees?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${APP_PATH}/employees?pn=${pageInfo.pages}">Last Page</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
</html>
