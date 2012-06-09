<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiting</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" />

    <script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<body>
<div class="content">
    <div class="banner">
        <img src="img/logo.png" />
    </div>
    <div class="main-content container-fluid">
        <table class="table table-striped table-bordered ">
        <thead>
        <tr>
            <th>name</th>
            <th>university</th>
            <th>email</th>
            <th>major</th>
            <th>phone</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
              <td>${user.name}</td>
              <td>${user.university}</td>
              <td>${user.email}</td>
              <td>${user.major}</td>
              <td>${user.phone}</td>
            </tr>
        </c:forEach>
        </tbody>
        </table>
        <hr>
        <footer>
             <p>@ideaGit 2012</p>
        </footer>
    </div>

</div>
</body>
</html>