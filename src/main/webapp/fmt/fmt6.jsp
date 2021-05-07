<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="javax.servlet.jsp.jstl.core.Config" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocalizationContext" %>
<%
    Locale locale = new Locale("ko", "KR");
    ResourceBundle res = ResourceBundle.getBundle("messages", locale);
    Config.set(pageContext, Config.FMT_LOCALIZATION_CONTEXT,
            new LocalizationContext(res), PageContext.PAGE_SCOPE);
%>
<html>
<head>
    <title>fmt6</title>
</head>
<body>
<h1><fmt:message key="welcome"/></h1>
<h1><fmt:message key="name"/></h1>
</body>
</html>
