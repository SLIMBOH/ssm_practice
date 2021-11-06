<%--
  Created by IntelliJ IDEA.
  User: artorias
  Date: 2021/10/29
  Time: 上午10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Book Page</title>

    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12">
            <div class="page-header">
                <h1>
                    <small>Edit Book</small>
                </h1>
            </div>
        </div>

    </div>
    <form action="${pageContext.request.contextPath}/book/editBook" method="post">
        <input type="hidden" name="bookID" value="${book.bookID}">
        <div class="form-group">
            <label for="bkname">Book Name:</label>
            <input name="bookName" type="text" class="form-control" id="bkname" value="${book.bookName}">
        </div>
        <div class="form-group">
            <label for="bkNum">Book Count:</label>
            <input name="bookCount" type="text" class="form-control" id="bkNum" value="${book.bookCount}">
        </div>
        <div class="form-group">
            <label for="bkInfo">Book Information:</label>
            <input name="detail" type="text" class="form-control" id="bkInfo" value="${book.detail}">
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="Update">
        </div>
    </form>

</div>
</body>
</html>