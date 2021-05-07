<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.example.java_web.jstl.bean.User" %>
<html>
<head>
    <title>set</title>
</head>
<body>
<c:set var="string1" value="zhangsan" scope="session"/>
<% session.setAttribute("string2", "zhangsan"); %>
${string1}<br>
${string2}<br>
<% session.setAttribute("object1", new User("zhangsan")); %>
<c:set var="object2" value="${object1}" scope="session"/>
${object1.name}<br>
${object2.name}<br>
<c:set var="detail" scope="session">
    zhangsan,org.example.java_web.jstl.bean.User
</c:set>
${detail}<br>
<c:remove var="detail" scope="session"/>
${detail}<br>
<c:set target="${object2}" property="name" value="${param.name}"/>
${object1.name}<br>
${object2.name}<br>
<c:out value="${param.a}" default="0"/>
</body>
</html>
