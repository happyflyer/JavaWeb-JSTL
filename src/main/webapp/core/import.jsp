<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>import</title>
</head>
<body>

<jsp:include page="add.jsp">
    <jsp:param name="a" value="1"/>
    <jsp:param name="b" value="2"/>
</jsp:include>

<c:import url="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:import>

<c:import url="https://www.baidu.com" charEncoding="UTF-8"/>

</body>
</html>
