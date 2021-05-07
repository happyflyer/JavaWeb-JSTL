<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocalizationContext" %>
<%
    // 假设这里的代码是在另一个控制器中完成的
    ResourceBundle res_zh_CN = ResourceBundle.getBundle("messages", new Locale("zh", "CN"));
    ResourceBundle res_en_US = ResourceBundle.getBundle("messages", new Locale("en", "US"));
    ResourceBundle res_ja_JP = ResourceBundle.getBundle("messages", new Locale("ja", "JP"));
    ResourceBundle res_ko_KR = ResourceBundle.getBundle("messages", new Locale("ko", "KR"));
    pageContext.setAttribute("res_en_US", new LocalizationContext(res_en_US));
    pageContext.setAttribute("res_ja_JP", new LocalizationContext(res_ja_JP));
    pageContext.setAttribute("res_ko_KR", new LocalizationContext(res_ko_KR));
    pageContext.setAttribute("res_zh_CN", new LocalizationContext(res_zh_CN));
%>
<html>
<head>
    <title>fmt4</title>
</head>
<body>
<h1>
    en_US:
    <fmt:message bundle="${res_en_US}" key="welcome"/>
    <fmt:message bundle="${res_en_US}" key="name"/>
</h1>
<h1>
    ja_JP:
    <fmt:message bundle="${res_ja_JP}" key="welcome"/>
    <fmt:message bundle="${res_ja_JP}" key="name"/>
</h1>
<h1>
    ko_KR:
    <fmt:message bundle="${res_ko_KR}" key="welcome"/>
    <fmt:message bundle="${res_ko_KR}" key="name"/>
</h1>
<h1>
    zh_CN:
    <fmt:message bundle="${res_zh_CN}" key="welcome"/>
    <fmt:message bundle="${res_zh_CN}" key="name"/>
</h1>
</body>
</html>
