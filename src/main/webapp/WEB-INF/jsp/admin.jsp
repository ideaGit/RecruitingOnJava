<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiting</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.css" />
    <script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<body>
    <table class="table">
    <thead>
    <tr>
        <td>name</td>
        <td>university</td>
        <td>email</td>
        <td>major</td>
        <td>tel</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
    	<tr>
          <td>${user.name}</td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>

    </c:forEach>
    </tbody>
    </table>
</body>
</html>