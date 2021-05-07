<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<html>
<head>
    <title>fmt7</title>
</head>
<body>
<h1><fmt:formatDate value="${now}"/></h1>
<h1><fmt:formatDate value="${now}" dateStyle="full"/></h1>
<h1><fmt:formatDate value="${now}" type="time" dateStyle="full"/></h1>
<h1><fmt:formatDate value="${now}" pattern="dd.MM.yyyy"/></h1>
<h1>
    <fmt:timeZone value="GMT+1:00">
        <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
    </fmt:timeZone>
</h1>
</body>
</html>
