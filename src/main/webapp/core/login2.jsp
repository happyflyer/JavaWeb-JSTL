<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" class="org.example.java_web.jstl.bean.User"/>
<jsp:setProperty name="user" property="*"/>
<html>
<head>
    <title>login2</title>
</head>
<body>
<c:choose>
    <c:when test="${user.valid}">
        <h1>
            <jsp:getProperty name="user" property="name"/>
            登录成功
        </h1>
    </c:when>
    <c:otherwise>
        <h1>登录失败</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
