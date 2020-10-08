<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <base href="<%=baseurl%>">
    <title>登录</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--[if lt IE 9]>
		<script src="js/html5shiv.min.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
    <div class="main-wrapper account-wrapper">
        <div class="account-page">
			<div class="account-center">
				<div class="account-box">
                    <form action="login?action=LoginIn" class="form-signin" method="post">
						<div class="account-logo">
                            <a href="index.html"><img src="img/jdhead.jpg" alt=""></a>
                        </div>
                        <div class="form-group">
                            <label>用户名</label>
                            <input name="username" type="text" autofocus="" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password" type="password" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <a href="forgot-password.html">忘记密码?</a>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary account-btn">登录</button>
                        </div>
                        <div class="text-center register-link">
                            没有账号? <a href="register.html">注册</a>
                        </div>
                    </form>
                </div>
			</div>
        </div>
    </div>
    <script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/app.js"></script>
</body>

</html>