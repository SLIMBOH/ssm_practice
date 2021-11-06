<%--
  Created by IntelliJ IDEA.
  User: artorias
  Date: 2021/10/28
  Time: 下午9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home Page</title>

    <style>
      a{
        text-decoration: none;
        color: aqua;
        font-size: 50px;
      }
      h1{
        height: 400px;
        width: 500px;
        margin: 250px auto;
        text-align: center;
        line-height: 350px;
        background-color: black;
      }
    </style>
  </head>
  <body>
  <h1>
      <a href="${pageContext.request.contextPath}/book/getAll">get all books</a>
  </h1>
  </body>
</html>
