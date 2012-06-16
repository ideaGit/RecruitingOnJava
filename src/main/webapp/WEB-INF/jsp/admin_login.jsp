<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin_Login</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" />
</head>
<body>
<jsp:include page="/WEB-INF/template/header.jsp"/>
<form method="POST" action="/admin" class="well form-horizontal">
        <div class="control-group">
            <label for="name" class="control-label">Your Name</label>
            <div class="controls">
                <input name="name" type="text" id="name">
            </div>
        </div>
        <div class="control-group">
            <label for="password" class="control-label">Your Password</label>
            <div class="controls">
                <input name="password" type="text" id="password">
            </div>
        </div>
         <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="Login" />
        </div>
    </form>
<jsp:include page="/WEB-INF/template/footer.jsp"/>
</body>
</html>