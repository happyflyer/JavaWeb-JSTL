<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<c:if test="${param.name == 'zhangsan' && param.password == '123456'}">
    <h1>${param.name}登录成功</h1>
</c:if>
</body>
</html>
