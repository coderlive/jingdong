<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=baseurl%>">
    <script>
        window.onload=function () {
            // alert("????")
        }
    </script>
</head>
<body>
   商品添加成功

</body>
</html>
