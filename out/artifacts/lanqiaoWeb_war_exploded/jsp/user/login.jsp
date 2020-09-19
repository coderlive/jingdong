<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=baseurl%>">
</head>
<body>
    ${msg}
    <form action="login" method="post" >
        <input type="text" name="username">
        <input type="password" name="password">
        <input type="submit" value="登录">
    </form>
</body>
</html>
