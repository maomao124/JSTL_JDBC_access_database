<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 22:48
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>索引</title>
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

<h2>
    <br/>
    <br/>
    <br/>
    <a href="select.jsp">查询</a><br/>
    <a href="insert_input.jsp">插入</a><br/>
    <a href="update_input.jsp">修改</a><br/>
    <a href="delete_input.jsp">删除</a><br/>
    <a href="search_input.jsp">查找</a><br/>
    <a href="sort.jsp">排序</a><br/>
    <br/>
</h2>
<h3>
    <a href="index.jsp">返回到主菜单</a><br/>
</h3>
</body>
</html>
