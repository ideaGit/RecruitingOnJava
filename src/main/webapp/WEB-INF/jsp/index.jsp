<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <c:if test="${fn:length(errors) > 0}">
        <div class="alert alert-error">
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <form method="POST" action="/user" class="well form-horizontal">
        <div class="control-group">
            <label for="name" class="control-label">Your Name</label>
            <div class="controls">
                <input name="name" type="text" id="name">
            </div>
        </div>
        <div class="control-group">
            <label for="university" class="control-label">University</label>
            <div class="controls">
                <input name="university" type="text" id="university">
            </div>
        </div>
        <div class="control-group">
            <label for="phone" class="control-label">Phone</label>
            <div class="controls">
                <input name="phone" type="text" id="phone">
            </div>
        </div>
        <div class="control-group">
            <label for="email" class="control-label">Email</label>
            <div class="controls">
                <input name="email" type="text" id="email">
            </div>
        </div>
        <div class="control-group">
            <label for="major" class="control-label">Major</label>
            <div class="controls">
                <input name="major" type="text" id="major">
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="Save Changes" />
        </div>
    </form>
</body>
</html>
