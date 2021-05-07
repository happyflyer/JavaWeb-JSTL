<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<html>
<head>
    <title>fmt9</title>
</head>
<body>
<fmt:setLocale value="zh_CN"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<fmt:setLocale value="en_US"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<fmt:setLocale value="ko_KR"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
</body>
</html>
