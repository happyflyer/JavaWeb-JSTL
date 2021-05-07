<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="ms" class="org.example.java_web.jstl.bean.MessageService"/>
<jsp:setProperty name="ms" property="*"/>
<html>
<head>
    <title>message</title>
</head>
<body>

<table style="text-align: left;width: 100%;border: 1px">
    <tr>
        <th>名称</th>
        <th>值</th>
    </tr>
    <c:forEach var="message" items="${ms.fakeMessages}">
        <tr>
            <td>${message.name}</td>
            <td>${message.text}</td>
        </tr>
    </c:forEach>
</table>

<c:forEach var="item" items="${ms.fakeMessagesAsMap}">
    Key: ${item.key}<br>
    Value: ${item.value}<br>
</c:forEach>

<c:forEach var="token" items="Java,C++,C,JavaScript">
    ${token}<br>
</c:forEach>

<c:forTokens var="token" delims=":" items="Java:C++:C:JavaScript">
    ${token}<br>
</c:forTokens>

</body>
</html>
