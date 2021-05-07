<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:setBundle basename="messages3"/>
<html>
<head>
    <title>fmt3</title>
</head>
<body>
<h1><fmt:message key="welcome3"/></h1>
<h1>
    <fmt:message key="name3">
        <fmt:param value="${param.username}"/>
        <fmt:param value="${now}"/>
        <fmt:param value="${now}"/>
    </fmt:message>
</h1>
</body>
</html>
