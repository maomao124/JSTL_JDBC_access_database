<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 21:50
  Description(描述)： 输入数据库用户名称和密码
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎</title>
</head>
<body>
<h3>
    注意：请确保数据库用户名和密码正确，数据库里包含student数据库，
    <br/>
    student数据库里包含information表，
    <br/>
    表里包含学号(int)、姓名、性别和年龄(age)信息。
    <br>
    <br/>
    <br/>
    <form action="SqlVerification.jsp" method="post">
        数据库用户名：
        <input type="text" name="username"/><br/>
        &nbsp&nbsp&nbsp数据库密码：
        <input type="password" name="password"/><br/>
        <br/>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="submit" value="登录"/>
    </form>
</h3>
</body>
</html>
