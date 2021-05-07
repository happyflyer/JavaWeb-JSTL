<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import var="xml" url="bookmarks.xml" charEncoding="UTF-8"/>
<x:parse var="bookmarks1" doc="${xml}"/>
<x:parse var="bookmarks2">
    <bookmarks>
        <bookmark id="1">
            <title encoding="UTF-8">java</title>
            <url>http://java.sun.com</url>
            <category>language</category>
        </bookmark>
        <bookmark id="2">
            <title encoding="GBK">python</title>
            <url>https://www.python.org</url>
            <category>language</category>
        </bookmark>
    </bookmarks>
</x:parse>
<x:parse var="bookmarks3">
    <c:import url="bookmarks.xml" charEncoding="UTF-8"/>
</x:parse>
<html>
<head>
    <title>bookmarks1</title>
</head>
<body>
<x:set var="title1" select="$bookmarks1//bookmark[2]/title"/>
<x:set var="title2" select="$bookmarks1//bookmark[@id=$param:n]/title" scope="session"/>
<x:out select="$title1"/><br>
<x:out select="$title2"/><br>

<x:out select="$bookmarks1//bookmark[1]//title"/>
<x:out select="$pageScope:bookmarks1//bookmark[2]//title"/>
<x:out select="$bookmarks1//bookmark[@id=$param:id]/title"/><br>

<x:out select="$bookmarks2//bookmark[2]//title"/>
<x:out select="$pageScope:bookmarks2//bookmark[1]//title"/>
<x:out select="$bookmarks2//bookmark[@id=$param:id]/title"/><br>

<x:out select="$bookmarks3//bookmark[1]//title"/>
<x:out select="$pageScope:bookmarks3//bookmark[2]//title"/>
<x:out select="$bookmarks3//bookmark[@id=$param:id]/title"/><br>
</body>
</html>
