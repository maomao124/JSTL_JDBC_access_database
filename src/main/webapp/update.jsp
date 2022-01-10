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
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>

<br/>
<br/>

</body>
</html>
