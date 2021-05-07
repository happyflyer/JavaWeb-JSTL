<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>url</title>
</head>
<body>
<c:url value="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:url>
<a href="<c:url value='add.jsp'><c:param name='a' value='1'/><c:param name='b' value='2'/></c:url>">跳转</a>
</body>
</html>
