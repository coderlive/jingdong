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
		<title>企业注册</title>
		<style type="text/css">
			@import url("css/header2.css");
			@import url("css/second.css");
		</style>
	</head>
	<body>
		<div class="header">
			<div class="logo-con w clearfix">
				<a class="logo ">
					<img src="images/logo.png" id="img_logo">
				</a>
				<div class="logo-title">欢迎注册</div>

				<div class="have-account">已有账号？ <a href="个人注册.html">请登录&gt;</a></div>

			</div>
		</div>
		<div class="contain w">
			<div class="progress-bar clearfix">
				<div id="step1" class="pro-step cur-step">
					<span class="step-index">1</span>
					<p class="step-desc">填写账号信息</p>
				</div>
				<div class="pro-line pro-line1 person-pro-line person-pro-line1 ">
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
				</div>
				<div id="step2" class="pro-step pro-step2 person-pro-step2 ">
					<span class="step-index">2</span>
					<p class="step-desc">填写企业信息</p>
				</div>
				<div class="pro-line pro-line2 person-pro-line person-pro-line2 ">
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
					<p id="div1"></p>
				</div>
				<div class="pro-step pro-step3 person-pro-step3  ">
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
										<input type="text" id="form-phone" maxlength="11" name="phone" placeholder="建议使用常用邮箱" class="field" autocomplete="off" default="<i class='i-def'></i>验证完成后你可以使用该手机登录或找回密码"
										 aria-required="true" aria-invalid="true" aria-describedby="form-phone-error">
										<i class="i-status"></i>
										<i class="i-cancel"></i>
									</div>
									<div class="input-tip">
										<span id="phonespan"></span>
									</div>
								</div>
							</div>

							<div class="item-phonecode-wrap">
								<div class="form-item form-item-phonecode">
									<div class="phonecode-left">
										<label>手机验证码</label>
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

							<div class="form-item">
								<label>邮箱验证</label>
								<input type="text" name="" id="input_text" value="输入验证码" />
								<i class="i-status"></i>
								<div id="id_get">获取验证码</div>
							</div>
							
							<div class="input-tip">
								<span></span>
							</div>

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

							<!-- <div class="input-tip">
								<div id="div_1">
									<div id="input_btn">
										<label id="lab_id">
											手机验证码
										</label>
										<input type="text" name="" id="input_text" value="输入验证码" />
									</div>
									<div id="id_get">获取验证码</div>
								</div>
							</div>

							<div class="input-tip">
								<div id="div_1">
									<div class="input_btn">
										<label id="lab_id">
											用&nbsp &nbsp户&nbsp &nbsp名
										</label>
										<input type="text" name="" id="" value="你的账户名和登录名" class="input_text" />
									</div>
								</div>
							</div>
							<div class="input-tip">
								<div id="div_1">
									<div class="input_btn">
										<label id="lab_id">
											手机验证码
										</label>
										<input type="text" name="" value="建议使用两种或两种以上字符组合" class="input_text" />
									</div>
								</div>
							</div> -->
							<div id="input-tip">
									<input type="checkbox" name="agreen" class="btn2">
									<div  class="class12">我已阅读并同意</div>
									<a href="#" target="_blank" >《京东企业用户注册协议》</a>
							</div>
							<div class="form-agreen">
								<div id="step1-next" class="btn-register">下一步</div>
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
								<input type="checkbox" name="agreen" class="btn2">
								<div  class="class12">我已阅读并同意</div>
								<a href="#" target="_blank" >《京东企业用户注册协议》</a>
							</div>

							<div class="form-agreen">
								<a class="btn-register" href=""><!--跳回首页 -->
									<div class="btn-register">立即注册</div>
								</a>  	
							</div>
						</div>
					</form>
				</div>

				<div class="reg-other clearfix">

					<a href="个人注册.html" class="reg-other-item reg-other-person">
						<p class="reg-other-icon" >
							<img src="images/用户.png">
						</p>
						个人用户注册
					</a>
					<a href="个人注册.html" class="reg-other-item reg-other-inter">
						<p class="reg-other-icon">
							<img src="images/海外.png">
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
	<script src="js/jquery-3.0.0.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$('#step1-next').on('click',function() {
				var adiv1 =document.getElementById("adiv1");
				var adiv2 =document.getElementById("adiv2");
				adiv2.style.display = "block";
				adiv1.style.display ="none";
				
				$('#step2').addClass("cur-step");
				$('#step1').removeClass("cur-step");
		});
		});
	</script>
</html>
