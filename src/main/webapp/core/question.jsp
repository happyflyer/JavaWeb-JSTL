<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>question</title>
</head>
<body>
<form action="question.jsp" method="POST">
    <c:choose>
        <c:when test="${param.page == 'page1' or param.page == null}">
            <label>Q1:
                <input type="text" name="p1q1"/>
            </label>
            <label>Q2:
                <input type="text" name="p1q2"/>
            </label>
            <input type="submit" name="page" value="page2"/>
        </c:when>
        <c:when test="${param.page == 'page2'}">
            <c:set var="p1q1" value="${param.p1q1}" scope="session"/>
            <c:set var="p1q2" value="${param.p1q2}" scope="session"/>
            <label>Q3:
                <input type="text" name="p2q1"/>
            </label>
            <input type="submit" name="page" value="finish"/>
        </c:when>
        <c:when test="${param.page == 'finish'}">
            ${sessionScope.p1q1}<br>
            ${sessionScope.p1q2}<br>
            ${param.p2q1}<br>
        </c:when>
    </c:choose>
</form>
</body>
</html>
