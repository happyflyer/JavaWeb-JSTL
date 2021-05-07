<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>fmt8</title>
</head>
<body>
<h1><fmt:formatNumber value="12345.678"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency" currencySymbol="$"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency" pattern="#,#00.0#"/></h1>
</body>
</html>
