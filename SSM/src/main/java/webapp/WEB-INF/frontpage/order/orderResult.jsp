<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="ch">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8"/>
		<meta charset="UTF-8">
		<title>我的京东--我的订单</title>
		<style type="text/css">
			* {
				margin: 0;
				padding: 0;
			}
			body {
				font: 12px/150% Arial, Verdana, "\5b8b\4f53";
				color: #666;
				background: #fff;
			}
			a:hover {
				color: #C81623;
			}
			a {
				color: #666;
				text-decoration: none;
			}
			ul {
				list-style: none;
			}
			.w {
				width: 990px;
				margin: 0 auto;
			}
			.root61 .w {
				width: 1210px;
			}
			/*最上面一条*/
			#shortcut {
				width: 100%;
				height: 30px;
				line-height: 30px;
				background: #F1F1F1;
			}
			.fl {
				float: left;
			}

			#shortcut .w {
				width: 1210px;
				height: 30px;
				margin: 0 auto;
				background: #F1F1F1;
			}

			#shortcut li {
				float: left;
				height: 30px;
				padding: 0 2px;
			}

			#shortcut li.dorpdown {
				z-index: 13;
			}

			#shortcut #ttbar-mycity {
				padding-left: 0;
			}

			#shortcut li.dorpdown:hover {
				padding: 0 1px;
			}

			#shortcut li.dropdown {
				position: relative;
				padding-left: 0px;
				z-index: 13;
			}

			#shortcut .dt {
				float: left;
				padding: 0 8px;
			}

			#shortcut #ttbar-mycity .dt {
				padding: 0 25px 0 10px;
			}

			.cw-icon {
				position: relative;
				cursor: default;
				zoom: 1;
			}

			#shortcut li.dorpdown:hover .dt {
				background: #fff;
				border: solid #ddd;
				border-width: 0 1px;
				cursor: default;
			}

			#ttbar-mycity:hover .dt {
				padding: 0 24px 0 9px;
			}

			#shortcut .ci-right {
				position: absolute;
				display: block;
				top: 12px;
				right: 8px;
				height: 7px;
				overflow: hidden;
				font: 400 15px/15px consolas;
				color: #6A6A6A;
				transition: transform .1s ease-in 0s;
				-webkit-transition: -webkit-transform .1s ease-in 0s;
			}

			#shortcut li.dorpdown:hover .ci-right {
				transform: rotate(180deg);
				-webkit-transform: rotate(180deg);
			}

			#shortcut .ci-right s {
				position: relative;
				top: -7px;
				text-decoration: none;
			}

			#shortcut .dorpdown-layer {
				display: none;
				position: absolute;
				line-height: 24px;
				width: 301px;
				padding: 10px 0 10px 10px;
				top: 30px;
				background: #fff;
				border: 1px solid #ddd;
			}

			#shortcut li.dorpdown:hover .dorpdown-layer {
				display: block;
			}

			#shortcut #ttbar-mycity .dd-spacer {
				left: 0;
				width: 98px;
			}

			#shortcut .dd-spacer {
				position: absolute;
				top: -7px;
				height: 10px;
				background: #fff;
				overflow: hidden;
			}

			#shortcut #ttbar-mycity .item {
				float: left;
				width: 60px;
				padding: 2px 0;
			}

			#shortcut #ttbar-mycity .item a {
				float: left;
				padding: 0 8px;
			}

			a.selected {
				background: #C81623;
				color: #fff;
			}

			#shortcut .item a:hover {
				background: #F4F4F4;
			}

			.fr {
				float: right;
			}

			#shortcut #ttbar-login {
				margin-right: 10px;
			}

			#shortcut #ttbar-login .link-login {
				font-family: "verdana,simsun";
			}

			#shortcut .style-red {
				color: #C81623;
			}

			#shortcut li.spacer {
				width: 1px;
				height: 12px;
				margin-top: 9px;
				padding: 0;
				background: #ddd;
				overflow: hidden;
			}

			#ttbar-myjd .dorpdown-layer {
				width: 280px;
			}

			#ttbar-myjd .userinfo {
				padding: 10px 0 10px 15px;
				overflow: hidden;
			}

			#ttbar-myjd .u-pic {
				float: left;
				margin-right: 10px;
			}

			#ttbar-myjd .u-pic img {
				border-radius: 50%;
				-moz-border-radius: 50%;
				-webkit-border-radius: 50%;
			}

			#ttbar-myjd .u-name {
				padding: 6px 0 0;
				font-weight: 700;
			}

			#ttbar-myjd .otherlist {
				width: 255px;
				padding: 0 0 0 15px;
				margin: 5px 0;
				overflow: hidden;
				margin-bottom: 10px;
			}

			#ttbar-myjd .otherlist .fore1,
			#ttbar-myjd .otherlist .fore2 {
				float: left;
				width: 126px;
			}

			#ttbar-myjd .dd-spacer {
				left: 0;
				width: 82px;
			}

			#shortcut #ttbar-apps .dt {
				padding-left: 25px;
				padding-right: 25px;
			}

			#shortcut #ttbar-myjd .dt,
			#shortcut #ttbar-atte .dt,
			#shortcut #ttbar-serv .dt,
			#shortcut #ttbar-navs .dt {
				width: 49px;
				padding-right: 25px;
			}

			.cw-icon .i,
			.cw-icon i {
				display: block;
				position: absolute;
				overflow: hidden;
			}

			#shortcut #ttbar-apps .dt .ci-left {
				top: 5px;
				left: 7px;
				width: 15px;
				height: 20px;
				background: url(img/jd2015img.png) 0 0 no-repeat;
			}

			#shortcut #ttbar-apps:hover .dt .ci-left {
				background: url(img/jd2015img.png) 0 -25px no-repeat;
			}

			#shortcut #ttbar-apps .dd-inner {
				position: relative;
				width: 250px;
				height: 195px;
				overflow: hidden;
				background: url(img/top/571497daNe857f9ed.png);
			}

			#ttbar-apps .dd-spacer {
				left: 0;
				height: 7px;
				width: 98px;
			}

			#shortcut #ttbar-atte .dd-spacer,
			#shortcut #ttbar-serv .dd-spacer {
				left: 0;
				height: 7px;
				width: 82px;
			}

			#shortcut #ttbar-apps .dd {
				width: 250px;
			}

			#shortcut #ttbar-apps .dd a {
				display: block;
				position: absolute;
				width: 56px;
				height: 44px;
				overflow: hidden;
				text-indent: -500px;
			}

			#shortcut #ttbar-apps .dd .link {
				width: 100px;
				height: 20px;
				overflow: hidden;
			}

			#shortcut #ttbar-apps .dd .link1,
			#shortcut #ttbar-apps .dd .link2,
			#shortcut #ttbar-apps .dd .link3 {
				left: 92px;
				top: 6px;
				background-position: 0 -44px;
			}

			#shortcut #ttbar-apps .dd .link3 {
				top: 104px;
				background-position: -1px -66px;
			}

			#shortcut #ttbar-apps .dd .link4,
			#shortcut #ttbar-apps .dd .link5 {
				left: 99px;
				top: 23px;
				width: 136px;
				color: #c21a21;
				text-indent: 0;
				cursor: default;
			}

			#shortcut #ttbar-apps .dd .link5 {
				top: 120px;
			}

			#shortcut #ttbar-apps .jdapp-ios,
			#shortcut #ttbar-apps .wyapp-ios {
				top: 46px;
				left: 92px;
			}

			#shortcut #ttbar-apps .jdapp-android,
			#shortcut #ttbar-apps .wyapp-android {
				top: 46px;
				left: 147px;
			}

			#shortcut #ttbar-apps .jdapp-ipad,
			#shortcut #ttbar-apps .wyapp-ipad {
				width: 45px;
				top: 46px;
				left: 202px;
			}

			#shortcut #ttbar-apps .wyapp-android,
			#shortcut #ttbar-apps .wyapp-ios {
				top: 143px;
			}

			#shortcut #ttbar-atte .dt,
			#shortcut #ttbar-serv .dt {
				width: 49px;
				padding-right: 25px;
			}

			#shortcut #ttbar-atte .dd,
			#shortcut #ttbar-serv .dd {
				width: 82px;
				padding-bottom: 8px;
			}

			#shortcut #ttbar-atte .dd {
				padding-left: 0;
			}

			#shortcut #ttbar-serv .dd {
				width: 170px;
			}

			#shortcut #ttbar-serv .item-business,
			#shortcut #ttbar-serv .item-client {
				font-weight: 700;
				padding-left: 10px;
			}

			#shortcut #ttbar-atte .item,
			#shortcut #ttbar-serv .item {
				display: inline-block;
				width: 70px;
				padding-left: 15px;
			}

			#shortcut #ttbar-serv .item {
				padding-left: 10px;
			}

			#shortcut #ttbar-serv .item-business {
				border-top: 1px dotted #ccc;
				padding-top: 5px;
				margin-top: 5px;
			}

			#shortcut #ttbar-navs .dd-spacer {
				right: 0px;
				height: 7px;
				width: 82px;
			}

			#shortcut #ttbar-navs dt {
				font-size: 14px;
				font-weight: 700;
				margin-bottom: 6px;
			}

			#shortcut #ttbar-navs .dt {
				width: 49px;
				padding-right: 25px;
			}

			#shortcut #ttbar-navs .dd {
				right: 1px;
				width: 1210px;
				padding: 20px 0 16px;
			}

			#shortcut #ttbar-navs dl {
				float: left;
				width: 201px;
				padding-left: 20px;
				border-left: 1px solid #ddd;
			}

			#shortcut #ttbar-navs dl {
				width: 259px;
			}

			#shortcut #ttbar-navs dl.fore1 {
				border-left: none;
				width: 347px;
			}

			#shortcut #ttbar-navs .fore2 {
				display: block;
			}

			#shortcut #ttbar-navs .item {
				float: left;
				width: 100px;
			}

			#shortcut #ttbar-navs .item {
				width: 86px;
			}

			/*最上面一条结束*/
			/*第二条div*/
			#nav {
				position: relative;
				height: 80px;
				width: 100%;
				background-color: #e2231a;
			}

			#nav .w {
				background-color: #e2231a;
			}

			body .w {
				width: 1210px;
			}

			#nav .logo {
				position: relative;
				float: left;
				width: 272px;
				height: 80px;
				overflow: hidden;
			}

			#nav .logo a {
				text-decoration: none;
				color: #fff;
			}

			#nav .logo .fore1 {
				float: left;
				margin-right: 10px;
				width: 158px;
				height: 80px;
				background: url(//misc.360buyimg.com/user/myjd/lib/1.0.0/widget/global/i/logo_2017.png) no-repeat;
			}

			#nav .logo .fore2 {
				float: left;
				font-size: 20px;
				font-family: "Microsoft YaHei";
				margin: 20px 0 0 6px;
				height: 22px;
			}

			#nav .logo .fore3 {
				float: left;
				margin: 5px 0 0;
				color: #ffb2b2;
				border: 1px solid #ffb2b2;
				height: 18px;
				line-height: 18px;
				padding: 0 10px;
				-webkit-border-radius: 10px;
				-moz-border-radius: 10px;
				border-radius: 10px;
			}

			#nav .navitems {
				float: left;
				height: 36px;
				width: 342px;
				line-height: 36px;
				padding: 22px 0;
				margin: 0 0 0 30px;
				font-size: 14px;
			}

			#nav .navitems ul {
				display: inline-block;
				display: block;
			}

			ol,
			ul {
				list-style: none;
			}

			#nav .navitems li {
				float: left;
				margin: 0 20px 0 0;
			}

			li {
				list-style: none;
			}

			#nav .navitems li.fore-3 {
				margin: 0;
			}

			#nav .navitems li.fore-4 {
				margin-right: 5px;
			}

			#nav .navitems a {
				color: #fff;
				position: relative;
			}

			#nav .navitems .dl {
				position: relative;
			}

			#nav .navitems .dl .dt {

				white-space: nowrap;
				height: 18px;
				line-height: 18px;
				padding: 9px 16px;
				width: 74px;
			}

			#nav .navitems .dl .dt span {
				color: #fff;
			}

			#nav .navitems .dl .dt b {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
				width: 9px;
				height: 6px;
				overflow: hidden;
				margin-left: 5px;
				background: url(img/icon.png) 0 -120px no-repeat;
				-webkit-transition: transform .2s ease-in 0s;
				-moz-transition: transform .2s ease-in 0s;
				transition: transform .2s ease-in 0s;
			}

			#nav .navitems .dl .dd {
				display: none;
				/*color: #E45050;*/
				position: absolute;
				top: 34px;
				left: 0;
				background-color: #fff;
				border: 1px solid #ddd;
				border-top: 0;
				font-size: 12px;
				z-index: 1;
			}

			#nav .navitems .dl:hover .dd {
				display: block;
			}

			#nav .navitems .dl:hover b {
				transform: rotate(180deg);
				color: #000;
			}

			#nav .navitems .dl:hover .dt {
				background: #FFFFFF;
			}

			#nav .navitems .dl:hover .myjd-set {
				color: #000;
			}

			#nav .navitems .dl myjd-info:hover .dt {
				background: #FFFFFF;
			}

			#nav .navitems .dl myjd-info:hover .myjd-set {
				color: #000;
			}

			#nav .navitems .dl .dd a {
				display: block;
				color: #000;
				text-decoration: none;
				width: 88px;
				padding: 0 0 0 16px;
				line-height: 30px;
			}

			#nav .navitems li.fore-4 {
				margin-right: 5px;
			}

			#nav .navitems .myjd-info {
				position: relative;
			}

			#nav .navitems li.fore-4 .dl .dt {
				width: 56px;
			}

			#nav .navitems li.fore-4 .dl .dd a {
				width: 70px;
			}

			#nav .nav-r {
				float: right;
				width: 340px;
				height: 61px;
				margin-right: 5px;
			}

			#nav .nav-r #search-2014 #shelper {
				width: 338px;
				top: 32px;
			}

			#shelper {
				overflow: hidden;
				position: absolute;
				top: 36px;
				left: 0;
				width: 379px;
				border: 1px solid #CCC;
				background: #fff;
			}

			.hide {
				display: none;

			}

			#search {
				position: relative;
				z-index: 11;
				float: left;
				width: 186px;
				margin-top: 25px;
			}

			#nav .nav-r #search .form {
				width: auto;
			}

			#search .form {
				width: 462px;
				height: 36px;
			}

			#nav .nav-r #search .text {
				width: 120px;
				border: 0;
			}

			#search .text {
				float: left;
				width: 370px;
				height: 24px;
				line-height: 24px;
				color: #666;
				padding: 4px;
				margin-bottom: 4px;
				border-width: 2px 0 2px 2px;
				border-color: #B61D1D;
				border-style: solid;
				outline: 0;
				font-size: 14px;
				font-family: "microsoft yahei";
			}

			#nav .nav-r #search .button {
				width: 56px;
				font-size: 12px;
				height: 32px;
				color: #333;
				background-color: #f7f7f7;
			}

			#search .button {
				float: left;
				width: 82px;
				height: 36px;
				background: #B61D1D;
				border: none;
				line-height: 1;
				color: #fff;
				font-family: "Microsoft YaHei";
				font-size: 16px;
				cursor: pointer;
			}

			.cw-icon {
				position: relative;
				cursor: default;
				zoom: 1;
			}

			#nav .nav-r #settleup {
				float: right;
				margin-right: 0;
			}

			#settleup {
				float: right;
				z-index: 11;
				height: 36px;
				margin-top: 25px;
			}

			.dorpdown {
				position: relative;
			}

			#nav .nav-r #settleup .cw-icon {
				height: 30px;
				border: 1px solid #fff;
			}

			#settleup .cw-icon {
				width: 75px;
				height: 34px;
				border: 1px solid #DFDFDF;
				padding: 0 28px 0 36px;
				background: #F9F9F9;
				text-align: center;
				line-height: 34px;
			}

			#nav .nav-r #settleup .ci-left {
				top: 7px;
			}

			#settleup .ci-left {
				top: 9px;
				left: 18px;
				width: 18px;
				height: 16px;
				background: url(img/jd2015img.png) 0 -58px no-repeat;
			}

			.cw-icon .i,
			.cw-icon i {
				display: block;
				position: absolute;
				overflow: hidden;
			}

			em,
			i,
			u {
				font-style: normal;
			}

			#settleup .ci-right {
				top: 11px;
				right: 10px;
				width: 7px;
				height: 13px;
				overflow: hidden;
				font: 400 13px/13px simsun;
				color: #999;
			}

			#nav .nav-r #settleup .ci-right {
				top: 9px;
			}

			#settleup .ci-count {
				position: absolute;
				top: -4px;
				left: 104px;
				display: inline-block;
				*zoom: 1;
				*display: inline;
				padding: 1px 2px;
				font-size: 12px;
				line-height: 12px;
				color: #fff;
				background-color: #c81623;
				border-radius: 7px 7px 7px 0;
				min-width: 12px;
				text-align: center;
			}

			.emph-wrap .emph-tips {
				height: 30px;
				line-height: 30px;
				background: #fff;
			}

			.root61 .w,
			.w1210 .w {
				width: 1210px;
			}

			.w {
				width: 990px;
				margin: 0 auto;
			}

			.breadcrumb {
				height: 50px;
				overflow: hidden;
				line-height: 50px;
				vertical-align: baseline;
			}

			.dingdangzhuangtai {
				position: relative;
				width: 1210px;
				height: 324px;
				border: 1px solid #000;
				border-top: 5px solid #71b247;
			}

			.state-locl {
				width: 325px;
				height: 315px;
				position: relative;
				text-align: center;
				border-right: 1px solid #666666;
			}

			.state-locl .state-top {
				position: absolute;
				color: #999;
				top: 20px;
				left: 100px;

			}

			.state-locl .state-txt {
				position: absolute;
				font-size: 24px;
				font-weight: 1500;
				color: #71b247;
				top: 70px;
				left: 110px;
			}

			.state-locl .btn-1 {
				width: 90px;
				height: 25px;
				position: absolute;
				left: 115px;
				top: 140px;
				font-size: 12px;
				border: 1px solid #999999;
				background-color: #F5F5F5;

			}

			.state-locl .btn-9 {
				width: 90px;
				height: 25px;
				position: absolute;
				left: 115px;
				top: 180px;
				font-size: 12px;
				border: 1px solid #999999;

			}

			.state-btns a {
				display: block;
				margin: 10px auto 0;
			}

			.state-locl .btn-print {
				position: absolute;
				top: 270px;
				left: 135px;
			}

			.state-rocl {
				width: 880px;
				height: 305px;

				position: absolute;
				top: 200px;
				left: 410px;
			}

			.state-rocl .state-rtop {
				position: absolute;
				top: 10px;
				left: 10px;
				color: #999999;
			}

			.state-rcenter {
				position: absolute;
				height: 145px;
				width: 880px;

				top: 100px;
			}

			.state-rcenter .ready1img {
				position: absolute;
				width: 30px;
				height: 30px;
				left: 30px;
			}

			.state-rcenter .ready1img1 {
				position: absolute;
				left: 100px;
				height: 30px;
				width: 50px;
			}

			.state-rcenter .ready2img {
				position: absolute;
				width: 30px;
				height: 30px;
				left: 200px;
			}

			.state-rcenter .ready2img1 {
				position: absolute;
				left: 275px;
				height: 30px;
				width: 50px;
			}

			.state-rcenter .ready3img {
				position: absolute;
				width: 30px;
				height: 30px;
				left: 380px;
			}

			.state-rcenter .ready3img1 {
				position: absolute;
				left: 455px;
				height: 30px;
				width: 50px;
			}

			.state-rcenter .ready4img {
				position: absolute;
				width: 30px;
				height: 30px;
				left: 540px;
			}

			.state-rcenter .ready4img1 {
				position: absolute;
				left: 635px;
				height: 30px;
				width: 50px;
			}

			.state-rcenter .ready5img {
				position: absolute;
				width: 30px;
				height: 30px;
				left: 745px;
			}

			.state-rcenter .ready6 {
				position: absolute;
			}

			.ready6 .text1 {
				position: absolute;
				top: 50px;
				left: 20px;
				width: 100px;
			}

			.ready6 .text2 {
				position: absolute;
				top: 50px;
				left: 190px;
				width: 100px;
			}

			.ready6 .text3 {
				position: absolute;
				top: 50px;
				left: 370px;
				width: 100px;
			}

			.ready6 .text4 {
				position: absolute;
				top: 50px;
				left: 530px;
				width: 100px;
			}

			.ready6 .text5 {
				position: absolute;
				top: 50px;
				left: 740px;
				width: 100px;
			}

			.state-youbian {
				position: absolute;
				top: -200px;
				left: -80px;

			}

			.state-bottom {
				position: absolute;
				bottom: 10px;
				left: ;
			}
			.state-bottom .bottom-img {
				height: 20px;
				width: 20px;
				
			
			}
		</style>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {

				var $mt_li = $("div.mt li");
				$mt_li.click(function() {
					$(this).addClass("selected");
					//去掉其他的高亮
					$(this).siblings().removeClass("selected");
					//让对应的div显示
					//首先获得点击的第几个li
					var checkedLiIndex = $mt_li.index($(this));
					$("div.m>div").eq(checkedLiIndex).show();
					$("div.m>div").eq(checkedLiIndex).siblings().hide();
				});
			});
		</script>

	</head>

	<body>
		<!--第一条div-->
		<div id="shortcut">
			<div class="w">
				<ul class="fl">
					<li class="dorpdown" id="ttbar-mycity">
						<div class="dt cw-icon area-text-wrap">
							<i class="ci-right"><s>◇</s></i> 送至：
							<span class="area-text" title="北京">北京</span>
						</div>

						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="area-content-wrap">
								<div class="area-content">
									<div class="area-content-list">
										<div class="item">
											<a href="#" class="selected">北京</a>
										</div>
										<div class="item">
											<a href="#">上海</a>
										</div>
										<div class="item">
											<a href="#">天津</a>
										</div>
										<div class="item">
											<a href="#">重庆</a>
										</div>
										<div class="item">
											<a href="#">河北</a>
										</div>
										<div class="item">
											<a href="#">山西</a>
										</div>
										<div class="item">
											<a href="#">河南</a>
										</div>
										<div class="item">
											<a href="#">辽宁</a>
										</div>
										<div class="item">
											<a href="#">吉林</a>
										</div>
										<div class="item">
											<a href="#">黑龙江</a>
										</div>
										<div class="item">
											<a href="#">内蒙古</a>
										</div>
										<div class="item">
											<a href="#">江苏</a>
										</div>
										<div class="item">
											<a href="#">山东</a>
										</div>
										<div class="item">
											<a href="#">安徽</a>
										</div>
										<div class="item">
											<a href="#">浙江</a>
										</div>
										<div class="item">
											<a href="#">福建</a>
										</div>
										<div class="item">
											<a href="#">湖北</a>
										</div>
										<div class="item">
											<a href="#">湖南</a>
										</div>
										<div class="item">
											<a href="#">广东</a>
										</div>
										<div class="item">
											<a href="#">广西</a>
										</div>
										<div class="item">
											<a href="#">江西</a>
										</div>
										<div class="item">
											<a href="#">四川</a>
										</div>
										<div class="item">
											<a href="#">海南</a>
										</div>
										<div class="item">
											<a href="#">贵州</a>
										</div>
										<div class="item">
											<a href="#">云南</a>
										</div>
										<div class="item">
											<a href="#">西藏</a>
										</div>
										<div class="item">
											<a href="#">陕西</a>
										</div>
										<div class="item">
											<a href="#">甘肃</a>
										</div>
										<div class="item">
											<a href="#">青海</a>
										</div>
										<div class="item">
											<a href="#">宁夏</a>
										</div>
										<div class="item">
											<a href="#">新疆</a>
										</div>
										<div class="item">
											<a href="#">台湾</a>
										</div>
										<div class="item">
											<a href="#">香港</a>
										</div>
										<div class="item">
											<a href="#">澳门</a>
										</div>
										<div class="item">
											<a href="#">钓鱼岛</a>
										</div>
										<div class="item">
											<a href="#">海外</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				<ul class="fr">
					<li class="fore1" id="ttbar-login">
						<a href="" class="link-login">${frontuser.username}</a>&nbsp;&nbsp;
						<a href="login?action=frontLoginOut" class="link-regist style-red">退出</a>
					</li>
					<li class="spacer"></li>
					<li class="fore2">
						<div class="dt">
							<a  href="OrderServlet?action=queryMyOrder">我的订单</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore3 dorpdown" id="ttbar-myjd">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>
							<a target="#" href="">我的京东</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="userinfo">
								<div class="u-pic">
									<a href="#"><img src="img/top/2.jpg" width="60" height="60"></a>
								</div>
								<div class="u-name u-login">
									<a href="#" class="link-login">小犄角</a>
								</div>
								<div class="u-extra">
									<a href="" target="_blank">优惠券<span id="num-ticket"></span></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
									<a href="" target="_blank">消息<span id="num-tip"></span></a>
								</div>
							</div>
							<div class="otherlist">
								<div class="fore1">
									<div class="item">
										<a href="" clstag="" target="_blank">待处理订单<span id="num-unfinishedorder"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">咨询回复<span id="num-consultation"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">降价商品<span id="num-reduction"></span></a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">返修退换货</a>
									</div>
								</div>
								<div class="fore2">
									<div class="item">
										<a href="" clstag="" target="_blank">我的关注</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的京豆</a>
									</div>
									<div class="item">
										<a href="" clstag="" target="_blank">我的理财</a>
									</div>
									<div class="item baitiao">
										<a href="" target="_blank">京东白条</a>
									</div>
								</div>
							</div>
							<div class="viewlist" style="display:none;">
								<div class="smt">
									<h4>我的足迹</h4>
									<span class="extra">
										<a target="_blank" href="">更多&nbsp;&gt;</a>
									</span>
								</div>
								<div class="smc"></div>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore4">
						<div class="dt">
							<a target="_blank" href="">京东会员</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore5">
						<div class="dt">
							<a target="_blank" href="">企业采购</a>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore6 dorpdown" id="ttbar-apps">
						<div class="dt cw-icon">
							<i class="ci-left"></i>
							<i class="ci-right"><s>◇</s></i>
							<a target="_blank" href="">手机京东</a>
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-apps-main">
								<a href="" class="link link1" target="_blank">京东客户端</a>
								<a href="" class="link link3" target="_blank">京东钱包客户端</a>
								<a href="" class="link link4">新人专享188元大礼包</a>
								<a href="" class="link link5">扫一扫封顶立减999元</a>
								<a href="" class="applink jdapp-ios" target="_blank">京东客户端ios版</a>
								<a href="" class="applink jdapp-android" target="_blank">京东客户端android版</a>
								<a href="" class="applink jdapp-ipad" target="_blank">京东客户端ipad版</a>
								<a href="" class="applink wyapp-ios" target="_blank">京东钱包客户端ios版</a>
								<a href="" class="applink wyapp-android" target="_blank">京东钱包客户端android版</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore7 dorpdown" id="ttbar-atte">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>关注京东
						</div>
						<div class="dd dorpdown-layer"></div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="dd-inner" id="ttbar-atte-main">
								<img src="img/top/54c84f72Ncc1a02a2.jpg" alt="关注京东">
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore8 dorpdown" id="ttbar-serv">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>客户服务
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<div class="item-client">客户</div>
							<div class="item">
								<a href="" target="_blank" true="">帮助中心</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">售后服务</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">在线客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">意见建议</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">电话客服</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">客服邮箱</a>
							</div>
							<div class="item-business">商户</div>
							<div class="item">
								<a href="" target="_blank" true="">京东商学院</a>
							</div>
							<div class="item">
								<a href="" target="_blank" true="">商家入驻</a>
							</div>
						</div>
					</li>
					<li class="spacer"></li>
					<li class="fore9 dorpdown" id="ttbar-navs" clstag="h|keycount|2015|01j" data-load="1">
						<div class="dt cw-icon">
							<i class="ci-right"><s>◇</s></i>网站导航
						</div>
						<div class="dd dorpdown-layer">
							<div class="dd-spacer"></div>
							<dl class="fore1"> <dt>特色主题</dt>
								<dd>
									<div class="item">
										<a href="//pinpaijie.jd.com/" target="_blank">品牌街</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/" target="_blank">好物100</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/presale.html " target="_blank">京东预售</a>
									</div>
									<div class="item">
										<a href="//zan.jd.com" target="_blank">尖er货</a>
									</div>
									<div class="item">
										<a href="//xinpin.jd.com/new.html" target="_blank">京东首发</a>
									</div>
									<div class="item">
										<a href="//tuan.jd.com/homevirtual-beijing.html" target="_blank">今日团购</a>
									</div>
									<div class="item">
										<a href="//youhuiquan.jd.com/" target="_blank">优惠券</a>
									</div>
									<div class="item">
										<a href="//red.jd.com/" target="_blank">闪购</a>
									</div>
									<div class="item">
										<a href="//vip.jd.com/" target="_blank">京东会员</a>
									</div>
									<div class="item">
										<a href="//miao.jd.com/" target="_blank">秒杀</a>
									</div>
									<div class="item">
										<a href="//ding.jd.com/" target="_blank">定期送</a>
									</div>
									<div class="item">
										<a href="//diy.jd.com/" target="_blank">装机大师</a>
									</div>
									<div class="item">
										<a href="//hao.jd.com/hwy.html" target="_blank">新奇特</a>
									</div>
									<div class="item">
										<a href="//try.jd.com/" target="_blank">京东试用</a>
									</div>
									<div class="item">
										<a href="//gift.jd.com/" target="_blank">礼品购</a>
									</div>
									<div class="item">
										<a href="//smarthome.jd.com/" target="_blank">智能馆</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/tp6KfYH7wb.html" target="_blank">玩bigger</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/rKhJit1fWVDR.html" target="_blank">大牌免息</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/3je8ZTCxNl6SusId.html " target="_blank">北京老字号</a>
									</div>
								</dd>
							</dl>
							<dl class="fore2"> <dt>行业频道</dt>
								<dd>
									<div class="item">
										<a href="//channel.jd.com/fashion.html" target="_blank">服装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/electronic.html" target="_blank">家用电器</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/computer.html" target="_blank">电脑办公</a>
									</div>
									<div class="item">
										<a href="//shouji.jd.com/" target="_blank">手机</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/beauty.html" target="_blank">美妆馆</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/chaoshi.html" target="_blank">食品</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/digital.html" target="_blank">数码</a>
									</div>
									<div class="item">
										<a href="//baby.jd.com/" target="_blank">母婴</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/jiazhuang.html" target="_blank">家装城</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/sports.html" target="_blank">运动户外</a>
									</div>
									<div class="item">
										<a href="http://car.jd.com" target="_blank">整车</a>
									</div>
									<div class="item">
										<a href="//book.jd.com/" target="_blank">图书</a>
									</div>
									<div class="item">
										<a href="//nong.jd.com/" target="_blank">农资频道</a>
									</div>
									<div class="item">
										<a href="//smart.jd.com/" target="_blank">京东智能</a>
									</div>
								</dd>
							</dl>
							<dl class="fore3"> <dt>生活服务</dt>
								<dd>
									<div class="item">
										<a href="//z.jd.com/" target="_blank">京东众筹</a>
									</div>
									<div class="item">
										<a href="//baitiao.jd.com/activity/third" target="_blank">白条</a>
									</div>
									<div class="item">
										<a href="https://www.jdpay.com/" target="_blank">京东钱包</a>
									</div>
									<div class="item">
										<a href="//trade.jr.jd.com/myxjk/jrbincome.action" target="_blank">京东小金库</a>
									</div>
									<div class="item">
										<a href="//licai.jd.com/" target="_blank">理财</a>
									</div>
									<div class="item">
										<a href="//chongzhi.jd.com/" target="_blank">话费</a>
									</div>
									<div class="item">
										<a href="//trip.jd.com/" target="_blank">旅行</a>
									</div>
									<div class="item">
										<a href="//caipiao.jd.com/" target="_blank">彩票</a>
									</div>
									<div class="item">
										<a href="//game.jd.com/" target="_blank">游戏</a>
									</div>
									<div class="item">
										<a href="//jipiao.jd.com/" target="_blank">机票酒店</a>
									</div>
									<div class="item">
										<a href="//movie.jd.com/" target="_blank">电影票</a>
									</div>
									<div class="item">
										<a href="//jiaofei.jd.com/" target="_blank">水电煤</a>
									</div>
									<div class="item">
										<a href="//daojia.jd.com/html/welcome.html" target="_blank">京东到家</a>
									</div>
									<div class="item">
										<a href="//smartcloud.jd.com/app" target="_blank">京东微联</a>
									</div>
									<div class="item">
										<a href="//try-smart.jd.com/" target="_blank">京东众测</a>
									</div>
								</dd>
							</dl>
							<dl class="fore4"> <dt>更多精选</dt>
								<dd>
									<div class="item">
										<a href="http://group.jd.com" target="_blank">京东社区</a>
									</div>
									<div class="item">
										<a href="//mobile.jd.com/index.do" target="_blank">京东通信</a>
									</div>
									<div class="item">
										<a href="//read.jd.com/" target="_blank">在线读书</a>
									</div>
									<div class="item">
										<a href="//o.jd.com/market/index.action" target="_blank">京东E卡</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/site/20000121/20000032.htm" target="_blank">智能社区</a>
									</div>
									<div class="item">
										<a href="http://group.jd.com/index/20000001.htm" target="_blank">游戏社区</a>
									</div>
									<div class="item">
										<a href="//you.jd.com/index.html?entrance=jd_home" target="_blank">京友邦</a>
									</div>
									<div class="item">
										<a href="//sale.jd.com/act/wQTpIm7GnXE.html" target="_blank">卖家入驻</a>
									</div>
									<div class="item">
										<a href="//b.jd.com/" target="_blank">企业采购</a>
									</div>
									<div class="item">
										<a href="//fw.jd.com/" target="_blank">服务市场</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/XCDLzm.html" target="_blank">乡村招募</a>
									</div>
									<div class="item">
										<a href="//zhaomu.jd.com/intro.html" target="_blank">校园加盟</a>
									</div>
									<div class="item">
										<a href="//channel.jd.com/office.html" target="_blank">办公生活馆</a>
									</div>
									<div class="item">
										<a href="//ipr.jd.com/" target="_blank">知识产权维权</a>
									</div>
									<div class="item">
										<a href="//en.jd.com/" target="_blank">English Site</a>
									</div>
								</dd>
							</dl>
						</div>
					</li>
				</ul>

			</div>

		</div>

		<!--第二条div-->
		<div id="nav">
			<div class="w">
				<div class="logo">
					<a class="fore1" href="#"></a>
					<a class="fore2" href="#">我的京东</a>
					<a class="fore3" href="CategoryServlet?action=goJdIndex&target=/user/welcome&clevel=1">返回京东首页</a>
				</div>
				<div class="navitems">
					<ul>
						<li class="fore-1">
							<a  href="CategoryServlet?action=goJdIndex&target=/user/welcome&clevel=1">首页</a>
						</li>
						<li class="fore-3">
							<div class="dl">
								<div class="dt">
									<span class="myjd-set">账户设置</span>
									<b></b>
								</div>
								<div class="dd">

									<a href="#" target="_self"><span>个人信息</span></a>

									<a href="#" target="_self"><span>账户安全</span></a>

									<a href="#" target="_self"><span>账号绑定</span></a>

									<a href="#" target="_self"><span>我的级别</span></a>

									<a href="#" target="_self"><span>收货地址</span></a>

									<a href="#" target="_self"><span>分享绑定</span></a>

									<a href="#" target="_self"><span>邮件订阅</span></a>

									<a href="#" target="_self"><span>消费记录</span></a>

									<a href="#" target="_blank"><span>应用授权</span></a>

									<a href="#" target="_blank"><span>快捷支付</span></a>

									<a href="#" target="_self"><span>增票资质</span></a>
									<a href="#" target="_self"><span>采购需求单</span></a>
								</div>
							</div>
						</li>
						<li class="fore-4">
							<div class="dl myjd-info">
								<div class="dt">
									<span class="myjd-set">社区</span>
									<b></b>
								</div>
								<div class="dd">
									<a target="_blank"><span>个人主页</span></a>
									<a href="#" target="_self"><span>我的活动</span></a>

									<a href="#" target="_self"><span>我的圈子</span></a>

									<a href="#" target="_self"><span>我的帖子</span></a>
								</div>
							</div>
						</li>
						<li class="fore-5">
							<a href="#" target="_self">消息<i></i></a>
						</li>
					</ul>
				</div>
				<div class="nav-r">
					<div id="search">
						<ul style="display: none;" id="shelper" class="hide"></ul>
						<div class="form">
							<input style="color: rgb(153, 153, 153);" id="key" class="text" type="text"></input>
							<button class="button cw-icon" type="button"><i></i>搜索</button>
						</div>
					</div>
					<div id="settleup" class="dorpdown">
						<div class="cw-icon">
							<i class="ci-left"></i>
							<i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">${productsList.size()}</i>
							<a  href="ShoppingCartServlet?action=queryShoppingCart">我的购物车</a>
						</div>
					</div>

				</div>
				<div class="clr"></div>
			</div>
		</div>
		<!--container-->
		<div id="container">
			<div class="emph-wrap">
				<div class="w">
					<div class="emph-tips">
						<b></b>安全提醒：为了您的财产安全，<strong>不要点击陌生链接、不要向陌生人转账</strong>或透漏银行卡和验证码信息，<strong>谨防诈骗</strong>！
					</div>
				</div>
			</div>
			<div class="w">
				<div class="main">
					<div class="breadcrumb">
						<a href="">我的京东</a>
						<span>
							"&nbsp;>&nbsp;"
							<a href="">订单中心</a>
							"&nbsp;>&nbsp;"
							<strong>订单:${out_trade_no}</strong>
						</span>
					</div>
					<div class="dingdangzhuangtai">
						<div class="mc state-cont">
							<div class="state-locl">
								<div class="state-top">
									订单号：${out_trade_no}
								</div>
								<h3 class="state-txt">付款成功</h3>
								<br>
								<a  href="order/queryMyOrder" class="btn-1">查看订单详情</a>
								<br>
								<a target="_blank" href="" class="btn-9" clstag="">修改订单</a><br>
								<a class="btn-print" href="" target="_blank" clstag="" style="display: inline;">
									<b></b>
									打印订单
								</a>
							</div>
							<div class="state-youbian">
								<div class="state-rocl">
									<div class="state-rtop">
										尊敬的客户，您已付款成功，订单稍后将进入出库状态，请您耐心等待。
									</div>
									<div class="state-rcenter">

										<div class="ready1">
											<img src="img/ready1.png" class="ready1img">
											<img src="img/jingdutiao1.png" class="ready1img1">

										</div>
										<div class="ready2">
											<img src="img/fukuanchenggong.png" class="ready2img">
											<img src="img/jingdutiao2.png" class="ready2img1">

										</div>
										<div class="ready3">
											<img src="img/chuku.png" class="ready3img">
											<img src="img/jingdutiao2.png" class="ready3img1">

										</div>
										<div class="ready4">
											<img src="img/dengdaishouhuo.png" class="ready4img">
											<img src="img/jingdutiao2.png" class="ready4img1">

										</div>
										<div class="ready5">
											<img src="img/wancheng.png" class="ready5img">
										</div>
										<div class="ready6">
											<div class="text1">
												提交订单
											</div>
											<div class="text2">
												付款成功
											</div>
											<div class="text3">
												商品出库
											</div>
											<div class="text4">
												等待收获
											</div>
											<div class="text5">
												完成订单
											</div>
										</div>
									</div>
									<div class="state-bottom">
										完成该订单可能获得:
										<img src="img/jingdou.png" class="bottom-img">京豆
										<img src="img/youhuijuan.png" class="bottom-img">优惠劵
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
