<%--
  Created by IntelliJ IDEA.
  User: artorias
  Date: 2021/10/29
  Time: 上午1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book Page</title>

    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12">
            <div class="page-header">
                <h1>
                    <small>Add New Book</small>
                </h1>
            </div>
        </div>

    </div>
    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <label for="bkname">Book Name:</label>
            <input name="bookName" type="text" class="form-control" id="bkname">
        </div>
        <div class="form-group">
            <label for="bkNum">Book Count:</label>
            <input name="bookCount" type="text" class="form-control" id="bkNum">
        </div>
        <div class="form-group">
            <label for="bkInfo">Book Information:</label>
            <input name="detail" type="text" class="form-control" id="bkInfo">
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="ADD">
        </div>
    </form>

</div>
</body>
</html>
