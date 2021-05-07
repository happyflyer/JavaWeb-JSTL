<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>redirect</title>
</head>
<body>
<c:redirect url="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:redirect>
</body>
</html>
