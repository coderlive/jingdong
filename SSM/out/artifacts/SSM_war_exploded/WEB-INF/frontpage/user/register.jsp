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
	<title>个人注册</title>
	<link rel="stylesheet" href="css/header2.css">
	<link rel="stylesheet" href="css/second.css">
	<link rel="stylesheet" href="css/slide.css">
</head>
<body>
<div class="header">
	<div class="logo-con w clearfix">
		<a class="logo ">
			<img src="img/logo.png" id="img_logo">
		</a>
		<div class="logo-title">欢迎注册</div>

		<div class="have-account">已有账号？ <a href="JDDispatcherServlet?target=admin/user/frontLogin.jsp">请登录&gt;</a></div>

	</div>
</div>
<div class="contain w">
	<div class="progress-bar clearfix">
		<div id="step1" class="pro-step cur-step">
			<span class="step-index">1</span>
			<p class="step-desc">验证邮箱</p>
		</div>
		<div class="pro-line pro-line1 person-pro-line person-pro-line1 ">
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
		</div>
		<div id="step2" class="pro-step pro-step2 person-pro-step2">
			<span class="step-index">2</span>
			<p class="step-desc">填写账号信息</p>
		</div>
		<div class="pro-line pro-line2 person-pro-line person-pro-line2 ">
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
			<p class="div1"></p>
		</div>
		<div class="pro-step pro-step3 person-pro-step3 ">
			<span class="step-index">3</span>
			<p class="step-desc">注册成功</p>
		</div>
	</div>

	<div class="main">
		<div class="reg-form">
			<form action="" id="register-form" method="POST">
				<div id="adiv1">
					<div class="item-phone-wrap">
						<div class="form-item form-item-phone">
							<label class="select-country label" id="select-country">
								邮箱
								<a href="" class="arrow"></a>
							</label>
							<div class="item-input-wrap input-phone">
								<input type="text" id="form-phone" maxlength="20" name="phone" placeholder="建议使用常用邮箱" class="field" autocomplete="off" default="<i class='i-def'></i>验证完成后你可以使用该邮箱登录或找回密码"
									   aria-required="true" aria-invalid="true" aria-describedby="form-phone-error">
								<i class="i-status"></i>
								<i class="i-cancel"></i>
							</div>
							<div class="input-tip">
								<span id="phonespan"></span>
							</div>
						</div>
					</div>

					<div class="item-getcode-wrap">
						<div class="form-item form-item-getcode"> <input class="form-item form-item-getcode" type="button" value="点击按钮进行验证" onclick="test();">
							<div id="div1class" class="slide-authCode-wraper" style="display: none;">
								<a id="divclose" class="close"></a>
								<div class="JDJRV-img-refresh">
									<span>换一张</span>
									<div></div>
								</div>
								<div class="container" id="captcha" style="position: relative;"></div>
							</div>
						</div>
						<div class="input-tip">
							<span></span>
						</div>
					</div>

					<!-- 拼图完成后邮箱验证 -->
					<div class="item-phonecode-wrap">
						<div class="form-item form-item-phonecode">
							<div class="phonecode-left">
								<label>邮箱验证码</label>
								<input type="text" name="mobileCode" maxlength="6" autocomplete="off" id="phoneCod" class="field phonecode"
									   placeholder="输入验证码">
								<i class="i-status"></i>
								<i class="i-cancel"></i>
							</div>
							<button id="getPhoneCode" class="btn-phonecode" type="button">重新获取</button>
							<div class="input-tip">
								<span></span>
							</div>
							<div class="audio-tip">收不到验证码？点击&nbsp;
								<span class="get-auth-code">获取语音验证码</span>
							</div>
						</div>
					</div>

					<div class="form-agreen">
						<input type="button" id="step1-next"  class="btn-register" value="下一步"></input>
					</div>
				</div>

				<div id="adiv2" style="display: none;">
					<div class="form-item form-item-account" id="form-item-account">
						<label>用　户　名</label>
						<input type="text" id="form-account" name="regName" class="field" autocomplete="off" maxlength="20" placeholder="您的账户名和登录名" default='<i class="i-def"></i>支持中文、字母、数字、“-”“_”的组合，4-20个字符' />
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span id="s1"></span>
					</div>

					<div class="form-item">
						<label>设 置 密 码</label>
						<input style="display:none" type="password" name="pwd" class="fakeinput" />
						<input type="password" name="pwd" id="form-pwd" class="field" maxlength="20" placeholder="建议至少使用两种字符组合" default="<i class=i-def></i>建议使用字母、数字和符号两种及以上的组合，6-20个字符" />
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span id="pwdspan"></span>
					</div>

					<div class="form-item">
						<label>确 认 密 码</label>
						<input style="display:none" type="password" name="pwdRepeat" class="fakeinput" />
						<input type="password" name="pwdRepeat" id="form-equalTopwd" class="field" placeholder="请再次输入密码" maxlength="20" default='<i class="i-def"></i>请再次输入密码' />
						<i class="i-status"></i>
					</div>
					<div class="input-tip">
						<span id="equalpwdspan"></span>
					</div>

					<div id="input-tip">
						<input type="checkbox"  name="agreen" class="btn2">
						<div  class="class12">我已阅读并同意</div>
						<a href="#" target="_blank" >《京东企业用户注册协议》</a>
					</div>

					<div class="form-agreen">
						<input type="button" id="register" class="btn-register" value="立即注册"><!--跳回首页 --></input>
					</div>
				</div>
			</form>
		</div>

		<div class="reg-other clearfix">
			<a href="JDDispatcherServlet?target=admin/user/qiyeRegister.jsp" class="reg-other-item reg-other-person">
				<p class="reg-other-icon">
					<img src="img/用户.png" >
				</p>
				企业用户注册
			</a>
			<a href="个人注册.html" class="reg-other-item reg-other-inter">
				<p class="reg-other-icon">
					<img src="img/海外.png" >
				</p>
				海外用户注册
			</a>
		</div>
	</div>
</div>

<div id="lastdiv">
	<div id="lastdiv2">
		<a>关于我们</a>
		<a>|</a>
		<a>联系我们</a>
		<a>|</a>
		<a>人才招聘</a>
		<a>|</a>
		<a>商家入驻</a>
		<a>|</a>
		<a>广告服务</a>
		<a>|</a>
		<a>京东手机</a>
		<a>|</a>
		<a>友情连接</a>
		<a>|</a>
		<a>销售联盟</a>
		<a>|</a>
		<a>京东社区</a>
		<a>|</a>
		<a>京东公益</a>
		<a>|</a>
		<a>English Site</a>
	</div>
	<div id="lastdiv3">
		<a>Copyright©2004-2020&nbsp &nbsp 京东JD.com 版权所有</a>
	</div>
</div>
</body>
<script src="js/slide2.js"></script>
<script src="js/jquery-3.0.0.min.js"></script>
<script src="js/network.js"></script>
<script>
    $(document).ready(function() {
        $('#register').click(function () {//注册功能
            var email=$('#form-phone').val();
            var username=$('#form-account').val();
            var password=$('#form-pwd').val();
            var password1=$('#form-equalTopwd').val();
            if (password==password1)
			{
                var isagreen=$('#input-tip input').prop('checked');
                if (isagreen) //同意条款
				{
					window.location.assign("user/registerUser?username="+username+"&password="+password+"&mail="+email+"&active=1&uenable=0");
                }else{
                    alert('请先同意条款')
				}
			}
            console.log(username,password,password1)
			return;
        });
        // 关闭拼图验证
        $("#divclose").on('click',function() {
            div1class.style.display = "none";
        });

        $('#step1-next').on('click',function() {
            var code=$('#phoneCod').val();//获取验证码，然后发送过去
            //首先要获取验证码，然后获取验证码后，根据验证码进行下一步测试
            new network("user/checkCode",{"code":code}).then(function (res) {
				var istrue=JSON.parse(res)
                if (istrue)
				{
                    //进行显示和隐藏他们
                    var adiv1 =document.getElementById("adiv1");
                    var adiv2 =document.getElementById("adiv2");
                    adiv2.style.display = "block";
                    adiv1.style.display ="none";

                    $('#step2').addClass("cur-step");
                    $('#step1').removeClass("cur-step");
				}

            });

        });
    });
    $('#step1-next').attr("disabled",true)//首先是要禁用它的
    var div1class =document.getElementById("div1class");
    function test() {
        div1class.style.display = "block";
    }

    var formaccountInput;
    var formemailInput;
    var formpwdInput;
    var formequalTopwdInput;
    var formphoneInput;

    var pwd; //第一次输入密码
    var equalpwd; //第二次输入密码
    window.onload = function () {
        jigsaw.init(document.getElementById('captcha'), function() {
			//滚动条滑动成功
			var email=$('#form-phone').val();//获取邮箱的地址
			new network("user/sendEmail",{"email":email}).then(function (res) {
                $('#step1-next').attr("disabled",false);//解锁
            });//去存验证码
            // $('#step1-next').removeAttr("disabled");//解锁
            $(".item-phonecode-wrap").show();
            $(".item-getcode-wrap").hide();
            div1class.style.display = "none";
        });

        //手机号
        formphoneInput = document.getElementById("form-phone");
        formphoneInput.onfocus = Tipformphone;//获得焦点时显示手机号提示信息
        formphoneInput.onblur = Checkformphone;	//失去焦点时判断是否是手机号

        //用户名
        formaccountInput = document.getElementById("form-account");
        formaccountInput.onfocus = Tipformaccount;
        formaccountInput.onblur = Checkformaccount;
        formaccountInput.onkeyup = Checkformaccount;

        // 密码
        formpwdInput = document.getElementById("form-pwd");
        formpwdInput.onfocus = Tipformpwd;
        formpwdInput.onblur = Checkformpwd;

        //再次输入密码
        formequalTopwdInput = document.getElementById("form-equalTopwd");
        formequalTopwdInput.onfocus = TipformequalTopwd;
        formequalTopwdInput.onblur = CheckformequalTopwd;
    }

    //手机号
    function Checkformphone() {
        var phone = formphoneInput.value;
        var span = document.getElementById("phonespan");
        span.innerHTML = "";
        if(isPhone(phone)) {
            span.className = "success";
        } else {
            span.className = "error";
            span.innerHTML = "邮箱地址错误";
        }

    }

    //手机号提示信息
    function Tipformphone() {
        var span = document.getElementById("phonespan");
        span.className = "classspan1";
        span.innerHTML = " 请输入正确的邮箱";
    }

    //用户名
    function Checkformaccount() {
        var formaccount = formaccountInput.value;
        var span = document.getElementById("s1");
        span.innerHTML = "";

        if(trim(formaccount) == "") {
            span.className = "error";
            span.innerHTML = "用户名不能为空";
        } else if(trim(formaccount).length<4){
            span.className = "error";
            span.innerHTML = "用户名不能小于4个字符";
        }else {
            //alert("success");
            span.className = "success";

        }
    }
    //显示提示用户名信息
    function Tipformaccount() {
        var span = document.getElementById("s1");
        span.className = "classspan1";
        span.innerHTML = "支持中文、字母、数字、“-”“_”的组合，4-20个字符";
    }
    // 去掉用户名提示信息
    function deformaccount() {
        var span = document.getElementById("s1");
        span.innerHTML = "";
    }

    //密码
    function Checkformpwd() {
        pwd = formpwdInput.value;
        var span = document.getElementById("pwdspan");
        span.innerHTML = "";
        if(trim(pwd) == "") {
            span.className = "error";
            span.innerHTML = "密码不能为空";
        } else if(trim(pwd).length != pwd.length) {
            span.className = "error";
            span.innerHTML = "密码中不能含有空格";
        } else if(trim(pwd).length < 6 || trim(pwd).length > 20) {
            span.className = "error";
            span.innerHTML = "密码长度为6-20个字符";
        } else {
            span.className = "success";
        }
    }

    //密码 提示信息
    function Tipformpwd() {
        var span = document.getElementById("pwdspan");
        span.className = "classspan1";
        span.innerHTML = "建议使用字母、数字和符号两种及以上的组合，6-20个字符";
    }

    //再次输入密码
    function CheckformequalTopwd() {
        equalpwd = formequalTopwdInput.value;
        var span = document.getElementById("equalpwdspan");
        span.innerHTML = "";
        if(trim(equalpwd) == "") {
            //						span.className = "error";
            //						span.innerHTML = "密码不能为空";
        } else if(pwd != equalpwd) {
            span.className = "error";
            span.innerHTML = "两次密码输入不一致";
        } else {
            span.className = "success";
        }
    }

    //再次输入密码 提示信息
    function TipformequalTopwd() {
        var span = document.getElementById("equalpwdspan");
        span.className = "classspan1";
        span.innerHTML = " 请再次输入密码";
    }

    // 正则表达式
    //判断 输入不能为空
    function trim(txt) {
        var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");
        return afterTrimTxt;
    }

    //判断是不是手机号
    function isPhone(phoneNumber) {
        var regularExpression = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;

        var flag = regularExpression.test(phoneNumber);
        return flag;
    }

</script>
</html>
