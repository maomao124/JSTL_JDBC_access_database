<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 22:59
  Description(描述)： 插入
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>插入结果</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String no;
    String name;
    String sex;
    String age;
    no = request.getParameter("no");
    name = request.getParameter("name");
    sex = request.getParameter("sex");
    age = request.getParameter("age");
    if (no.equals(""))
    {
        session.setAttribute("message", "学号为空");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (name.equals(""))
    {
        session.setAttribute("message", "姓名为空");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (sex.equals(""))
    {
        session.setAttribute("message", "性别为空");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (age.equals(""))
    {
        session.setAttribute("message", "年龄为空");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    try
    {
        Integer.parseInt(no);
    }
    catch (Exception e)
    {
        session.setAttribute("message", "学号不是int型，或者输入的数字太大");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    try
    {
        Integer.parseInt(age);
    }
    catch (Exception e)
    {
        session.setAttribute("message", "年龄不是int型，或者输入的数字太大");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (Integer.parseInt(no) < 0)
    {
        session.setAttribute("message", "学号不能为负数");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (Integer.parseInt(age) < 0)
    {
        session.setAttribute("message", "年龄不能为负数");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (Integer.parseInt(age) > 100)
    {
        session.setAttribute("message", "输入的年龄过大");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (name.length() > 20)
    {
        session.setAttribute("message", "输入的姓名过长，请不要超过20个字符");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    if (!(sex.equals("男") || sex.equals("女")))
    {
        session.setAttribute("message", "性别只能为\"男\"或者\"女\"");
        //response.sendRedirect("error.jsp");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }

%>
学号：
<c:out value="<%=no%>" escapeXml="true" default="null"/>
<br/>
姓名：
<c:out value="<%=name%>" escapeXml="true" default="null"/>
<br/>
性别：
<c:out value="<%=sex%>" escapeXml="true" default="null"/>
<br/>
年龄：
<c:out value="<%=age%>" escapeXml="true" default="null"/>
<br/>
<br/>

<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${sessionScope.student}" var="result">
    insert into information values(<%=no%>,'<%=name%>','<%=sex%>',<%=age%>);
</sql:update>

插入后的数据：
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${sessionScope.student}">
    SELECT * FROM information;
</sql:query>

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
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>
<br/>
<a href="index1.jsp">返回</a><br/>
</body>
</html>
