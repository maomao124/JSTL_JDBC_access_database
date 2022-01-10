<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_JDBC_access_database
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 23:05
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>错误</title>
</head>
<body>
<h2>
    错误！！！
    <br>
    错误内容：
    <%
        String back = "index1.jsp";
        request.setCharacterEncoding("utf-8");
        String message = (String) session.getAttribute("message");
        if (message.equals("用户名或者密码错误！或者其它错误"))
        {
            back = "index.jsp";
        }
        else if (message.equals("请先登录!"))
        {
            back = "index.jsp";
        }
    %>
    <c:out value="<%=message%>" escapeXml="true" default="null"/>
</h2>
<br/>
<br/>
<a href="<%=back%>">返回</a><br/>
</body>
</html>
