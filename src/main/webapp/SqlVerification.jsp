<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 22:04
  Description(描述)： 数据库验证
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>验证</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
    String username;
    String password;
    username = request.getParameter("username");
    password = request.getParameter("password");
%>

<%--
<%=username%>
<br/>
<%=password%>
--%>

<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="<%=username%>" password="<%=password%>" scope="session"/>

<jsp:forward page="index1.jsp" />
</body>
</html>
