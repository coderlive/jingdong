<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.vo.*" %>
<%@ page import="com.vo.Products" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的京东--我的订单</title>
		<base href="<%=basePath%>">
		<style type="text/css">
			* {
				margin: 0px;
			}
			body {
				font: 12px/150% Arial,Verdana,"\5b8b\4f53";
				color: #666;
				background: #fff;
			}
			a, address, b, big, blockquote, body, center, cite, code, dd, del, div, dl, dt, em, fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, label, legend, li, ol, p, pre, small, span, strong, u, ul, var {
    			margin: 0;
    			padding: 0;
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
    			background-color: #e45050;
			}
			#nav .w {
    			background-color: #e45050;
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
				background: url(img/index.png) no-repeat;
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
			
			ol,ul {
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
				height: 24px;
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
			.cw-icon .i,.cw-icon i {
				display: block;
				position: absolute;
				overflow: hidden;
			}
			em,i,u {
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
			/*container*/
			#container,#container .w {
				background-color: #f5f5f5;
			}
			#content {
				height: 1470px;
				padding-left: 120px;
				padding-top: 20px;
				display: inline-block;
				display: block;
			}
			#sub {
				float: left;
				width: 120px;
				position: relative;
				left: -120px;
			}
			/*左侧导航栏*/
			#menu {
				width: 100px;
				padding-left: 10px;
			}
			#menu dl {
				padding-bottom: 15px;
			}
			#menu dl dt {
				height: 28px;
				line-height: 28px;
				color: #333;
				font-weight: 700;
			}
			#menu dl dd {
				color: #666;
				line-height: 24px;
			}
			#menu dl dd.curr a {
				color: #e4393c;
				font-weight: 700;
			}
			/*左侧导航栏结束*/
			/*main*/
			#main {
				float: left;
				width: 99.9%;
				margin-left: -120px;
				overflow: hidden;
			}
			.mb10 {
				margin-bottom: 10px;
			}
			.mod-main {
				padding: 10px;
				background-color: #fff;
				margin-bottom: 20px;
			}
			.mod-comm {
				padding: 10px 20px 20px;
			}
			
			div.mod-order .mt {
				padding: 10px 0 0;
			}
			.mod-comm .mt {
				padding: 10px 0;
			}
			.mod-main .mt {
				display: inline-block;
				display: block;
				padding: 10px;
			}
			.m, .mb, .mc, .mt, .sm, .smb, .smc, .smt {
    			overflow: hidden;
    			zoom: 1;
			}
			.mod-main .mt h3 {
				float: left;
				font-family: "Microsoft YaHei";
				font-size: 16px;
				color: #333;
				line-height: 20px;
			}
			.mod-comm .mt h3 {
				font-size: 12px;
				color: #666;
				font-family: '\5b8b\4f53';
				line-height: 18px;
			}
			
			.mod-main .mt .extra-r {
				float: right;
			}
			#order02 {
				position: relative;
			}
			.mod-main .mt {
				display: inline-block;
				display: block;
				padding: 10px;
			}
			.mod-comm .mt {
				padding: 10px 0;
			}
			.mod-main .mt .extra-l {
				float: left;
			}
			.root61 div.mod-main .mt .extra-l li {
				padding-right: 20px;
			}
				.lefta-box .mt .extra-l li {
				padding: 0;
				padding-right: 20px;
			}
			
			.mod-main .mt .extra-l li {
				float: left;
				padding-left: 20px;
			}
			div.mod-main .mt .extra-l li a {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
				color: #333;
			}
			/*.mod-main .mt .extra-l li a.curr {
				padding-bottom: 0;
				color: #e4393c;
				border-bottom: 2px solid #e4393c;
				font-weight: 700;
				cursor: pointer;
				text-decoration: none;
			}*/
			div.mt li.selected {
				padding-bottom: 0;
				color: #e4393c;
				border-bottom: 2px solid #e4393c;
				font-weight: 700;
				cursor: pointer;
				text-decoration: none;
			}
			.root61 div.mod-main .mt .extra-l li.fore2 {
				padding-left: 40px;
				margin-left: 20px;
			}
			.root61 div.mod-main .mt .extra-l li {
				padding-right: 20px;
			}
			div.mod-main .mt .extra-l li.fore2 {
				position: relative;
				border-left: 1px dotted #ddd;
				padding: 0 15px;
			}
			div.mod-main .mt .extra-l li a.ftx-03 {
				color: #999;
			}
			.mod-main .mt .extra-r {
				float: right;
			}
			.mt .search {
				position: relative;
				top: -3px;
			}
			.mt .search .itxt {
				float: left;
				width: 158px;
				height: 18px;
				line-height: 18px;
				padding: 2px 5px 3px;
				border: 1px solid #ccc;
			}
			.mt .search .search-btn {
				position: relative;
				float: left;
				width: 52px;
				height: 23px;
				line-height: 99em;
				overflow: hidden;
				border: 1px solid #ddd;
				border-left: 0;
				text-align: center;
				background-color: #f7f7f7;
				background-image: linear-gradient(to bottom, #f7f7f7 0, #f3f2f2 100%);
			}
			.mt .search .default-btn {
				float: left;
				margin-left: -1px;
				width: 50px;
				height: 18px;
				line-height: 18px;
				padding: 2px 0 3px;
				text-align: center;
				border: 1px solid #ddd;
				color: #333;
				border-radius: 2px;
				background-color: #f7f7f7;
				background-image: linear-gradient(to bottom, #f7f7f7 0, #f3f2f2 100%);
			}
			.mod-comm .mc {
				line-height: 20px;
			}
			
			.mod-main .mc {
				overflow: visible;
			}
			.top-search {
				position: relative;
				padding: 20px 0 10px;
				margin: 5px 0 0;
				border-top: 1px solid #f5f5f5;
				z-index: 2;
			}
			
			.top-search .dl {
				display: inline-block;
				display: block;
				margin-bottom: 15px;
				_margin-bottom: 5px;
				position: relative;
			}
			
			.top-search .label {
				float: left;
				width: 60px;
				height: 30px;
				line-height: 30px;
			}
			
			.top-search .dd {
				float: left;
				width: 760px;
				font-size: 0;
			}
			
			.root61 .top-search .dd {
				width: 970px;
			}
			
			.top-search .dd a {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
				padding: 0 8px;
				margin: 0 1px 5px 0;
				height: 30px;
				line-height: 30px;
				font-size: 12px;
			}
			
			.top-search .dd a.curr,.top-search .dd a:hover {
				background: #e4393c;
				color: #fff;
				-webkit-border-radius: 2px;
				-moz-border-radius: 2px;
				border-radius: 2px;
			}
			.order-tb {
				width: 100%;
			}
			
			table {
				border-collapse: collapse;
			}
			.root61 .order-tb .number-col {
				width: 589px;
			}
			
			.root61 .order-tb .consignee-col {
				width: 115px;
			}
			
			.root61 .order-tb .amount-col,
			.root61 .order-tb .status-col {
				width: 110px;
			}
			.order-tb thead th {
				height: 32px;
				line-height: 32px;
				text-align: center;
				background: #f5f5f5;
				color: #666;
				font-weight: 400;
			}
			.order-tb .ordertime-cont {
				
				position: relative;
				float: left;
				z-index: 10;
				width: 138px;
				cursor: pointer;
			}
			.order-tb .ordertime-cont:hover .time-list {
				display: block;
			}
			.order-tb .ordertime-cont:hover .time-txt {
				background: #FFFFFF;
			}
			.order-tb .ordertime-cont:hover b {
				transform: rotate(180deg);
			}
			.order-tb .ordertime-hover .time-txt {
				background: #fff;
				-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
				-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
				box-shadow: 0 0 10px rgba(0, 0, 0, .12);
			}
			
			.order-tb .ordertime-cont .time-txt {
				position: relative;
				height: 30px;
				line-height: 30px;
				text-align: left;
				padding-left: 20px;
				padding-right: 12px;
				border: 1px solid #f5f5f5;
			}
			
			.order-tb .ordertime-cont .time-list {
				position: absolute;
				left: 0;
				top: 30px;
				z-index: 2;
				display: none;
				width: 136px;
				background: #fff;
				border: 1px solid #f5f5f5;
				border-top: 0;
			}
			
			.order-tb .ordertime-hover .time-list {
				display: block;
				-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
				-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .12);
				box-shadow: 0 0 10px rgba(0, 0, 0, .12);
			}
			
			.order-tb .ordertime-hover .time-txt b {
				background-position: -20px -207px;
			}
			
			.order-tb .ordertime-cont .time-txt b {
				position: absolute;
				width: 7px;
				height: 4px;
				right: 18px;
				top: 13px;
				overflow: hidden;
				vertical-align: middle;
				background: url(img/order-icon20150916.png) -37px -207px no-repeat;
			}
			
			.order-tb .ordertime-hover .time-txt .blank {
				display: block;
				position: absolute;
				height: 10px;
				width: 136px;
				top: 21px;
				left: 0;
				background: #fff;
				z-index: 3;
			}
			.order-tb .ordertime-cont .time-list li {
				height: 30px;
				line-height: 30px;
				text-align: left;
			}
			
			.order-tb .ordertime-cont .time-list li a {
				display: block;
				position: relative;
				color: #666;
				height: 30px;
				line-height: 30px;
				padding-left: 20px;
			}
			
			.order-tb .ordertime-cont .time-list li a.curr {
				color: #e4393c;
			}
			.order-tb .order-detail-txt {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
			}
			
			.ac {
				text-align: center;
			}
			.order-tb .deal-state-cont {
				
				position: relative;
				z-index: 10;
				width: 98px;
				cursor: pointer;
			}
			.order-tb .deal-state-cont:hover .state-list {
				display: block;
			}
			.order-tb .deal-state-cont:hover .state-txt {
				background: #FFFFFF;
				color: #000;
			}
			.order-tb .deal-state-cont:hover b {
				transform: rotate(180deg);
			}
			
			.order-tb .deal-state-cont .state-txt {
				position: relative;
				height: 30px;
				line-height: 30px;
				text-align: left;
				padding-left: 20px;
				padding-right: 12px;
				border: 1px solid #f5f5f5;
			}
			.order-tb .deal-state-cont .state-txt b {
				position: absolute;
				width: 7px;
				height: 4px;
				right: 18px;
				top: 13px;
				overflow: hidden;
				vertical-align: middle;
				background:url(img/order-icon20150916.png) -37px -207px no-repeat;
			}
			.order-tb .deal-state-cont .state-list {
				display: none;
				position: absolute;
				left: 0;
				top: 30px;
				z-index: 2;
				display: none;
				width: 96px;
				background: #fff;
				border: 1px solid #f5f5f5;
				border-top: 0;
			}
			.order-tb .deal-state-cont .state-list li {
				height: 30px;
				line-height: 30px;
				text-align: left;
			}
			
			.toolbar .operates {
				position: relative;
				top: 10px;
			}
			
			a.btn-combine,
			a.btn-pay {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				background: #fff;
				border: 1px solid #e4393c;
				color: #e4393c;
				-webkit-border-radius: 2px;
				-moz-border-radius: 2px;
				border-radius: 2px;
				width: 85px;
				height: 18px;
				line-height: 18px;
				padding: 2px 0;
				margin: 3px 0;
				text-align: center;
				font-weight: 700;
			}
			
			a.btn-combine {
				width: 77px;
				font-weight: 400;
			}
			.order-tb .sep-row {
				height: 20px;
			}
			.order-tb .tr-th {
				background: #f5f5f5;
				height: 31px;
				line-height: 31px;
				color: #aaa;
				overflow: hidden;
			}
			.order-tb .tr-th td {
				border-bottom-color: #f5f5f5;
			}
			
			
			.order-tb .tr-th .gap {
				width: 14px;
			}
			
			.order-tb .tr-th span {
				float: left;
				height: 18px;
				line-height: 18px;
				padding: 2px 0 0;
				_display: inline;
			}
			.order-tb .tr-th .dealtime {
				margin-right: 30px;
				_margin-right: 15px;
				font-family: verdana;
			}
			.order-tb .tr-th .number {
				width: 260px;
				font-family: verdana;
			}
			.order-tb .tr-th a {
				color: #333;
			}
			.order-tb .tr-th .tr-operate {
				float: right;
				position: relative;
				margin-right: 15px;
				width: 500px;
				height: 23px;
				overflow: hidden;
			}
			.root61 .order-tb .tr-th .tr-operate {
				width: 608px;
			}
			
			.order-tb .tr-th .order-shop {
				width: 178px;
			}
			
			.order-tb .tr-th span.shop-txt {
				padding: 0;
			}
			
			.order-tb .tr-th .order-shop .shop-txt {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
				max-width: 153px;
				overflow: hidden;
				margin: 0;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			
			.order-tb .tr-th .btn-im,
			.order-tb .tr-th .btn-im-off {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 16px;
				height: 16px;
				margin: 0 0 0 5px;
				overflow: hidden;
				background: url(img/sprite-im.png) l-26px 0 no-repeat;
				vertical-align: middle;
			}
			
			.order-tb .tr-th .btn-im-jd {
				background-position: 0 0;
			}
			
			.order-tb .tr-bd {
				text-align: center;
				vertical-align: top;
			}
			
			.order-tb .tr-bd td {
				padding: 14px 0;
			}
			
			.order-tb tbody td {
				border: 1px solid #e5e5e5;
			}
			
			.order-tb .goods-item {
				display: inline-block;
				display: block;
				float: left;
				width: 340px;
				margin-right: 74px;
			}
			
			.order-tb .goods-item .p-img {
				float: left;
				width: 60px;
				height: 60px;
				border: 1px solid #efefef;
				margin: 0 14px;
				_display: inline;
			}
			
			.order-tb .goods-item .p-msg {
				float: left;
				width: 240px;
			}
			
			.order-tb .goods-number {
				float: left;
				width: 70px;
				text-align: left;
				color: #aaa;
				font-family: verdana;
			}
			
			.order-tb .goods-repair {
				float: right;
				width: 104px;
				text-align: center;
			}
			
			.clear,
			.clr {
				display: block;
				overflow: hidden;
				clear: both;
				height: 0;
				line-height: 0;
				font-size: 0;
			}
			
			.order-tb .tr-bd td {
				padding: 14px 0;
			}
			
			
			.order-tb .tooltip {
				position: relative;
				width: 100px;
				margin: 0 auto;
				z-index: 2;
				cursor: pointer;
			}
			
			.order-tb .consignee {
				color: #333;
			}
			
			.order-tb .consignee .txt {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				white-space: nowrap;
				overflow: hidden;
				max-width: 72px;
				text-overflow: ellipsis;
				vertical-align: middle;
			}
			
			.order-tb .consignee b {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 14px;
				height: 16px;
				background: url(img/order-icon20150916.png) 0 -24px;
				vertical-align: middle;
				margin: 0 0 0 5px;
			}
			.order-tb .goods-item .p-name {
				height: 36px;
				line-height: 18px;
				overflow: hidden;
				color: #333;
				text-align: left;
			}
			
			.order-tb .goods-item .p-extra {
				color: #aaa;
				text-align: left;
			}
			
			.order-tb .goods-item .o-info {
				text-align: left;
				color: #aaa;
			}
			
			.order-tb .goods-item .o-match,
			.order-tb .goods-item .o-similar {
				display: inline-block;
				vertical-align: top;
				cursor: pointer;
			}
			
			.jd-otc,
			.order-tb .goods-item .o-match i,
			.order-tb .goods-item .o-similar i {
				display: inline-block;
				background-image: url(img/sprite-order-icon.png);
				background-repeat: no-repeat;
			}
			
			.order-tb .goods-item .o-match i {
				background-position: -56px 0;
			}
			
			.order-tb .goods-item .o-match i,
			.order-tb .goods-item .o-similar i {
				width: 16px;
				height: 16px;
				margin-right: 5px;
				vertical-align: top;
			}
			
			.order-tb .goods-item .o-match em,
			.order-tb .goods-item .o-similar em {
				display: inline-block;
				vertical-align: top;
				font-style: normal;
			}
			.prompt-01 {
				position: absolute;
				width: 122px;
				border: 1px solid #ddd;
				background: #fff;
				-webkit-box-shadow: 0 0 2px 2px #eee;
				-moz-box-shadow: 0 0 2px 2px #eee;
				box-shadow: 0 0 2px 2px #eee;
				-webkit-border-radius: 1px;
				-moz-border-radius: 1px;
				border-radius: 1px;
				cursor: auto;
			}
			
			.order-tb .tooltip .prompt-02 {
				position: absolute;
				z-index: 1;
				width: 220px;
				right: 90px;
				top: -22px;
				padding: 20px;
				display: none;
				color: #666;
				line-height: 22px;
			}
			
			.prompt-01 .pc {
				display: none;
				background: #fff;
				padding: 0;
				color: #333;
				text-align: left;
				overflow: hidden;
			}
			
			.order-tb .prompt-02 .pc {
				color: #666;
				min-height: 0;
			}
			
			.prompt-01 .p-arrow {
				position: absolute;
				background: url(img/arrow-gray.png) no-repeat;
			}
			
			.order-tb .prompt-01 .p-arrow-left {
				right: -8px;
				top: 25px;
				width: 8px;
				height: 16px;
				background-position: -7px 0;
			}
			
			.order-tb .amount {
				color: #AAA;
			}
			
			.order-tb .status {
				position: relative;
				z-index: 5;
				color: #333;
				line-height: 22px;
			}
			
			.ftx-04,
			.ftx04 {
				color: #ff6c00;
			}
			
			.order-tb .tooltip {
				position: relative;
				width: 100px;
				margin: 0 auto;
				z-index: 2;
				cursor: pointer;
			}
			
			.order-tb .tooltip .auto-icon {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 22px;
				height: 16px;
				margin: 0 3px 0 0;
				overflow: hidden;
				background: url(img/order-icon20150916.png) -48px -24px no-repeat;
				vertical-align: middle;
			}
			
			.order-tb .tooltip .circle-icon {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 7px;
				height: 7px;
				margin: 0 0 0 3px;
				overflow: hidden;
				background: url(img/order-icon20150916.png) 0 -115px no-repeat;
				vertical-align: middle;
			}
			
			.order-tb .prompt-01 .p-tit {
				margin: -10px 0 0 -10px;
				height: 35px;
				line-height: 35px;
				padding: 0 0 0 20px;
				font-weight: 700;
				border-bottom: 1px solid #e3e3e3;
			}
			
			.order-tb .prompt-01 .logistics-cont {
				position: relative;
				margin-left: 15px;
				max-height: 410px;
				overflow-y: auto;
				padding-left: 5px;
				margin-bottom: 20px;
				line-height: 20px;
			}
			
			.order-tb .prompt-01 .logistics-cont li.first {
				color: #e4393c;
			}
			
			.order-tb .prompt-01 .logistics-cont li {
				position: relative;
				overflow: visible;
				width: 340px;
				padding: 15px 0 0 15px;
				border-left: 1px solid #e3e3e3;
			}
			
			.order-tb .prompt-01 .logistics-cont li.first .node-icon {
				background-position: 0 -115px;
			}
			
			.order-tb .prompt-01 .logistics-cont .node-icon {
				display: block;
				position: absolute;
				top: 21px;
				left: -4px;
				width: 8px;
				height: 8px;
				overflow: hidden;
				background: url(img/order-icon20150916.png) -17px -115px no-repeat;
				vertical-align: middle;
			}
			
			.order-tb .status a {
				color: #333;
			}
			
			.ftx-13 {
				color: #aaa;
			}
			
			.order-tb .tr-bd td {
				padding: 14px 0;
			}
			
			
			.order-tb .operate {
				line-height: 22px;
			}
			
			.order-tb .count-time {
				display: none;
				color: #999;
			}
			
			a.btn-combine,
			a.btn-pay {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				background: #fff;
				border: 1px solid #e4393c;
				color: #e4393c;
				-webkit-border-radius: 2px;
				-moz-border-radius: 2px;
				border-radius: 2px;
				width: 85px;
				height: 18px;
				line-height: 18px;
				padding: 2px 0;
				margin: 3px 0;
				text-align: center;
				font-weight: 700;
			}
			
			.order-tb .operate a.a-link {
				color: #333;
			}
			
			div.mod-main .mt .extra-l li em {
				position: relative;
				display: inline-block;
				*display: inline;
				*zoom: 1;
				height: 15px;
				line-height: 15px;
				font-family: arial;
				top: -5px;
				padding: 0 4px;
				background: #e4393c;
				-webkit-border-radius: 15px;
				-moz-border-radius: 15px;
				border-radius: 15px;
				color: #fff;
				font-size: 10px;
				margin: 0 0 0 2px;
				_position: static;
			}
			
			.order-tb .tr-th span {
				float: left;
				height: 18px;
				line-height: 18px;
				padding: 2px 0 0;
				_display: inline;
			}
			
			.order-tb .tr-th .order-shop .shop-txt {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				vertical-align: middle;
				max-width: 153px;
				overflow: hidden;
				margin: 0;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			
			.order-tb .tr-th .btn-im,
			.order-tb .tr-th .btn-im-off {
				display: inline-block;
				*display: inline;
				*zoom: 1;
				width: 16px;
				height: 16px;
				margin: 0 0 0 5px;
				overflow: hidden;
				background: url(img/sprite-im.png) no-repeat;
				vertical-align: middle;
			}
			div.hide {
				display: none;
				
			}
		</style>
		<script src="js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>	
		<script src="js/jquery-3.1.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				
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
				var $ab = $("#ab");
				$ab.click(function () {
				    // var order_no = $("#ip_keyword").value;
                    var orders_no = document.getElementById('ip_keyword').value;
                    location.assign("OrderServlet?action=byone&orders_no=" + orders_no);
                });
				var $sx = $("#sx");
				$sx.click(function () {
                    location.assign("OrderServlet?action=queryMyOrder");
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
					<a href="user/frontLoginOut" class="link-regist style-red">退出</a>
				</li>
				<li class="spacer"></li>
				<li class="fore2">
					<div class="dt">
						<a  href="order/queryMyOrder">我的订单</a>
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
				<a class="fore1" href="javascript:0"></a>
				<a class="fore2" href="javascript:0">我的京东</a>
				<a class="fore3" href="go_backend?target=frontpage/user/welcome">返回京东首页</a>
			</div>
			<div class="navitems">
				<ul>
					<li class="fore-1">
						<a target="_self" href="go_backend?target=frontpage/user/welcome">首页</a>
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
						<a  href="shopcart/queryShoppingCart">我的购物车</a>
					</div>
				</div>
				
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<!--container-->
	<div id="container">
		<div class="w">
			<div id="content">
				<div id="sub">
					<!--左侧导航栏-->
					<div id="menu">
						<dl class="fore1">
							<dt id="_MYJD_order">订单中心</dt>
							<dd class="fore1_1 curr" id="_MYJD_ordercenter">
								<a  href="OrderServlet?action=queryMyOrder">我的订单</a>
							</dd>
							<dd class="fore1_2" id="_MYJD_tuan">
								<a  href="#" target="_blank">团购订单</a>
							</dd>
							<dd class="fore1_3" id="_MYJD_locallife">
								<a  href="#" target="_self">本地生活订单</a>
							</dd>
							<dd class="fore1_4" id="_MYJD_yushou">
								<a href="#" target="_self">我的预售</a>
							</dd>
							<dd class="fore1_5" id="_MYJD_comments">
								<a href="#" target="_self">评价晒单</a>
							</dd>
							<dd class="fore1_6" id="_MYJD_refundment">
								<a href="#" target="_self">取消订单记录</a>
							</dd>
						</dl>
						<dl class="fore6">
							<dt id="_MYJD_sz">设置</dt>
							<dd class="fore6_1" id="_MYJD_info">
								<a  href="#" target="_self">个人信息</a>
							</dd>
							<dd class="fore6_2" id="_MYJD_add">
								<a  href="#" target="_self">收货地址</a>
							</dd>
						</dl>
					</div>
				</div>
				<div id="main">
					<div id="chunjie" class="mb10"></div>
					<div class="mod-main mod-comm mod-order" id="order01">
	                    <div class="mt">
	                        <h3>我的订单</h3>
	                        <div class="extra-r"></div>
	                    </div>
                	</div>
                    <%
                        List<Orders> list = (List<Orders>)request.getAttribute("list");
                        Users users = (Users)request.getAttribute("users");
                        int noPaycount = 0;//还没有付款的数量
                        int payCount = 0;//已经付款的数量
                        for(Orders o:list){
                            if(o.getStatus()==0){
								noPaycount++;
                            }
                            if(o.getStatus()==2){
								payCount++;
                            }

                        }
                    %>
                	<div id="order02" class="mod-main mod-comm lefta-box" >
                		<div class="mt">
	                        <ul class="extra-l">
	                            <li class="selected" id="sx"><a href="order/queryMyOrder" class="txt curr">全部订单</a></li>
	                            <li><a href="javascript:0" id="ordertoPay" class="txt">待付款</a><a href="#"><%if(noPaycount!=0){%><em><%=noPaycount%></em><%}%></a></li>
	                            <li><a href="javascript:0" id="ordertoReceive"  class="txt">待收货<%if(payCount!=0){%><em><%=payCount%></em><%}%></a></li>
	                            <li><a href="javascript:0" id="ordertoComment" target="_blank" class="txt" >待评价</a></li>
	                            <li class="fore2 "><a href="#" id="ordertoBuy" ><strong>我的常购商品</strong><span class="new"></span></a></li>
								<li class="fore2"><a href="#" id="ordertoTejia" ><strong>特价·清仓</strong><span class="new"></span></a></li>
	                                                        
	                            <li class="fore2"><a href="#"  class="ftx-03" id="ordertoRecycle">订单回收站</a></li>
	                        </ul>
	                        <div class="extra-r">
	                            <div class="search">
	                                <input style="color: rgb(204, 204, 204); width: 180px;height: 25px;line-height: 25px" id="ip_keyword" class="itxt" placeholder="商品名称/商品编号/订单号" type="text" name="search">
	                                <input style="margin-left: 10px;margin-top: 0px" value="搜索" type="button" id="ab"  >
	                            </div>
	                        </div>
                    	</div>
                    	<div class="m">
	                		<div class="mc">
	                			<div style="display: none;" class="top-search hide">
	                            	<div class="dl">
	                                	<span class="label">订单类型：</span>
										<div class="dd">
											<a href="#" target="_self" class="curr">全部类型</a>
											<a href="#" target="_self" >实物商品</a>
											<a href="#" target="_self" >机票</a>
											<a href="#" target="_self" >酒店</a>
											<a href="#" target="_self" >租车</a>
											<a href="#" target="_self" >度假</a>
											<a href="#" target="_self" >门票</a>
											<a href="#" target="_self" >火车</a>
											<a href="#" target="_self" >游戏</a>
											<a href="#" target="_self" >手机充值</a>
											<a href="#" target="_self" >电影票</a>
											<a href="#" target="_self" >演出票</a>
											<a href="#" target="_self" >电子书</a>
											<a href="#" target="_self" >数字音乐</a>
											<a href="#" target="_self" >应用商店</a>
											<a href="#" target="_self" >彩票</a>
											<a href="#" target="_self" >团购</a>
											<a href="#" target="_self" >保险</a>
											<a href="#" target="_self" >夺宝岛</a>
											<a href="#" target="_self" >加油卡</a>
											<a href="#" target="_self" >一元抢宝</a>
										</div>
									</div>
		                            <div class="dl">
		                                <a href="#" class="btn-9">返回</a>
		                            </div>
		                            <a href="#" class="ts-del"></a>
	                        	</div>
		                		<table class="td-void order-tb">
		                			<colgroup>
		                                <col class="number-col">
		                                <col class="consignee-col">
		                                <col class="amount-col">
		                                <col class="status-col">
		                                <col class="operate-col">
		                            </colgroup>
									<thead>
										<tr>
											<th>
												<div class="ordertime-cont">
													<div class="time-txt">近三个月订单<b></b><span class="blank"></span></div>
													<div class="time-list">
														<ul>
															<li>
																<a href="#" class="curr"><b></b>近三个月订单</a>
															</li>
															<li>
																<a href="#"><b></b>今年内订单</a>
															</li>
															<li>
																<a href="#"><b></b>2015年订单</a>
															</li>
															<li>
																<a href="#"><b></b>2014年订单</a>
															</li>
															<li>
																<a href="#"><b></b>2013年订单</a>
															</li>
															<li>
																<a href="#"><b></b>2013年以前订单</a>
															</li>
														</ul>
													</div>
												</div>
												<div class="order-detail-txt ac">订单详情</div>
											</th>
											<th>收货人</th>
											<th>金额</th>
											<th>
												<div class="deal-state-cont" id="orderState">
													<div class="state-txt">全部状态<b></b><span class="blank"></span></div>
													<div class="state-list">
														<ul>
															<li value="4096">
																<a href="#none" class="curr"><b></b>全部状态</a>
															</li>
															<li value="1">
																<a href="#none"><b></b>等待付款</a>
															</li>
															<li value="128">
																<a href="#none"><b></b>等待收货</a>
															</li>
															<li value="1024">
																<a href="#none"><b></b>已完成</a>
															</li>
															<li value="-1">
																<a href="#none"><b></b>已取消</a>
															</li>
														</ul>
													</div>
												</div>
											</th>
											<th>操作</th>
										</tr>
									
										<tr class="toolbar toolbar-top">
											<td colspan="5">
												<div class="operates">
													<a target="_blank" href="#" class="btn-combine">合并付款</a>
												</div>
											</td>
										</tr>
									</thead>

                                    <%
                                        for(Orders o:list){
                                           List<OrderDetail> orderDetailList = o.getOrderDetails();//获取商品详情列表的东西
                                            if(o.getStatus()==0){
                                    %>
									<tbody id="tb-22964031644">
                                    <tr class="sep-row">
                                        <td colspan="5"></td>
                                    </tr>
                                    <tr class="tr-th">
                                        <td colspan="5">
                                            <span class="gap"></span>
                                            <span class="dealtime" title="<%=o.getOrder_time()%>"><%=o.getOrder_time()%></span>
                                            <input id="datasubmit-22964031644" value="<%=o.getOrder_time()%>" type="hidden">

                                            <span class="number">订单号：<a name="orderIdLinks" id="idUrl22964031644" target="_blank" href="#" ><%=o.getOrders_no()%></a></span>

                                            <div class="tr-operate">
													<span class="order-shop">
														<span class="shop-txt">京东</span>
														<a class="btn-im btn-im-jd" href="#" title="联系客服" ></a>
													</span>
                                            </div>
                                        </td>
                                    </tr>

                                    <%
                                        for(OrderDetail orderDetail:orderDetailList){
                                            Products p = orderDetail.getP();
                                            int sum = (int) (p.getPrice()*p.getProduct_sum());
                                    %>
										<tr class="tr-bd" id="track22964031644" oty="0,4,70">
											<td>
												<div class="goods-item p-3141248">
													<div class="p-img">
														<a href="#" target="_blank">
															<img class="" src="img/productImage/<%=p.getShopping_car_img()%>" title="<%=p.getPdesc()%>" data-lazy-img="done" height="60" width="60">
									
														</a>
													</div>
													<div class="p-msg">
														<div class="p-name">
															<a href="#" class="a-link" target="_blank" title="<%=p.getPdesc()%>"><%=p.getPdesc()%></a>
														</div>
														<div class="p-extra">
															<ul class="o-info">
																<li><span class="o-match J-o-match" data-sku="3141248"><i></i><em>找搭配</em></span></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="goods-number">x<%=orderDetail.getOrder_sum()%></div>
									
												<div class="goods-repair"></div>
												<div class="clr"></div>
											</td>
									
											<td rowspan="1">
												<div class="consignee tooltip">
													<span class="txt"><%=users.getUsername()%></span><b></b>
													<div style="display: none;" class="prompt-01 prompt-02">
														<div class="pc">
															<strong><%=users.getUsername()%></strong>
															<p><%=o.getReceived_address()%></p>
															<p><%=users.getPhone_number()%></p>
														</div>
														<div class="p-arrow p-arrow-left"></div>
													</div>
												</div>
											</td>
											<td rowspan="1">
												<div class="amount">
													<span>单价 ¥<%=p.getPrice()%></span> <br>
													<strong>应付</strong> <br>
													<strong>¥<%=sum%></strong> <br>
													<span class="ftx-13">在线支付</span>
												</div>
											</td>
											<td rowspan="1">
												<div class="status">
													<div class="tooltip" _orderid="22964031644" _ordertype="0" _orderstatus="1" _orderurl="//details.jd.com/normal/item.action?orderid=22964031644&amp;PassKey=8A4F13A2DCC3A4AE41E1B99A04C0397E" _ordership="70">
														<span class="order-status ftx-04">等待付款</span><br>
														<i class="auto-icon"></i> 跟踪
														<i class="circle-icon"></i>
														<div style="display: none;" class="prompt-01">
															<div class="pc">
																<div class="p-tit">
																	普通快递
																</div>
																<div class="logistics-cont" id="tracker22964031644">
																	<ul>
																		<li class="first"><i class="node-icon"></i>
																			<a href="#" target="_blank">您提交了订单，请等待系统确认</a>
																			<div class="ftx-13"><%=o.getOrder_time()%></div>
																		</li>
																	</ul>
																</div>
															</div>
															<div class="p-arrow p-arrow-left"></div>
														</div>
													</div>
									
													<a href="#"  target="_blank">订单详情</a>
												</div>
											</td>
											<td rowspan="1" id="operate22964031644">
												<div class="operate">
									
													<a class="btn-pay" href="#">付款</a><br>

													<a href="#" class="a-link" target="_blank">请人代付</a><br>

													<a class="a-link order-cancel"  _oid="22964031644" _passkey="3D8EF18241ACBF23A97016AA7104A295" href="order/deleteOrderByOrders_no?orders_no=<%=o.getOrders_no()%>">取消订单</a><br></div>
											</td>
										</tr>
								        <%
                                        }
                                            }
                                        %>
									</tbody>
									<%
                                        if(o.getStatus()!=0){

                                    %>
                                    <tr class="sep-row">
                                        <td colspan="5"></td>
                                    </tr>

                                    <tr class="tr-th">
                                        <td colspan="5">
                                            <span class="gap"></span>
                                            <span class="dealtime" title="<%=o.getOrder_time()%>"><%=o.getOrder_time()%></span>
                                            <input id="datasubmit-22964031644" value="" type="hidden">

                                            <span class="number">订单号：<a name="orderIdLinks" id="idUrl22964031644" target="_blank" href="#" ><%=o.getOrders_no()%></a></span>

                                            <div class="tr-operate">
													<span class="order-shop">
														<span class="shop-txt">京东</span>
														<a class="btn-im btn-im-jd" href="#" title="联系客服" ></a>
													</span>
                                            </div>
                                        </td>
                                    </tr>

                                    <%
                                            for(OrderDetail od:orderDetailList){
                                                Products products = od.getP();
                                                int sum = (int) (products.getPrice()*products.getProduct_sum());
                                    %>
									<tbody id="tb-22964031644">

										<tr class="tr-bd" id="track22964031644" oty="0,4,70">
											<td>
												<div class="goods-item p-3141248">
													<div class="p-img">
														<a href="#" target="_blank">
															<img class="" src="img/productImage/<%=products.getShopping_car_img()%>" title="<%=products.getPdesc()%>" data-lazy-img="done" height="60" width="60">
									
														</a>
													</div>
													<div class="p-msg">
														<div class="p-name">
															<a href="#" class="a-link" target="_blank" title="<%=products.getPdesc()%>"><%=products.getPdesc()%></a>
														</div>
														<div class="p-extra">
															<ul class="o-info">
																<li><span class="o-match J-o-match" data-sku="3141248"><i></i><em>找搭配</em></span></li>
															</ul>
														</div>
													</div>
												</div>
												<div class="goods-number">x<%=od.getOrder_sum()%></div>
									
												<div class="goods-repair"></div>
												<div class="clr"></div>
											</td>
									
											<td rowspan="1">
												<div class="consignee tooltip">
													<span class="txt"><%=users.getUsername()%></span><b></b>
													<div style="display: none;" class="prompt-01 prompt-02">
														<div class="pc">
															<strong><%=users.getUsername()%></strong>
															<p><%=o.getReceived_address()%></p>
															<p><%=users.getPhone_number()%></p>
														</div>
														<div class="p-arrow p-arrow-left"></div>
													</div>
												</div>
											</td>
											<td rowspan="1">
												<div class="amount">
													<span>单价 ¥<%=products.getPrice()%></span> <br>
													<strong>应付</strong> <br>
													<strong>¥<%=sum%></strong> <br>
													<span class="ftx-13">在线支付</span>
												</div>
											</td>
											<td rowspan="1">
												<div class="status">

													<div class="tooltip" _orderid="22964031644" _ordertype="0" _orderstatus="1" _orderurl="//details.jd.com/normal/item.action?orderid=22964031644&amp;PassKey=8A4F13A2DCC3A4AE41E1B99A04C0397E" _ordership="70">
														<i class="auto-icon"></i> 跟踪
														<i class="circle-icon"></i>
														<div style="display: none;" class="prompt-01">
															<div class="pc">
																<div class="p-tit">
																	普通快递
																</div>
																<div class="logistics-cont" id="tracker22964031644">
																	<ul>
																		<li class="first"><i class="node-icon"></i>
																			<a href="#" target="_blank">您提交了订单，请等待系统确认</a>
																			<div class="ftx-13"><%=o.getOrder_time()%></div>
																		</li>
																	</ul>
																</div>
															</div>
															<div class="p-arrow p-arrow-left"></div>
														</div>
													</div>
									
													<a href="#"  target="_blank">订单详情</a>
												</div>
											</td>
											<td rowspan="1" id="operate22964031644">
												<div class="operate">

													<a class="btn-pay" href="#">已付款</a><br>
									
													<a href="#" class="a-link" target="_blank">请人代付</a><br>
											</td>
										</tr>
								
									</tbody>
                                    <%
                                                }
                                            }
                                        }
                                    %>
		                		</table>
	                		</div>
	                		<div class="hide">
	                			<div class="mc">
		                			<div style="display: none;" class="top-search hide">
		                            	<div class="dl">
		                                	<span class="label">订单类型：</span>
											<div class="dd">
												<a href="#" target="_self" class="curr">全部类型</a>
												<a href="#" target="_self" >实物商品</a>
												<a href="#" target="_self" >机票</a>
												<a href="#" target="_self" >酒店</a>
												<a href="#" target="_self" >租车</a>
												<a href="#" target="_self" >度假</a>
												<a href="#" target="_self" >门票</a>
												<a href="#" target="_self" >火车</a>
												<a href="#" target="_self" >游戏</a>
												<a href="#" target="_self" >手机充值</a>
												<a href="#" target="_self" >电影票</a>
												<a href="#" target="_self" >演出票</a>
												<a href="#" target="_self" >电子书</a>
												<a href="#" target="_self" >数字音乐</a>
												<a href="#" target="_self" >应用商店</a>
												<a href="#" target="_self" >彩票</a>
												<a href="#" target="_self" >团购</a>
												<a href="#" target="_self" >保险</a>
												<a href="#" target="_self" >夺宝岛</a>
												<a href="#" target="_self" >加油卡</a>
												<a href="#" target="_self" >一元抢宝</a>
											</div>
										</div>
			                            <div class="dl">
			                                <a href="#" class="btn-9">返回</a>
			                            </div>
			                            <a href="#" class="ts-del"></a>
		                        	</div>
			                		<table class="td-void order-tb">
			                			<colgroup>
			                                <col class="number-col">
			                                <col class="consignee-col">
			                                <col class="amount-col">
			                                <col class="status-col">
			                                <col class="operate-col">
			                            </colgroup>
										<thead>
											<tr>
												<th>
													<div class="ordertime-cont">
														<div class="time-txt">近三个月订单<b></b><span class="blank"></span></div>
														<div class="time-list">
															<ul>
																<li>
																	<a href="#" class="curr"><b></b>近三个月订单</a>
																</li>
																<li>
																	<a href="#"><b></b>今年内订单</a>
																</li>
																<li>
																	<a href="#"><b></b>2015年订单</a>
																</li>
																<li>
																	<a href="#"><b></b>2014年订单</a>
																</li>
																<li>
																	<a href="#"><b></b>2013年订单</a>
																</li>
																<li>
																	<a href="#"><b></b>2013年以前订单</a>
																</li>
															</ul>
														</div>
													</div>
													<div class="order-detail-txt ac">订单详情</div>
												</th>
												<th>收货人</th>
												<th>金额</th>
												<th>
													<div class="deal-state-cont" id="orderState">
														<div class="state-txt">全部状态<b></b><span class="blank"></span></div>
														<div class="state-list">
															<ul>
																<li value="4096">
																	<a href="#none" class="curr"><b></b>全部状态</a>
																</li>
																<li value="1">
																	<a href="#none"><b></b>等待付款</a>
																</li>
																<li value="128">
																	<a href="#none"><b></b>等待收货</a>
																</li>
																<li value="1024">
																	<a href="#none"><b></b>已完成</a>
																</li>
																<li value="-1">
																	<a href="#none"><b></b>已取消</a>
																</li>
															</ul>
														</div>
													</div>
												</th>
												<th>操作</th>
											</tr>
										
											<tr class="toolbar toolbar-top">
												<td colspan="5">
													<div class="operates">
														<a target="_blank" href="#" class="btn-combine">合并付款</a>
													</div>
												</td>
											</tr>
										</thead>
                                        <%
                                            for(Orders ll:list){
                                                List<OrderDetail> list1 = ll.getOrderDetails();
                                                if(ll.getStatus()==0){
                                        %>
										<tbody id="tb-22964031644">
											<tr class="sep-row">
												<td colspan="5"></td>
											</tr>

											<tr class="tr-th">
												<td colspan="5">
													<span class="gap"></span>
													<span class="dealtime" title="2016-09-07 14:27:18"><%=ll.getOrder_time()%></span>
													<input id="datasubmit-22964031644" value="2016-09-07 14:27:18" type="hidden">

													<span class="number">订单号：<a name="orderIdLinks" id="idUrl22964031644" target="_blank" href="#" ><%=ll.getOrders_no()%></a></span>

													<div class="tr-operate">
														<span class="order-shop">
															<span class="shop-txt">京东</span>
															<a class="btn-im btn-im-jd" href="#" title="联系客服" ></a>
														</span>
													</div>
												</td>
											</tr>
                                            <%
                                                for(OrderDetail lll:list1){
                                                    Products products = lll.getP();
                                            %>
											<tr class="tr-bd" id="track22964031644" oty="0,4,70">
												<td>
													<div class="goods-item p-3141248">
														<div class="p-img">
															<a href="#" target="_blank">
																<img class="" src="img/productImage/<%=products.getShopping_car_img()%>" title="<%=products.getPdesc()%>" data-lazy-img="done" height="60" width="60">

															</a>
														</div>
														<div class="p-msg">
															<div class="p-name">
																<a href="#" class="a-link" target="_blank" title="<%=products.getPdesc()%>"><%=products.getPdesc()%></a>
															</div>
															<div class="p-extra">
																<ul class="o-info">
																	<li><span class="o-match J-o-match" data-sku="3141248"><i></i><em>找搭配</em></span></li>
																</ul>
															</div>
														</div>
													</div>
													<div class="goods-number">x<%=lll.getOrder_sum()%></div>

													<div class="goods-repair"></div>
													<div class="clr"></div>
												</td>

												<td rowspan="1">
													<div class="consignee tooltip">
														<span class="txt"><%=users.getUsername()%></span><b></b>
														<div style="display: none;" class="prompt-01 prompt-02">
															<div class="pc">
																<strong><%=users.getUsername()%></strong>
																<p><%=ll.getReceived_address()%></p>
																<p><%=users.getPhone_number()%></p>
															</div>
															<div class="p-arrow p-arrow-left"></div>
														</div>
													</div>
												</td>
												<td rowspan="1">
													<div class="amount">
														<span>单价 ¥<%=products.getPrice()%></span> <br>
														<strong>应付</strong> <br>
														<strong>¥<%=products.getPrice()%></strong> <br>
														<span class="ftx-13">在线支付</span>
													</div>
												</td>
												<td rowspan="1">
													<div class="status">
														<div class="tooltip" _orderid="22964031644" _ordertype="0" _orderstatus="1" _orderurl="//details.jd.com/normal/item.action?orderid=22964031644&amp;PassKey=8A4F13A2DCC3A4AE41E1B99A04C0397E" _ordership="70">
															<i class="auto-icon"></i> 跟踪
															<i class="circle-icon"></i>
															<div style="display: none;" class="prompt-01">
																<div class="pc">
																	<div class="p-tit">
																		普通快递
																	</div>
																	<div class="logistics-cont" id="tracker22964031644">
																		<ul>
																			<li class="first"><i class="node-icon"></i>
																				<a href="#" target="_blank">您提交了订单，请等待系统确认</a>
																				<div class="ftx-13">2016-09-07 14:27:18</div>
																			</li>
																		</ul>
																	</div>
																</div>
																<div class="p-arrow p-arrow-left"></div>
															</div>
														</div>

														<a href="#"  target="_blank">订单详情</a>
													</div>
												</td>
												<td rowspan="1" id="operate22964031644">
													<div class="operate">
														<a class="btn-pay" href="#">付款</a><br>
                                                    </div>
												</td>
											</tr>

										</tbody>
										<%
                                                    }
                                            }
                                                }
                                        %>

			                		</table>
		                		</div>
	                		</div>
                            <div class="hide">
                                <div class="mc">
                                    <div style="display: none;" class="top-search hide">
                                        <div class="dl">
                                            <span class="label">订单类型：</span>
                                            <div class="dd">
                                                <a href="#" target="_self" class="curr">全部类型</a>
                                                <a href="#" target="_self" >实物商品</a>
                                                <a href="#" target="_self" >机票</a>
                                                <a href="#" target="_self" >酒店</a>
                                                <a href="#" target="_self" >租车</a>
                                                <a href="#" target="_self" >度假</a>
                                                <a href="#" target="_self" >门票</a>
                                                <a href="#" target="_self" >火车</a>
                                                <a href="#" target="_self" >游戏</a>
                                                <a href="#" target="_self" >手机充值</a>
                                                <a href="#" target="_self" >电影票</a>
                                                <a href="#" target="_self" >演出票</a>
                                                <a href="#" target="_self" >电子书</a>
                                                <a href="#" target="_self" >数字音乐</a>
                                                <a href="#" target="_self" >应用商店</a>
                                                <a href="#" target="_self" >彩票</a>
                                                <a href="#" target="_self" >团购</a>
                                                <a href="#" target="_self" >保险</a>
                                                <a href="#" target="_self" >夺宝岛</a>
                                                <a href="#" target="_self" >加油卡</a>
                                                <a href="#" target="_self" >一元抢宝</a>
                                            </div>
                                        </div>
                                        <div class="dl">
                                            <a href="#" class="btn-9">返回</a>
                                        </div>
                                        <a href="#" class="ts-del"></a>
                                    </div>
                                    <table class="td-void order-tb">
                                        <colgroup>
                                            <col class="number-col">
                                            <col class="consignee-col">
                                            <col class="amount-col">
                                            <col class="status-col">
                                            <col class="operate-col">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>
                                                <div class="ordertime-cont">
                                                    <div class="time-txt">近三个月订单<b></b><span class="blank"></span></div>
                                                    <div class="time-list">
                                                        <ul>
                                                            <li>
                                                                <a href="#" class="curr"><b></b>近三个月订单</a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><b></b>今年内订单</a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><b></b>2015年订单</a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><b></b>2014年订单</a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><b></b>2013年订单</a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><b></b>2013年以前订单</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="order-detail-txt ac">订单详情</div>
                                            </th>
                                            <th>收货人</th>
                                            <th>金额</th>
                                            <th>
                                                <div class="deal-state-cont" id="orderState">
                                                    <div class="state-txt">全部状态<b></b><span class="blank"></span></div>
                                                    <div class="state-list">
                                                        <ul>
                                                            <li value="4096">
                                                                <a href="#none" class="curr"><b></b>全部状态</a>
                                                            </li>
                                                            <li value="1">
                                                                <a href="#none"><b></b>等待付款</a>
                                                            </li>
                                                            <li value="128">
                                                                <a href="#none"><b></b>等待收货</a>
                                                            </li>
                                                            <li value="1024">
                                                                <a href="#none"><b></b>已完成</a>
                                                            </li>
                                                            <li value="-1">
                                                                <a href="#none"><b></b>已取消</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </th>
                                            <th>操作</th>
                                        </tr>

                                        <tr class="toolbar toolbar-top">
                                            <td colspan="5">
                                                <div class="operates">
                                                    <a target="_blank" href="#" class="btn-combine">合并付款</a>
                                                </div>
                                            </td>
                                        </tr>
                                        </thead>
                                        <%
                                            for(Orders ll:list){
                                                List<OrderDetail> list1 = ll.getOrderDetails();
                                                if(ll.getStatus()==2){
                                        %>
                                        <tbody id="tb-22964031644">
                                        <tr class="sep-row">
                                            <td colspan="5"></td>
                                        </tr>

                                        <tr class="tr-th">
                                            <td colspan="5">
                                                <span class="gap"></span>
                                                <span class="dealtime" title="2016-09-07 14:27:18"><%=ll.getOrder_time()%></span>
                                                <input id="datasubmit-22964031644" value="2016-09-07 14:27:18" type="hidden">

                                                <span class="number">订单号：<a name="orderIdLinks" id="idUrl22964031644" target="_blank" href="#" ><%=ll.getOrders_no()%></a></span>

                                                <div class="tr-operate">
														<span class="order-shop">
															<span class="shop-txt">京东</span>
															<a class="btn-im btn-im-jd" href="#" title="联系客服" ></a>
														</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                            for(OrderDetail lll:list1){

                                                Products products = lll.getP();
                                        %>
                                        <tr class="tr-bd" id="track22964031644" oty="0,4,70">
                                            <td>
                                                <div class="goods-item p-3141248">
                                                    <div class="p-img">
                                                        <a href="#" target="_blank">
                                                            <img class="" src="img/productImage/<%=products.getShopping_car_img()%>" title="<%=products.getPdesc()%>" data-lazy-img="done" height="60" width="60">

                                                        </a>
                                                    </div>
                                                    <div class="p-msg">
                                                        <div class="p-name">
                                                            <a href="#" class="a-link" target="_blank" title="<%=products.getPdesc()%>"><%=products.getPdesc()%></a>
                                                        </div>
                                                        <div class="p-extra">
                                                            <ul class="o-info">
                                                                <li><span class="o-match J-o-match" data-sku="3141248"><i></i><em>找搭配</em></span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="goods-number">x<%=lll.getOrder_sum()%></div>

                                                <div class="goods-repair"></div>
                                                <div class="clr"></div>
                                            </td>

                                            <td rowspan="1">
                                                <div class="consignee tooltip">
                                                    <span class="txt"><%=users.getUsername()%></span><b></b>
                                                    <div style="display: none;" class="prompt-01 prompt-02">
                                                        <div class="pc">
                                                            <strong><%=users.getUsername()%></strong>
                                                            <p><%=ll.getReceived_address()%></p>
                                                            <p><%=users.getPhone_number()%></p>
                                                        </div>
                                                        <div class="p-arrow p-arrow-left"></div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td rowspan="1">
                                                <div class="amount">
                                                    <span>单价 ¥<%=products.getPrice()%></span> <br>
                                                    <strong>应付</strong> <br>
                                                    <strong>¥<%=products.getPrice()%></strong> <br>
                                                    <span class="ftx-13">在线支付</span>
                                                </div>
                                            </td>
                                            <td rowspan="1">
                                                <div class="status">
                                                    <div class="tooltip" _orderid="22964031644" _ordertype="0" _orderstatus="1" _orderurl="//details.jd.com/normal/item.action?orderid=22964031644&amp;PassKey=8A4F13A2DCC3A4AE41E1B99A04C0397E" _ordership="70">
                                                        <i class="auto-icon"></i> 跟踪
                                                        <i class="circle-icon"></i>
                                                        <div style="display: none;" class="prompt-01">
                                                            <div class="pc">
                                                                <div class="p-tit">
                                                                    普通快递
                                                                </div>
                                                                <div class="logistics-cont" id="tracker22964031644">
                                                                    <ul>
                                                                        <li class="first"><i class="node-icon"></i>
                                                                            <a href="#" target="_blank">您提交了订单，请等待系统确认</a>
                                                                            <div class="ftx-13">2016-09-07 14:27:18</div>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <div class="p-arrow p-arrow-left"></div>
                                                        </div>
                                                    </div>

                                                    <a href="#"  target="_blank">订单详情</a>
                                                </div>
                                            </td>
                                            <td rowspan="1" id="operate22964031644">
                                                <div class="operate">
                                                    <a class="btn-pay" href="#">确认收货</a><br>
                                                </div>
                                            </td>
                                        </tr>

                                        </tbody>
                                        <%
                                                    }
                                                }
                                            }
                                        %>

                                    </table>
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
