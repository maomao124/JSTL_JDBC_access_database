<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 22:58
  Description(描述)： 插入-输入信息
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>插入-输入信息</title>
</head>
<body>

<c:if test="${sessionScope.pass==null}">
    <%
        session.setAttribute("message", "请先登录!");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    %>
</c:if>
<c:if test="${sessionScope.pass!=1}">
    <%
        session.setAttribute("message", "请先登录!");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    %>
</c:if>

<h3>
    <form action="insert.jsp" method="post">
        学号：
        <input type="text" name="no"/><br/>
        姓名：
        <input type="text" name="name"/><br/>
        性别：
        <input type="text" name="sex"/><br/>
        年龄：
        <input type="text" name="age"/><br/>
        <br/>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="submit" value="确认"/>
        <br/>
    </form>
</h3>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="index1.jsp">返回</a><br/>
</body>
</html>
