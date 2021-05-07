<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>func1</title>
</head>
<body>
<h1>参数： ${param.text}</h1>
<h1>长度： ${fn:length(param.text)}</h1>
<c:choose>
    <c:when test="${fn:startsWith(param.text, 'zhang')}">
        <h1>${fn:replace(param.text, 'zhang', 'li')}</h1>
    </c:when>
    <c:otherwise>
        <h1>${param.text}</h1>
    </c:otherwise>
</c:choose>
</body>
</html>
