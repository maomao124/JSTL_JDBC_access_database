<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/10
  Time(创建时间)： 12:40
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String update_no;
    update_no = request.getParameter("update_no");
    if (update_no.equals(""))
    {
        session.setAttribute("message", "输入的学号为空");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    try
    {
        Integer.parseInt(update_no);
    }
    catch (Exception e)
    {
        session.setAttribute("message", "输入的学号不是int型，或者输入的数字太大");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (Integer.parseInt(update_no) < 0)
    {
        session.setAttribute("message", "输入的学号不能为负数");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
%>
<c:set var="update_no" value="<%=update_no%>" scope="session"/>
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${sessionScope.student}">
    SELECT * FROM information where no=<%=update_no%>;
</sql:query>
<%int count = 0;%>
要修改的学生信息如下：
<table border="1">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <c:set var="no" value="${row.no}" scope="page"/>
            <td><c:out value="${row.name}"/></td>
            <c:set var="name" value="${row.name}" scope="page"/>
            <td><c:out value="${row.sex}"/></td>
            <c:set var="sex" value="${row.sex}" scope="page"/>
            <td><c:out value="${row.age}"/></td>
            <c:set var="age" value="${row.age}" scope="page"/>
            <%count++;%>
        </tr>
    </c:forEach>
</table>
<c:set var="count" value="<%=count%>" scope="page"/>
<c:if test="${count==0}" >
    <br/>
    <c:out value="未找到此学号对应的数据！" escapeXml="true" default="null"/>
    <a href="update_input.jsp">重新输入</a><br/>
</c:if>

<br/>
<br/>
<br/>
<c:if test="${count!=0}">
    请输入新的内容：
    <br/>
    <br/>
    <form action="updateVerification.jsp" method="post">
        学号：
        <input type="text" name="no" value="${no}"/><br/>
        姓名：
        <input type="text" name="name" value="${name}"/><br/>
        性别：
        <input type="text" name="sex" value="${sex}"/><br/>
        年龄：
        <input type="text" name="age" value="${age}"/><br/>
        <br/>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="submit" value="确认"/>
        <br/>
    </form>
</c:if>
<br/>
<br/>
<br/>
<a href="update_input.jsp">返回上一级</a><br/>
<a href="index1.jsp">返回到菜单</a><br/>
</body>
</html>
