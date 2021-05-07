<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="${sessionScope.count + 1}" scope="session"/>
<html>
<head>
    <title>count</title>
</head>
<body>
<h1>JSP Count ${sessionScope.count}</h1>
<a href="<c:url value='count.jsp'/>">递增</a>
</body>
</html>
