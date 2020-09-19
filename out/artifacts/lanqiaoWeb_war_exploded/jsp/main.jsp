<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=baseurl%>">
    <style>
        body{
            /*background: url();*/
            /*background-size: 100% 100%;*/
            /*width: 100px;*/
        }
    </style>
</head>
<body >
    主页面
</body>
</html>
