<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>add</title>
</head>
<body>
<c:catch var="error">
    ${param.a} + ${param.b} = ${param.a + param.b}
</c:catch>
<c:if test="${error != null}">
    <br>
    <span style="color: red;">${error.message}</span>
    <br>${error}
</c:if>
</body>
</html>
