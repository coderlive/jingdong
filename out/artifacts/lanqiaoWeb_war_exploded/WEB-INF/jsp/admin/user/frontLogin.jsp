<%@ page language="java" import="java.util.*,vo.*,service.inner.*,service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <link rel="stylesheet" href="css/login.css">
    <title>京东-欢迎登陆</title>
    <script src="js/jquery-1.7.2.js"></script>
    <script>
        $(function () {
            var loginmun=0;
            $("#btn-login").click(function () {
                var username = $('input[name="username"]').val();
                var password = $('input[name="password"]').val();

                $.post("login",{action:"checkLogin",username:username,password:password},function(data){

                    var ischeck=JSON.parse(data)
                    if (ischeck)
                    {
                        window.location.assign('CategoryServlet?action=goJdIndex&target=/user/welcome&clevel=1');
                    }
                    else
                    {
                        loginmun++;
                        //如果loginmun==2，就再发送一次ajax锁定用户
                        if (loginmun<=3)
                        {
                            alert('登录失败次数:'+loginmun)
                        }
                        if (loginmun==3) {
                            $.post("login",{action:"lockUser",username:username},function(data){
                                alert(data)
                            },"json");
                        }
                    }
                },"json");
            });
            $("#lbtn").click(function () {
                var login_scan = $(".login-scan").css("display");
                if (login_scan == "none") {
                    Scan1();
                }
                function Scan1() {
                    $(".login-scan").css("display", "block");
                    $(".login").css("display", "none");
                }
            });
            $("#rbtn").click(function () {
                var login = $(".login").css("display");
                if (login == "none") {
                    Scan2();
                }
                function Scan2() {
                    $(".login").css("display", "block");
                    $(".login-scan").css("display", "none");
                }
            });
            $("#sc").mouseover(function () {
                $(this).stop().animate({ left: "0px" }, 1000);
                $(".scan-help").stop().css("display", "block");
            })
            $("#sc").mouseout(function () {
                $(this).stop().animate({ left: "75px" }, 1000);
                $(".scan-help").stop().css("display", "none");
            })
        });
    </script>
</head>

<body>
<div class="header">
    <!--头部-->
    <div class="header-c">
        <!-- 左右布局 -->
        <a href="#" class="logo"></a>
        <div class="wel"></div>
        <a href="" class="ask">
            登录页面，调查问卷
        </a>
    </div>
</div>
<div class="tip">
    <!--提示-->
    <div class="tip-c">
        依据《网络安全法》，为保障您的账户安全和正常使用，请尽快完成手机号验证！ 新版《京东隐私政策》已上线，将更有利于保护您的个人隐私。
    </div>
</div>
<div class="main">
    <!--主要内容-->
    <div class="main-c">
        <div class="login-block">
            <!-- 提示信息 -->
            <div class="tip">
                <div class="tip-c">
                    京东不会以任何理由要求您转账汇款，谨防诈骗。
                </div>
            </div>
            <!-- 切换登录方式 -->
            <div class="tab">
                <div id="lbtn" class="tab-item left active">扫码登陆</div>
                <div id="rbtn" class="tab-item raght ">账户登录</div>
            </div>
            <!-- 输入框 -->
            <div class="login">
                <%--<form action="login?action=frontLogin" method="post">--%>
                    <div class="box user">
                        <div class="icon"></div>
                        <input name="username" type="username" placeholder="邮箱/用户名/登录手机">
                    </div>
                    <div class="box pwd">
                        <div class="icon"></div>
                        <input name="password" type="password" placeholder="密码">
                    </div>
                    <a href="#" class="forget">忘记密码</a>
                    <div class="btn">
                        <button id="btn-login" class="btn-button">登 &nbsp;&nbsp; 录</button>
                    </div>
                <%--</form>--%>
            </div>
            <!-- 扫码框 -->
            <div class="login-scan">
                <div class="box scan">
                    <img id="sc" src="img/login/twowm.png" alt="二维码">
                    <div class="scan-help">
                        <img id="he" src="img/login/sjsm.png" alt="手机">
                    </div>
                </div>
                <div class="scantip">
                    <ul>
                        <li>
                            <span>打开</span>
                            <a href="#">
                                <span class="red">手机京东</span>
                            </a>
                            <span>&nbsp;&nbsp;扫码更安全</span>
                        </li>
                    </ul>
                </div>
                <div class="img">
                    <div class="isc">
                        <div class="ic"></div>
                        <em>免输入</em>
                    </div>
                    <div class="isc sp">
                        <div class="ic"></div>
                        <em>更快</em>
                    </div>
                    <div class="isc sa">
                        <div class="ic"></div>
                        <em>更安全</em>
                    </div>
                </div>
            </div>
            <!-- qq微信 -->
            <div class="concat">
                <div class="box qq">
                    <div class="icon"></div>
                    <a href="#">QQ</a>
                    <!-- QQ -->
                </div>
                <div class="box wx">
                    <div class="icon"></div>
                    <a href="#">微信</a>
                    <!-- 微信 -->
                </div>
                <div class="box reg">
                    <div class="icon"></div>
                    <a href="JDDispatcherServlet?target=admin/user/register.jsp">立即注册</a>
                    <!-- 立即注册 -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="foot">
    <!--底部友情链接-->
    <div class="foot-c">
        <div class="links">
            <a href="#">关于我们</a>
            |
            <a href="#">联系我们</a>
            |
            <a href="#">人才招聘</a>
            |
            <a href="#">商家入驻</a>
            |
            <a href="#">广告服务</a>
            |
            <a href="#">手机京东</a>
            |
            <a href="#">友情链接</a>
            |
            <a href="#">销售联盟</a>
            |
            <a href="#">京东社区</a>
            |
            <a href="#">京东公益</a>
            |
            <a href="#">English Site</a>
        </div>
        <div class="copyright">
            Copyright © 2004-2020 京东JD.com 版权所有
        </div>
    </div>
</div>
</body>

</html>