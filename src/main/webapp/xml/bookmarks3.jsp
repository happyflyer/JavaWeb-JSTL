<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import var="xml" url="bookmarks.xml" charEncoding="UTF-8"/>
<c:import var="xslt" url="${param.xslt}" charEncoding="UTF-8"/>
<html>
<head>
    <title>bookmarks3</title>
</head>
<body>
<x:transform doc="${xml}" xslt="${xslt}">
    <x:param name="headline" value="这是列表的标题"/>
</x:transform>
</body>
</html>
