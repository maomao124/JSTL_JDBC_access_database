<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/10
  Time(创建时间)： 14:18
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>删除</title>
</head>
<body>
删除前：
<br/>
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
<br/>
<c:catch var="error">
    <%--
    var：用来存储所影响行数的变量；
    dataSource：连接的数据源；
    scope：设定参数 var 的有效范围，默认为 page；
    sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
    --%>
    <sql:update dataSource="${sessionScope.student}" var="result">
        delete from information where no=${sessionScope.delete_no}
    </sql:update>
</c:catch>
<c:if test="${error!=null}">
    <c:set var="errormessage" value="${error.message}" scope="session"/>
    <%
        session.setAttribute("message", "删除异常，删除失败！ 错误内容：" + session.getAttribute("errormessage"));
        request.getRequestDispatcher("error.jsp").forward(request, response);
    %>
</c:if>

删除后：
<br/>
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
