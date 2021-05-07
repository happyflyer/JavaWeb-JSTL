# [JavaWeb-JSTL](https://github.com/happyflyer/JavaWeb-JSTL)

JavaServer Pages Standard Tag Library

- 核心标签库
  - 提供条件判断、属性访问、URL 处理和错误处理等标签
- 118N 兼容格式标签库
  - 提供数字、日期等的格式化功能
  - 以及区域、信息、编码处理等国际化功能
- SQL 标签库
  - 提供基本的数据查询、更新、设置数据源等功能
- XML 标签库
  - 提供 XML 解析、流程控制、转换等功能
- 函数标签库
  - 提供字符串处理的自定义 EL 函数库

## 1. 核心标签库

```java
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
```

### 1.1. 流程处理标签

```java
<c:if test="${param.name == 'zhangsan' && param.password == '123456'}">
    <h1>${param.name}登录成功</h1>
</c:if>
```

```java
<c:choose>
    <c:when test="${user.valid}">
        <h1>
            <jsp:getProperty name="user" property="name"/>
            登录成功
        </h1>
    </c:when>
    <c:otherwise>
        <h1>登录失败</h1>
    </c:otherwise>
</c:choose>
```

```java
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
```

```java
<c:forEach var="item" items="${ms.fakeMessagesAsMap}">
    Key: ${item.key}<br>
    Value: ${item.value}<br>
</c:forEach>
```

```java
<c:forEach var="token" items="Java,C++,C,JavaScript">
    ${token}<br>
</c:forEach>
```

```java
<c:forTokens var="token" delims=":" items="Java:C++:C:JavaScript">
    ${token}<br>
</c:forTokens>
```

### 1.2. 错误处理标签

```java
<c:catch var="error">
    ${param.a} + ${param.b} = ${param.a + param.b}
</c:catch>
<c:if test="${error != null}">
    <br>
    <span style="color: red;">${error.message}</span>
    <br>${error}
</c:if>
```

### 1.3. 网页导入、重定向、URL 处理标签

- 使用指令元素，静态的，转译为一个 Servlet 源代码

```java
<%@ include file="/WEB-INF/jspf/header.jsp"%>
```

- 使用 JSP 标准标签，动态的，转译为多个 Servlet 源代码

```java
<jsp:include page="add.jsp">
    <jsp:param name="a" value="1"/>
    <jsp:param name="b" value="2"/>
</jsp:include>
```

- 使用核心标签库

```java
<c:import url="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:import>
```

```java
<c:import url="https://www.baidu.com" charEncoding="UTF-8"/>
```

```java
<c:redirect url="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:redirect>
```

- 可以使用 `response` 的 `encodeURL()` 方法来做 `URL` 重写
- 用来在用户关闭 `Cookie` 功能时
- 仍继续利用 `URL` 重写来维持 `session` 进行对话
- 如果不想使用 `Scriptlet` 编写 `response` 的 `encodeURL()` 方法
- 就可以使用 `<c:url>`

```java
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="count" value="${sessionScope.count + 1}" scope="session"/>
<html>
<head>
    <title>count</title>
</head>
<body>
<h1>JSP Count ${sessionScope.count}</h1>
<a href="<c:url value='count.jsp'/>">递增</a>
</body>
</html>
```

```java
<c:url value="add.jsp">
    <c:param name="a" value="1"/>
    <c:param name="b" value="2"/>
</c:url>
```

### 1.4. 属性处理与输出标签

- `<jsp:setProperty>` 功能有限
- 而且只能设置和使用 `JavaBean` 的属性和方法
- 如果想要在 `page`、`request`、`session`、`application` 等范围设置一个属性
- 或者想要设置 `Map` 对象的键与值

则可以使用 `<c:set>` 标签

- 设置字符串

```java
<c:set var="string1" value="zhangsan" scope="session"/>
<% session.setAttribute("string2", "zhangsan"); %>
```

- 设置对象

```java
<% session.setAttribute("object1", new User("zhangsan")); %>
<c:set var="object2" value="${object1}" scope="session"/>
```

- 采用有 `Body` 的标签方式

```java
<c:set var="detail" scope="session">
    zhangsan,org.example.java_web.jstl.bean.User
</c:set>
```

- 移除属性

```java
<c:remove var="detail" scope="session"/>
```

- 设置 `JavaBean` 或者 `Map` 对象的键/值，需要使用 `target` 属性。

```java
<c:set target="${object2}" property="name" value="${param.name}"/>
```

- 输出标签

```java
<c:out value="${param.a}" default="0"/>
```

```java
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
```

## 2. 格式标签库

### 2.1. i18N 基础

#### 2.1.1. 关于 Java 字符串

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("hello");
        System.out.println("你好");
    }
}
```

```bash
javac org/example/java_web/jstl/core/Hello.java
```

- [JAD Java Decompiler](https://varaneckas.com/jad/)

```bash
jad org/example/java_web.jstl/core/Hello.class
```

```java
// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3)
// Source File Name:   Hello.java
package org.example.java_web.jstl.core;
import java.io.PrintStream;
public class Hello
{
    public Hello()
    {
    }
    public static void main(String args[])
    {
        System.out.println("hello");
        System.out.println("\u6D63\u72B2\u30BD");
    }
}
```

```bash
javac -encoding UTF-8 org/example/java_web/jstl/core/Hello.java
```

#### 2.1.2. 关于 ResourceBundle

- 在程序中很多字符串都是被写死在代码中
- 如果想要修改某个字符串，必须重新修改代码然后重新编译
- 对于日后可能要修改的文字信息，可以考虑移除到代码之外
- 方法是使用 `java.util.ResourceBundle` 来做信息绑定
- 首先准备一个 `.properties` 文件。文件必须放在 classpath 的路径下
- 文件中编写的键（Key）、值（Value） 对配对

```java
public class Message {
    public static void main(String[] args) {
        Locale locale = new Locale("zh", "CN");
        ResourceBundle res = ResourceBundle.getBundle("message", locale);
        System.out.println(res.getLocale());
        System.out.println(res.getString("welcome"));
        System.out.println(res.getString("name"));
    }
}
```

#### 2.1.3. 关于国际化

- 地区(Locale)信息
  - 代表特定的地理、政治或者文化区
  - 由语言编码和可选的地区编码来指定
- 资源包(Resource Bundle)
- 基础名称(Base name)

语言编码由 `ISO-639` 定义，由 2 个小写字母代表。

- `en`: English
- `ca`: Canadian
- `zh`: Chinese

地区编码定义在 `ISO-3166` ， 由 2 个大写字母代表。

- `IT`: Italy
- `UK`: United Kingdom
- `US`: United States
- `CN`: China

```properties
welcome=你好
name=世界
```

```bash
native2ascii -encoding UTF-8 messages_zh_CN.txt messages_zh_CN.properties
```

```properties
welcome=\u4f60\u597d
name=\u4e16\u754c
```

```bash
native2ascii -reverse -encoding UTF-8 messages_zh_CN.properties messages_zh_CN.txt
```

```java
Locale locale = new Locale("zh", "CN");
ResourceBundle res = ResourceBundle.getBundle("messages", locale);
System.out.println(res.getLocale());
System.out.println(res.getString("welcome"));
System.out.println(res.getString("name"));
```

### 2.2. 信息标签

```java
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

#### 2.2.1. fmt1

```properties
welcome1=welcome in messages1
name1=Hello! Guest!
```

```java
<fmt:bundle basename="messages1">
    <h1><fmt:message key="welcome1"/></h1>
    <h1><fmt:message key="name1"/></h1>
</fmt:bundle>
```

#### 2.2.2. fmt2

```properties
welcome2=welcome in messages2
name2=Hello! New Guest!
```

```java
<fmt:setBundle basename="messages1"/>
<h1><fmt:message key="welcome1"/></h1>
<fmt:bundle basename="messages2">
    <h1><fmt:message key="name2"/></h1>
</fmt:bundle>
```

#### 2.2.3. fmt3

```properties
welcome3=\u4FE1\u606F\u4E09\u7684welcome
name3=Hi!{0}! It is {1, date, long} and {2, time, full}
```

```java
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:setBundle basename="messages3"/>
<h1><fmt:message key="welcome3"/></h1>
<h1>
    <fmt:message key="name3">
        <fmt:param value="${param.username}"/>
        <fmt:param value="${now}"/>
        <fmt:param value="${now}"/>
    </fmt:message>
</h1>
```

### 2.3. 地区标签

- JSTL 的 I8N 兼容性标签
- 会尝试从属性范围中取得 `javax.servlet.jsp.jstl.fmt.LocalizationContext` 对象
- 借以决定资源包与地区信息

具体来说，决定信息文件的顺序如下：

1. 使用指定的 `Locale` 对象取得信息文件
2. 根据浏览器 `Accept-Language` 标头指定的偏好地区（`Preferred locale`）顺序，这可以使用 `HttpServletRequest` 的 `getLocales()` 来取得
3. 根据后备地区（`fallback locale`）信息取得信息文件
4. 使用基础名称取得信息文件

#### 2.3.1. fmt4

- `<fmt:message>` 标签有个 bund 属性，可用以指定 `LocalizationContext` 对象
- 可以在创建 `LocalizationContext` 对象时指定 `ResourceBundle` 与 `Locale` 对象

```java
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocalizationContext"%>
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
```

```java
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
```

```html
<h1>en_US: Hello World</h1>
<h1>ja_JP: こんにちは せかい</h1>
<h1>ko_KR: 안녕하세요. 세계</h1>
<h1>zh_CN: 你好 世界</h1>
```

#### 2.3.2. fmt5

```java
<fmt:setLocale value="ja_JP"/>
<fmt:setBundle basename="messages"/>
<h1><fmt:message key="welcome"/></h1>
<h1><fmt:message key="name"/></h1>
```

```html
<h1>こんにちは</h1>
<h1>せかい</h1>
```

- `<fmt:setLocale>` 会调用 `HttpServletResponse` 的 `setLocale()` 设置响应编码
- 事实上， `<fmt:bundle>`、`<fmt:setBundle>` 或 `<fmt:message>`
- 也会调用 `HttpServletResponse` 的 `setLocale()` 设置响应编码

不过要注意的是，

- 在 Servlet 规范中
- 如果使用了 `setCharacterEncoding()` 或 `setContentType()` 时
- 指定了 `charset`，则 `setLocale()` 就会被忽略

`<fmt:requestEncoding>` 用来设置请求对象的编码处理

- 它会调用 `HttpServletRequest` 的 `setCharacterEncoding()`
- 所以必须在取得任何请求参数之前使用

#### 2.3.3. fmt6

```java
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="javax.servlet.jsp.jstl.core.Config"%>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocalizationContext"%>
<%
    Locale locale = new Locale("ko", "KR");
    ResourceBundle res = ResourceBundle.getBundle("messages", locale);
    Config.set(pageContext, Config.FMT_LOCALIZATION_CONTEXT,
        new LocalizationContext(res), PageContext.PAGE_SCOPE);
%>
<h1><fmt:message key="welcome"/></h1>
<h1><fmt:message key="name"/></h1>
```

[JSR 52: A Standard Tag Library for JavaServer Pages](https://jcp.org/ja/jsr/detail?id=52)

### 2.4. 格式标签

#### 2.4.1. fmt7

```java
<jsp:useBean id="now" class="java.util.Date"/>
<h1><fmt:formatDate value="${now}"/></h1>
<h1><fmt:formatDate value="${now}" dateStyle="full"/></h1>
<h1><fmt:formatDate value="${now}" type="time" dateStyle="full"/></h1>
<h1><fmt:formatDate value="${now}" pattern="dd.MM.yyyy"/></h1>
<h1>
    <fmt:timeZone value="GMT+1:00">
        <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
    </fmt:timeZone>
</h1>
```

`type`

- `date`
- `time`
- `both`

`dateStyle`

- `default`
- `short`
- `medium`
- `long`
- `full`

`timeStyle`

- `default`
- `short`
- `medium`
- `long`
- `full`

`pattern` 可自定义格式，与 `java.text.SimpleDateFormat` 指定方式相同。

[SimpleDateFormat (Java Platform SE 8 )](https://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html)

`<fmt:timeZone>` 可指定时区，可使用字符串或 `java.util.TimeZone` 对象指定。

[TimeZone (Java Platform SE 8 )](https://docs.oracle.com/javase/8/docs/api/java/util/TimeZone.html)

如果需要全局的时区指定，则可以使用 `<fmt:setTimeZone>` 标签。

`<fmt:formatDate>` 本身亦有个 `timeZone` 属性可以进行时区设置，也可以通过属性范围或 `Config` 对象来设置。

- 属性名称前置：`javax.servlet.jsp.jstl.fmt.TimeZone`
- Java 常数：`Config.FMT_TIME_ZONE`
- 设置类型：`java.util.TimeZone` 或 `String`
- 由哪个标签设置：`<fmt:setTimeZone>`
- 被哪些标签使用：`<fmt:formatDate>`，`<fmt:parseDate>`

#### 2.4.2. fmt8

```java
<h1><fmt:formatNumber value="12345.678"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency" currencySymbol="$"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency" pattern="#,#00.0#"/></h1>
```

```html
<h1>12,345.678</h1>
<h1>￥12,345.68</h1>
<h1>$12,345.68</h1>
<h1>12,345.68</h1>
```

`type`

- `number`
- `currency`，`currencySymbol` 属性可指定货币符号
- `percent`，百分比格式或 `pattern` 属性进行格式化

[DecimalFormat (Java Platform SE 8 )](https://docs.oracle.com/javase/8/docs/api/java/text/DecimalFormat.html)

格式化标签会使用 `<fmt:bundle>` 标签指定的地区信息，格式化标签也会设法在可取得的 `LocalizationContext` 中寻找地区信息（如使用 `<fmt:setLocale>` 标签）.

如果格式化标签无法从 `LocalizationContext` 中取得地区信息，就会执行创建地区信息。

格式化标签寻找地区信息的顺序为：

1. 使用 `<fmt:bundle>` 标签。
2. 寻找 `LocalizationContext` 中的地区信息。
3. 使用浏览器 请求中的 `Accept-Language` 标头指定的偏好地区。
4. 使用后备地区信息。

#### 2.4.3. fmt9

```java
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:setLocale value="zh_CN"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<fmt:setLocale value="en_US"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
<fmt:setLocale value="ko_KR"/>
<h1><fmt:formatDate value="${now}" type="both"/></h1>
<h1><fmt:formatNumber value="12345.678" type="currency"/></h1>
```

```html
<h1>2020年10月29日 下午3:01:17</h1>
<h1>￥12,345.68</h1>
<h1>Oct 29, 2020, 3:01:17 PM</h1>
<h1>$12,345.68</h1>
<h1>2020. 10. 29. 오후 3:01:17</h1>
<h1>₩12,346</h1>
```

## 3. XML 标签库

### 3.1. XPath、XSLT 基础

#### 3.1.1. XPath 路径表示

| 路径       | 说明                                             |
| ---------- | ------------------------------------------------ |
| `节点名称` | 选择指定名称节点或所有子节点                     |
| `/`        | 从根节点开始选择                                 |
| `//`       | 从符合选择的目前开始开始选择节点，无论其出现位置 |
| `.`        | 选择当前节点                                     |
| `..`       | 选择当前节点的父节点                             |
| `@`        | 选择属性                                         |

```xml
<?xml version="1.0" encoding="UTF-8"?>
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
```

路径选择

- `bookmarks`: 选择 `<bookmarks>` 所有子节点
- `/bookmarks`: 选择 `<bookmarks>` 根节点
- `//bookmark`: 选择所有 `<bookmark>` 节点
- `/bookmarks/bookmark/title`: 选择第一个 `<bookmark>` 下的 `<title>` 节点
- `//@id`: 选择属性名称为 `id` 的所有属性值

使用谓语(Predicate)寻找特定位置、属性、值的节点。

- `//bookmark[2]`: 选择第二个 `<bookmark>` 节点
- `//bookmark[last()]`: 选择最后一个 `<bookmark>` 节点
- `//bookmark[last() - 1]`: 选择倒数第二个 `<bookmark>` 节点
- `//title[position() < 3]`: 选择第三个节点前的所有 `<title>` 节点
- `//title[@encoding]`: 选择具有 `encoding` 属性的 `<title>` 节点
- `//title[@encoding='UTF-8']`: 选择 `encoding` 属性值为 `UTF-8` 的 `<title>` 节点
- `//bookmark[category]`: 选择具有 `category` 子元素的 `<title>` 节点

通配符

- `//title[@*]`: 选择具有任意属性的 `<title>` 节点
- `/bookmarks/*`: 选择 `<bookmarks>` 节点下所有的子元素
- `//bookmark/title | //bookmark/url`: 选择 `<bookmark>` 节点下的 `<title>` 元素和 `<url>` 元素

[XPath 教程](http://www.w3school.com.cn/xpath/index.asp)

#### 3.1.2. XSLT 基础

XSLT 是指 XSL 转换(Transformation)主要是将 XML 文件转换为另一个 XML 文件、HTML 文件、XHTML 文件的语言。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>bookmarks</title>
      </head>
      <body>
        <h2>在线书签</h2>
        <table border="1">
          <tr>
            <td>名称</td>
            <td>网址</td>
            <td>分类</td>
          </tr>
          <xsl:for-each select="bookmarks/bookmark">
            <tr>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="url"/></td>
              <td><xsl:value-of select="category"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="bookmarks.xsl"?>
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
```

如果使用浏览器查看这份 XML 文件，将会依 `bookmarks.xsl` 定义的模板，显示出效果。

[XSL 语言](http://www.w3school.com.cn/xsl/xsl_languages.asp)

[XSLT 教程](http://www.w3school.com.cn/xsl/index.asp)

### 3.2. 解析、设置与输出标签

```java
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
```

`<x:parse>`

- `var` 属性指定解析结果要存储的属性名称
- `doc` 属性指定 XML 文件来源，解析的文件来源可以是字符串或 `Reader` 对象
- `scope` 属性指定保存范围，默认会存储在 `page` 属性范围

```java
<c:import var="xml" url="bookmarks.xml" charEncoding="UTF-8"/>
<x:parse var="bookmarks" doc="${xml}"/>
```

```java
<x:parse var="bookmarks">
    <c:import url="bookmarks.xml" charEncoding="UTF-8"/>
</x:parse>
```

```java
<x:parse var="bookmarks">
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
```

```java
<x:set var="title1" select="$bookmarks1//bookmark[2]/title"/>
<x:set var="title2" select="$bookmarks1//bookmark[@id=$param:n]/title" scope="session"/>
<x:out select="$title1"/>
<x:out select="$title2"/>
```

```java
<x:out select="$bookmarks//bookmark[1]//title"/>
<x:out select="$pageScope:bookmarks//bookmark[2]//title"/>
<x:out select="$bookmarks//bookmark[@id=$param:id]/title"/>
```

### 3.3. 流程处理标签

```java
<x:if select="$bookmarks//bookmark[@id=$param:id]/title">
    <h1><x:out select="$bookmarks//bookmark[@id=$param:id]/title"/></h1>
</x:if>
```

```java
<x:choose>
    <x:when select="$bookmarks//bookmark[@id=$param:id]/title">
        <h1><x:out select="$bookmarks//bookmark[@id=$param:id]/title"/></h1>
    </x:when>
    <x:otherwise>
        <h1>指定的标签 id 不存在！</h1>
    </x:otherwise>
</x:choose>
```

```java
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
```

### 3.4. 文件转换标签

```java
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import var="xml" url="bookmarks.xml" charEncoding="UTF-8"/>
<c:import var="xslt" url="${param.xslt}" charEncoding="UTF-8"/>
<x:transform doc="${xml}" xslt="${xslt}">
    <x:param name="headline" value="这是列表的标题"/>
</x:transform>
```

分别使用不同的 `xslt` 参数访问，得到相同 `xml` 内容的不同展现形式。

- `/xml/bookmarks3.jsp?xslt=bookmarks_table.xsl`
- `/xml/bookmarks3.jsp?xslt=bookmarks_ul.xsl`

## 4. 函数标签库

```java
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
```

```java
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
```

```html
<h1>参数： zhangsan</h1>
<h1>长度： 8</h1>
<h1>lisan</h1>
```

字符串函数

- 大小写：`toLowerCase()`、`toUpperCase()`
- 子字符串：`subString()`、`subStringBefore()`、`subStringAfter()`
- 截除两端空格：`trim()`
- 替换：`replace()`
- 检查：`startsWith()`、`endsWith()`、`contains()`、`containIgnoreCase()`
- 字符串位置：`indexOf()`
- 字符串切割为数组：`split()`
- 连接数组为字符串：`join()`
- 替换 XML 字符：`escapeXML()`
