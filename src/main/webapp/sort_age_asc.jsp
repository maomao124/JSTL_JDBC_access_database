<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/10
  Time(创建时间)： 15:13
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>按年龄升序</title>
</head>
<body>
<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${sessionScope.student}">
    SELECT * FROM information order by age asc;
</sql:query>
<%int count = 0;%>
<h2>
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
                <%count++;%>
            </tr>
        </c:forEach>
    </table>
    <br/>
    一共<%=count%>名学生
    <br/>
    <br/>
    <br/>
    <a href="sort.jsp">返回到上一级</a>
    <br/>
    <a href="index1.jsp">返回到主菜单</a><br/>
</h2>
</body>
</html>
