<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages1"/>
<html>
<head>
    <title>fmt2</title>
</head>
<body>
<h1><fmt:message key="welcome1"/></h1>
<fmt:bundle basename="messages2">
    <h1><fmt:message key="name2"/></h1>
</fmt:bundle>
</body>
</html>
