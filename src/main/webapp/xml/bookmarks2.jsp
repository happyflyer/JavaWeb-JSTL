<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import var="xml" url="bookmarks.xml" charEncoding="UTF-8"/>
<x:parse var="bookmarks" doc="${xml}"/>
<html>
<head>
    <title>bookmarks2</title>
</head>
<body>
<x:if select="$bookmarks//bookmark[@id=$param:id]/title">
    <h1><x:out select="$bookmarks//bookmark[@id=$param:id]/title"/></h1>
</x:if>
<x:choose>
    <x:when select="$bookmarks//bookmark[@id=$param:id]/title">
        <h1><x:out select="$bookmarks//bookmark[@id=$param:id]/title"/></h1>
    </x:when>
    <x:otherwise>
        <h1>指定的标签 id 不存在！</h1>
    </x:otherwise>
</x:choose>
<h2>所有书签</h2>
<table style="border: 1px">
    <tr>
        <th>名称</th>
        <th>网址</th>
        <th>分类</th>
    </tr>
    <x:forEach var="bookmark" select="$bookmarks//bookmark">
        <tr>
            <td><x:out select="$bookmark/title"/></td>
            <td><x:out select="$bookmark/url"/></td>
            <td><x:out select="$bookmark/category"/></td>
        </tr>
    </x:forEach>
</table>
</body>
</html>
