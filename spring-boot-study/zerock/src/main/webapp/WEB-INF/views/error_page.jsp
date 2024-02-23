<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <!-- JSTL -->
    <h4><c:out value="${exception.getMessage()}" /></h4>
    <ul>
        <c:forEach items="${exception.getStackTrace()}" var="stack1">
            <li><c:out value="${stack1}" /></li>
        </c:forEach>
    </ul>
</body>
</html>