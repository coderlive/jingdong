<%@ page language="java" import="java.util.*,vo.Products" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>我的购物车</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <style type="text/css">
        * {
            margin: 0px;
        }

        .alldiv {
            width: 990px;
            height: auto;
            background: pink;
            margin: 0px auto;
        }

        body {

            font: 12px/150% Arial, Verdana, "\5b8b\4f53";
            color: #666;
            padding: 0px;
        }

        a {
            text-decoration: none;
            color: #666;
        }

        a:HOVER {
            color: #c91623;
        }

        em, i, u {
            font-style: normal;
        }

        /*最上面导航条*/
        /*最上面一条的type 开始*/

        #shortcut {
            width: 100%;
            height: 30px;
            line-height: 30px;
        }

        .fl {
            float: left;
        }

        #shortcut .w {
            width: 990px;
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
            position: relative; /* zzy的改动 为了让顶端悬浮div对齐*/
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
            z-index: 1;
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
            /*right: 185px;*/
            top: 30px;
            background: #fff;
            border: 1px solid #ddd;
        }

        #shortcut li.dorpdown:hover .dorpdown-layer {
            display: block;

            z-index: 2;
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

        .selected {
            z-index: 1;
            background: #C81623;
            color: #fff;
        }

        .notselected {
            z-index: 1;
            background: #fff;

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
            background: url(img/images2/jd2015img.png) 0 0 no-repeat;
        }

        #shortcut #ttbar-apps:hover .dt .ci-left {
            background: url(img/images2/jd2015img.png) 0 -25px no-repeat;
        }

        #shortcut #ttbar-apps .dd-inner {
            position: relative;
            width: 250px;
            height: 186px;
            overflow: hidden;
            background: url(img/images2/erweimamany.png);
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

        #shortcut #ttbar-apps .dd-inner {
            position: relative;
            width: 250px;
            height: 186px;
            overflow: hidden;
            background: url(img/images2/erweimamany.png);
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

        /*最上面一条的type 结束*/
        /*搜索部分 type 开始*/

        #logo {
            position: relative;
            z-index: 12;
            float: left;
            width: 362px;
            height: 60px;
            padding: 20px 0;
        }

        /*������ĵ���������*/
        .div-top {

            width: 990px;
            margin: 0px auto;
            height: 30px;
            background-color: #F1F1F1;
        }

        .div-top-sendTo {
            display: inline-block;
            line-height: 30px;
            padding: 0 25px 0 10px;
        }

        .div-top-ul {
            display: inline-block;
            list-style: none;
            margin: 0px;
            padding: 0px;
        }

        /*.ci-right {
            position: absolute;
            display: block;
            top: 12px;
            left: 255px;
            height: 7px;
            overflow: hidden;
            font: 400 15px/15px consolas;
            color: #6A6A6A;
            transition: transform .1s ease-in 0s;
            -webkit-transition: -webkit-transform .1s ease-in 0s;
        }*/
        .user {

            height: 30px;
            line-height: 30px;
            display: inline-block;
            width: 123px;
            float: right;
            padding: 0px 2px;
        }

        .div-top1 {
            float: right;
            height: 30px;
            line-height: 30px;
            display: inline-block;
            width: 76px;
            text-align: center;
            padding: 0px 2px;
        }

        .div-top2 {
            float: right;
            height: 30px;
            line-height: 30px;
            display: inline-block;
            width: 58px;
            text-align: center;
            padding: 0px 2px;
        }

        .div-top3 {
            float: right;
            height: 30px;
            line-height: 30px;
            display: inline-block;
            width: 92px;
            text-align: center;
            padding: 0px 2px;
        }

        .div-top4 {
            float: right;
            height: 30px;
            line-height: 30px;
            display: inline-block;
            width: 88px;
            text-align: center;
            padding: 0px 2px;
        }

        .spacer {
            width: 1px;
            height: 12px;

            padding: 0px;
            background: #ddd;
            overflow: hidden;
            float: right;
            margin-top: 9px;
        }

        /*�м�logo*/
        .logo {
            width: 990px;
            margin: 0px auto;
            display: block;
            float: left;
            position: relative;
            width: 985px;
            padding: 15px 0 10px;
            padding-left: 5px;
            margin-left: 180px;
        }

        .link2 {
            overflow: hidden;
            display: block;
            position: absolute;
            width: 100px;
            height: 40px;
            line-height: 99em;
            top: 16px;
            right: 0;
            background: #fff;
            float: left;
        }

        .logo b {
            display: block;
            position: absolute;
            width: 100px;
            height: 40px;
            line-height: 99em;
            top: -8;
            right: 0;
            background: url(img/images2/gouwuche.png) #fff no-repeat;
            float: left;
        }

        .div-logo-form {
            display: inline-block;
            float: right;
            border: 2px solid #c91623;
            background: #c91623;
            height: 24px;
            position: relative;
            top: 20px;
        }

        form {
            padding: 0px;
            margin: 0px;
        }

        /*未登录*/
        .nologin-tip {
            border: 1px solid #edd28b;
            background: #fffdee;
            padding: 10px 20px;
            line-height: 25px;
            width: 948px;
            margin: 0px auto;
            margin-top: 95px;
            margin-bottom: 20px;
            color: #f70;
            display: block;
        }

        s {
            font-style: normal;
        }

        .wicon {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            vertical-align: middle;
            margin-right: 10px;
            width: 16px;
            height: 16px;
            overflow: hidden;
            background: url(img/images2/icon16.png) 0 0 no-repeat;
        }

        .btn-1 {
            font-family: arial, "Microsoft YaHei";
            display: inline-block;
            *display: inline;
            *zoom: 1;
            height: 25px;
            line-height: 25px;
            background-color: #e74649;
            background-image: -moz-linear-gradient(top, #e74649, #df3134);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #e74649), color-stop(1, #df3134));
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134', GradientType='0');
            -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134');
            background-image: linear-gradient(to top, #e74649 0, #df3134 100%);
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            color: #fff;
            font-size: 12px;
            font-weight: 400;
            padding: 0 10px;
            vertical-align: middle;
            cursor: pointer;
            border: 0;
            float: none;
            -webkit-transition: all .2s ease-out;
            -moz-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        .ml10 {
            margin-left: 10px;
        }

        /*������*/
        .itxt {
            border: 0;
            line-height: 18px;
            width: 270px;
            padding: 3px 5px;
        }

        /*������ť */
        .button {
            display: inline-block;
            vertical-align: top;
            width: 48px;
            height: 24px;
            background: #c91623;
            text-align: center;
            color: #fff;
            font-weight: 700;
            border: 0px;

        }

        .div2 {
            height: 26px;
            margin: 0 auto;
            width: 990px;
            position: relative;
            margin-bottom: 5px;
            padding-top: 5px;
        }

        .div2login {
            margin-top: 95px;
        }

        .div2-1 {
        / / float: left;
            position: relative;
            font-weight: 700;
            font-size: 16px;
            height: 26px;
            line-height: 26px;
            text-align: center;
            cursor: pointer;
        }

        .toRed {
            color: #C81623;
        }

        .w-line {
            width: 990px;
            margin: 0 auto;
            position: relative;
            height: 1px;
            background: #e0e0e0;
        }

        .floater {
            position: absolute;
            height: 2px;
            background: #e4393c;
            left: 0;
            width: 80px;
            overflow: hidden;
        }

        .switch {
            font-weight: 700;
            font-size: 16px;
            line-height: 26px;
            text-align: center;
            cursor: pointer;
        }

        .number {
            font-family: verdana;
            font-size: 14px;
        }

        .sendTo {
            display: inline-block;
            float: right;
        }

        .sendToHere {
            float: right;
            position: relative;
            top: -5px;
            height: 23px;
            background: #fff;
            border: 1px solid #CECBCE;
            padding: 0 22px 0 4px;
            line-height: 23px;
            overflow: hidden;
        }

        .sendToHere div {
            display: inline-block;
        }

        .sendToHere b {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            width: 17px;
            height: 24px;
            background-image: url(img/images2/down.png);
            background-position: 0 0;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .div2-line {
            position: relative;
            width: 990px;
            margin: 0px auto;
            /* height: 1px;*/
            background: #e0e0e0;
        }

        .item-header {
            background: #fff;
            position: relative;
            z-index: 2;
            height: 26px;

        }

        .cart-tbody .item-header {
            padding: 5px 10px;
            line-height: 26px;
            color: #999;
            display: inline-block;
            display: block;
        }

        .item-header .f-txt {
            float: left;
            width: 750px;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .item-header .full-icon {
            position: relative;
            display: inline-block;
            *display: inline;
            *zoom: 1;
            vertical-align: middle;
            background: #f48719;
            border: 1px solid #f48719;
            color: #fff;
            padding: 1px 10px;
            height: 16px;
            line-height: 16px;
            margin: 0 10px 0 5px;
        }

        .item-header .full-icon b {
            display: block;
            position: absolute;
            width: 5px;
            height: 6px;
            left: -1px;
            bottom: -5px;
            background: url(img/images2/car) 0 0 no-repeat;
            overflow: hidden;
        }

        .cart-tbody .item-header .btn-1 {
            height: 19px;
            line-height: 19px;
            padding: 0 5px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
        }

        .btn-1 {
            font-family: arial, "Microsoft YaHei";
            display: inline-block;
            *display: inline;
            *zoom: 1;
            height: 25px;
            line-height: 25px;
            background-color: #e74649;
            background-image: -moz-linear-gradient(top, #e74649, #df3134);
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #e74649), color-stop(1, #df3134));
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134', GradientType='0');
            -ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e74649', endColorstr='#df3134');
            background-image: linear-gradient(to top, #e74649 0, #df3134 100%);
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            color: #fff;
            font-size: 12px;
            font-weight: 400;
            padding: 0 10px;
            vertical-align: middle;
            cursor: pointer;
            border: 0;
            float: none;
            -webkit-transition: all .2s ease-out;
            -moz-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }

        .ml20 {
            margin-left: 20px;
        }

        .item-header a.ftx-05 {
            color: #333;
        }

        .ftx-05, .ftx05 {
            color: #005ea7;
        }

        .item-header .f-price {
            float: left;
            min-width: 100px;
            text-align: right;
            font-family: verdana;
            line-height: 13px;
            color: #333;
        }

        .item-header .f-price strong {
            color: #333;
            font-weight: 400;
        }

        /*��������������*/
        .div3 {
            width: 990px;
            display: inline-block;
            display: block;
            height: 32px;
            line-height: 32px;
            margin: 10px auto;
            margin-top: 0px;
            padding: 5px 0;
            background: #f3f3f3;
            border: 1px solid #e9e9e9;
            border-top: 0;
            background-color: #f3f3f3;
            margin-bottom: 11px;
        }

        .jdcheckbox {
            float: left;
            position: relative;
            vertical-align: middle;
            _vertical-align: 0px;
            margin: 9px 5px 2px 12px;
            padding: 0;
        }

        .cart-checkbox div {
            display: inline-block;
            position: relative;
            top: 0px;
        }

        .t-goods {
            margin-left: 74px;
        }

        .t-price {
            margin-left: 437px;
        }

        .t-quantity {
            margin-left: 65px;
        }

        .t-sum {
            margin-left: 81px;
        }

        .t-action {
            margin-left: 37px;
        }

        /*������Ʒ��Ϣ*/
        .goods {
            width: 990px;
            margin: 0px auto;
            /*height: 141px;*/
        }

        .shop {

            line-height: 30px;
            height: 30px;
            font-weight: 700;
            border-bottom: solid 2px;
        }

        .shop-mes {
            position: relative;
            top: -1px;
        }

        .self-shop {
            position: relative;
            left: -1px;
        }

        .shop-a {
            display: inline-block;
            position: relative;
            top: 4px;
            left: -1px;
            height: 18px;
            line-height: 18px;
        }

        .shop div {
            float: right;
            display: inline-block;
            position: relative;
            font-weight: 400;
        }

        .self-shop-name {
            width: 54px;
            height: 18px;
            background: url(img/images2/all2.png) 0 -177px no-repeat;
            overflow: hidden;
            line-height: 18px;
            color: #e4393c;
        }

        .tips-icon {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            width: 18px;
            height: 18px;
            margin: -3px 0 0 5px;
            background: url(img/images2/tips-ico.png) no-repeat;
            overflow: hidden;
            vertical-align: middle;
        }

        .item-list {
            border-style: solid;
            border-width: 1px 1px 1px;
            _border-width: 1px;
            border-color: #aaa #f1f1f1 #f1f1f1;
            background: #fff;
        }

        .buygoods {
            position: relative;
            top: -1px;
            height: 108px;
            width: 990px;
            margin: 0px auto;

        }

        .buygoodsselected {
            background: #fff4e8;
        }

        .cell {
            float: left;
            padding: 15px 0 10px;
            font-weight: bold;
            color: black;
        }

        .p-checkbox {
            position: absolute;
            /*left: -960px;*/
            top: 5;
            width: 30px;
            min-height: 10px;
            _height: 10px;
        }

        .p-goods {
            width: 300px;
            height: 86px;
            display: inline-block;
            position: relative;
            left: 312px;
            top: -35px;
        }

        .p-img {
            width: 80px;
            height: 80px;
            margin-right: 10px;
            border: 1px #eee solid;
            /*background: #fff;*/
            padding: 0;
            text-align: center;
            overflow: hidden;
            position: absolute;
            top: 10px;
            left: 40px;

        }
        .p-img img{
            height: 100%;
            width: 100%;
        }

        .p-name {
            width: 208px;
            height: 40px;
            line-height: 20px;
            overflow: hidden;
            position: absolute;
            left: 145px;
            top: 10px;
        }

        .p-name2 {
            width: 208px;
            height: 40px;
            line-height: 20px;
            overflow: hidden;

        }

        .p-name a {
            color: #333;
            height: 20px;
        }

        .p-extend {
            position: absolute;
            left: 150px;
            top: 50px;
        }

        .p-extend i {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            width: 17px;
            height: 16px;
            vertical-align: middle;
            overflow: hidden;
            background: url(img/images2/all2.png) no-repeat;
            background-position: -27px -23px;
            margin-right: 7px;
        }

        .p-extend a {
            color: #aaa;
        }

        .baozhang {

            position: relative;
            top: -9px;
        }

        .jd-service {
            display: inline-block;
            vertical-align: middle;
        }

        .p-div2 {
            width: 100px;
            height: 80px;
            line-height: 20px;
            overflow: hidden;
            padding: 15px 10px 0;
            position: absolute;
            left: 355px;
        }

        .props-txt {
            width: 100px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
            cursor: default;
        }

        .p-div3 {
            position: absolute;
            left: 590px;
        }

        .p-div3 strong {
            color: #333;
            font-family: verdana;
            line-height: 20px;
            text-align: right;
            font-weight: 400;
        }

        /*������������*/
        .quantity-form {
            position: absolute;
            overflow: hidden;
            height: 22px;
            width: 80px;
            top: 14px;
            left: 680px;
        }

        .decrement, .increment {
            display: inline-block;
            border: 1px solid #cacbcb;
            border-right: 0;
            height: 18px;
            line-height: 18px;
            padding: 1px 0;
            width: 16px;
            text-align: center;
            color: #666;
            margin: 0;
            background: #fff;
        }

        .increment {
            float: right;
            border-right: 1px solid #cacbcb;
            border-left: none;
        }

        .p-quantity-itxt {
            border: 1px solid #cacbcb;
            display: inline-block;
            position: absolute;
            left: 17px;
            top: 0;
            width: 46px;
            line-height: 18px;
            text-align: center;
            padding: 1px;
            margin: 0;
            font-size: 12px;
            font-family: verdana;
            color: #333;
            -webkit-appearance: none;

        }

        .p-sum {
            text-align: right;
            font-family: verdana;
        }

        .p-sum strong {
            color: #333;
            font-weight: 700;
        }

        .div4 {
            position: absolute;
            left: 815px;
        }

        /*����*/
        .p-ops {
            width: 75px;
        }

        .a1 {
            display: inline-block;
        }

        .div5 {
            position: absolute;
            left: 900px;
        }

        /*����*/
        .check {
            width: 990px;
            height: 52px;
            margin: 0px auto;
            margin-top: 19px;

            border: 1px solid #f0f0f0;
            position: relative;
        }

        .selectall {
            float: left;
            height: 18px;
            *width: 60px;
            line-height: 18px;
            padding: 16px 0 16px 9px;
            white-space: nowrap;
            position: relative;
            left: -11px;
        }

        .selectall-box {
            display: inline-block;
            position: relative;
            top: 1px;
        }

        .check .operation {
            float: left;
            height: 50px;
            width: 310px;
            line-height: 50px;
            position: relative;
            top: -16px;
        }

        .operation a {
            display: inline-block;
            float: left;
            margin-left: 20px;
            color: #666;
        }

        /*�����Ұ벿��*/
        .toolbar-right {
            position: relative;
            height: 52px;
            right: 0;
            top: -1px;
            width: 610px;

            top: -53px;
            left: 561px;
        }

        .amount-sum {
            float: right;
            color: #999;
            height: 44px;
            line-height: 20px;
            margin: 7px 0 0;
            cursor: pointer;
            position: relative;
            left: -321px;
            top: -1px;
        }

        .amount-sum em {
            color: #e4393c;
            font-family: verdana;
            font-weight: 700;
            margin: 0 3px;
        }

        .amount-sum b.up {
            background-position: -45px -91px;
        }

        .amount-sum b {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            width: 9px;
            height: 5px;
            background: url(img/images2/all2.png) -45px -91px;
            overflow: hidden;
            vertical-align: middle;
            margin: -5px 0 0 5px;
            -webkit-transition: all .2s ease-in 0s;
            -moz-transition: all .2s ease-in 0s;
            transition: all .2s ease-in 0s;
        }

        .txt {
            float: left;
            width: 110px;
            text-align: right;
            color: #999;
        }

        .toolbar-right-money {
            position: absolute;
            left: 299px;
            top: 7px;
        }

        .price {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            text-align: right;
            font-family: verdana;
        }

        .price-sum {
            line-height: 20px;
            color: #666;
        }

        .price-sum {
            line-height: 20px;
            color: #666;
        }

        .price-sum div {
            white-space: nowrap;
        }

        .amount-sum {
            float: right;
            color: #999;
            height: 44px;
            line-height: 20px;
            margin: 7px 0 0;
            cursor: pointer;
        }

        .price em {
            font-size: 16px;
            color: #e4393c;
            font-weight: 700;
        }

        .btn-area {
            float: right;
            position: relative;
            left: 99px;
        }

        .submit-btn {
            display: block;
            position: relative;
            width: 96px;
            height: 52px;
            line-height: 52px;
            color: #fff;
            text-align: center;
            font-size: 18px;
            font-family: "Microsoft YaHei";
            background: #e54346;
            overflow: hidden;
        }

        .submit-btn b {
            display: block;
            position: absolute;
            width: 96px;
            height: 52px;
            top: 0;
            left: 0;
            overflow: hidden;
            background: url(img/images2/jiesuan.png) 0 0 no-repeat;
        }

        .toolbar-right-money-span {
            display: inline-block;
            position: relative;
            top: 3px;
        }

        /*����ϲ��*/
        .w {
            width: 990px;
            margin: 0 auto;
        }

        #c-tabs-new {
            overflow: visible;
        }

        #c-tabs-new {
            position: relative;
            top: -31px;
        }

        #c-tabs-new .mt {
            margin-bottom: 10px;

            position: relative;
            top: -3px;
        }

        #c-tabs-new .c-item {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            padding-bottom: 3px;
            border-bottom: 2px solid #fff;
        }

        .extra-1-1 {
            position: absolute;
            left: 90px;
        }

        .extra-1-2 {
            position: absolute;
            left: 176px;
        }

        #c-tabs-new .c-item.curr {
            color: #e4393c;
            font-weight: 700;
            border-color: #e4393c;
        }

        #c-tabs-new a:HOVER {
            color: #e4393c;
            font-weight: 700;
            border-color: #e4393c;
        }

        /*�Ƽ��ֻ��*/
        #c-tabs-new .mc {
            overflow: visible;
            height: 326px;
        }

        #c-tabs-new .c-panel {
            position: relative;
            width: 100%;
            height: 100%;
        }

        #c-tabs-new .goods-list ul {
            display: inline-block;
            display: block;
            width: 100%;
            height: 100%;
            padding: 0px;

        }

        ul {
            list-style: none;
            padding: 0px;
        }

        #c-tabs-new .goods-list li {
            float: left;
            margin: 0px;
            padding: 0px;
        }

        #c-tabs-new .goods-list-tab {
            position: absolute;
            right: 0;
            top: -26px;
            width: 52px;
        }

        #c-tabs-new .goods-list-tab .curr {
            width: 26px;
            background: #e4393c;
        }

        #c-tabs-new .goods-list-tab .s-item {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            width: 8px;
            height: 8px;

            overflow: hidden;
            background: #aaa;
            vertical-align: middle;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            position: relative;

        }

        #c-tabs-new .goods-list-tab .curr {
            width: 26px;
            background: #e4393c;
        }

        #c-tabs-new .goods-list .item {
            position: relative;
            width: 206px;
            padding: 20px;
            background: #fff;
            margin: -1px 0 0 -1px;
            border: 1px dashed #cacaca;
            overflow: hidden;
        }

        .pp-img {
            width: 160px;
            margin: 0 auto;
        }

        img {
            border: 0;
            vertical-align: middle;
        }

        #c-tabs-new .goods-list .p-name {
            height: 36px;
            line-height: 18px;
            margin: 5px 0;
            overflow: hidden;
            left: 0px;
        }

        #c-tabs-new .goods-list .p-price {
            width: 100px;
            margin: 5px 0 2px;
        / / overflow: hidden;
            text-align: center;
        }

        .p-price-pos {
            position: relative;
            left: 55px;
        }

        #c-tabs-new .goods-list .p-price strong {
            font-size: 14px;
            color: #d91f20;
            font-family: verdana;
            font-weight: 400;
        }

        #c-tabs-new .goods-list .p-btn {
            margin: 10px 0 0;
            text-align: center;
        }

        #c-tabs-new .goods-list .btn-append {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            height: 28px;
            line-height: 28px;
            padding: 0 20px;
            border: 1px solid #999;
            color: #666;
            text-align: center;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        #c-tabs-new {
            position: relative;

        }

        .btn-append b {
            display: inline-block;
            height: 18px;
            width: 18px;
            margin-right: 5px;
            background-position: 0 -57px;
            background-repeat: no-repeat;
            overflow: hidden;
            vertical-align: middle;
        }

        .btn-append b {
            background-image: url(img/images2/gift.png);
        }

        .backpanel-inner {
            position: fixed;
            z-index: 999;
            left: 50%;
            margin-left: 495px;
            bottom: 51px;

        }

        .backpanel-inner .bp-item {
            width: 38px;
            height: 38px;
            background: #fff;
        }

        .backpanel-inner .bp-item .myfollow, .backpanel-inner .bp-item .survey, .backpanel-inner .bp-item .tohelp {
            background-position: 0 0;
            line-height: 14px;
            background-image: none;
            text-decoration: none;
            background-color: #aaa;
            color: #fff;
        }

        .backpanel-inner .bp-item {
            width: 38px;
            height: 38px;
            background: #fff;
        }

        .backpanel-inner .bp-item .backtop {
            background-position: 0 -55px;
        }

        .backpanel-inner .bp-item a {
            display: block;
            background-image: url(img/images2/xiangshang.png);
            background-color: #aaa;
            background-repeat: no-repeat;
            padding: 5px 0 0 7px;
            color: #fff;
            height: 33px;
            line-height: 1000px;
            overflow: hidden;
            margin-top: 5px;
        }

        /*����*/
        #service-2014 {
            margin-bottom: 20px;
            position: relative;
            top: -30px;
        }

        #service-2014 .slogen .item {
            display: inline-block;
            position: absolute;
            left: 50%;
            top: 20px;
            width: 245px;
            height: 54px;
            text-align: left;
            vertical-align: middle;
            font: 400 18px/50px "microsoft yahei";
        }

        .slogen {
            position: relative;
            height: 54px;
            padding: 20px 0;
            margin-bottom: 14px;
            background: #F5F5F5;
            text-align: center;
        }

        #service-2014 .slogen .fore1 i {
            background-image: url(img/images2/duo.png);
        }

        #service-2014 .slogen .fore2 i {
            background-image: url(img/images2/kuai.png);
        }

        #service-2014 .slogen .fore3 i {
            background-image: url(img/images2/hao.png);
        }

        #service-2014 .slogen .fore4 i {
            background-image: url(img/images2/sheng.png);
        }

        #service-2014 .slogen .fore1 {
            margin-left: -490px;
        }

        #service-2014 .slogen .item i {
            display: block;
            position: absolute;
            top: 0;
            left: 10px;
            width: 220px;
            height: 54px;
            background-repeat: no-repeat;
            background-position: 0 0;
        }

        #service-2014 .slogen .item b {
            padding: 0 10px;
            font-size: 24px;
            color: #C81623;
        }

        #service-2014 .slogen .fore2 {
            margin-left: -245px;
        }

        #service-2014 .slogen .fore3 {
            margin-left: 0;
        }

        #service-2014 .slogen .fore4 {
            margin-left: 245px;
        }

        #service-2014 dl {
            float: left;
            width: 222px;
        }

        #service-2014 dt {
            padding: 6px 0;
            font: 400 16px/24px "microsoft yahei";
        }

        #service-2014 dd {
            line-height: 20px;
        }

        #service-2014 dl.fore5 {
            width: 100px;
        }

        .clear, .clr {
            display: block;
            overflow: hidden;
            clear: both;
            height: 0;
            line-height: 0;
            font-size: 0;
        }

        /*�ײ���Ȩ��*/
        #footer-2014 {
            border-top: 1px solid #E5E5E5;
            padding-top: 20px;
            text-align: center;
        }

        #footer-2014 .links a {
            margin: 0 10px;
        }

        #footer-2014 .copyright {
            margin: 10px 0;
        }

        #footer-2014 .authentication a {
            margin: 0 5px;
            text-decoration: none;
        }

        img {
            border: 0;
            vertical-align: middle;
        }

        .all-bottom {
            width: 0px;
            height: 15px;
        }

        .centerDiv {
            width: 1360px;
            margin: 0 auto;
            position: relative;
        }

        .topBar {
            width: 100%;
            height: 30px;
            position: absolute;
            top: 0;
            left: 0;
            background-color: #F1F1F1;
        }

    </style>

</head>

<body>
<div class="topBar"></div>
<div class="centerDiv">
    <a name="top"></a>
    <!--最顶上的一条开始-->
    <div id="shortcut">
        <div class="w">
            <ul class="fl">
                <li class="dorpdown" id="ttbar-mycity">
                    <div class="dt cw-icon area-text-wrap">
                        <i class="ci-right"><s>◇</s></i> 送至：<span class="area-text" title="北京">北京</span>
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
                                        <a href="">重庆</a>
                                    </div>
                                    <div class="item">
                                        <a href="">河北</a>
                                    </div>
                                    <div class="item">
                                        <a href="">山西</a>
                                    </div>
                                    <div class="item">
                                        <a href="">河南</a>
                                    </div>
                                    <div class="item">
                                        <a href="">辽宁</a>
                                    </div>
                                    <div class="item">
                                        <a href="">吉林</a>
                                    </div>
                                    <div class="item">
                                        <a href="">黑龙江</a>
                                    </div>
                                    <div class="item">
                                        <a href="">内蒙古</a>
                                    </div>
                                    <div class="item">
                                        <a href="">江苏</a>
                                    </div>
                                    <div class="item">
                                        <a href="">山东</a>
                                    </div>
                                    <div class="item">
                                        <a href="">安徽</a>
                                    </div>
                                    <div class="item">
                                        <a href="">浙江</a>
                                    </div>
                                    <div class="item">
                                        <a href="">福建</a>
                                    </div>
                                    <div class="item">
                                        <a href="">湖北</a>
                                    </div>
                                    <div class="item">
                                        <a href="">湖南</a>
                                    </div>
                                    <div class="item">
                                        <a href="">广东</a>
                                    </div>
                                    <div class="item">
                                        <a href="">广西</a>
                                    </div>
                                    <div class="item">
                                        <a href="">江西</a>
                                    </div>
                                    <div class="item">
                                        <a href="">四川</a>
                                    </div>
                                    <div class="item">
                                        <a href="">海南</a>
                                    </div>
                                    <div class="item">
                                        <a href="">贵州</a>
                                    </div>
                                    <div class="item">
                                        <a href="">云南</a>
                                    </div>
                                    <div class="item">
                                        <a href="">西藏</a>
                                    </div>
                                    <div class="item">
                                        <a href="">陕西</a>
                                    </div>
                                    <div class="item">
                                        <a href="">甘肃</a>
                                    </div>
                                    <div class="item">
                                        <a href="">青海</a>
                                    </div>
                                    <div class="item">
                                        <a href="">宁夏</a>
                                    </div>
                                    <div class="item">
                                        <a href="">新疆</a>
                                    </div>
                                    <div class="item">
                                        <a href="">台湾</a>
                                    </div>
                                    <div class="item">
                                        <a href="">香港</a>
                                    </div>
                                    <div class="item">
                                        <a href="">澳门</a>
                                    </div>
                                    <div class="item">
                                        <a href="">钓鱼岛</a>
                                    </div>
                                    <div class="item">
                                        <a href="" target="_blank">海外</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="fr">
                <li class="fore1 nologin" id="ttbar-login">
                    您好,
                    <c:if test="${frontuser!=null}">${frontuser.username}</c:if>
                    <c:if test="${frontuser==null}"><a class="link-login style-red" style="text-decoration: none;color: #d81b2a;" href="JDDispatcherServlet?target=admin/user/frontLogin.jsp">请登录</a></c:if>
                    <a href="JDDispatcherServlet?target=admin/user/register.jsp" class="link-regist ">免费注册</a>
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
                        <a target="_blank" href="">我的京东</a>
                    </div>
                    <div class="dd dorpdown-layer">
                        <div class="dd-spacer"></div>
                        <div class="userinfo">
                            <div class="u-pic">
                                <a href=""><img src="img/images2/no-img_mid_.jpg" width="60" height="60"></a>
                            </div>
                            <div class="u-name u-login">
                                <a href="" class="link-login">你好，请登录</a>
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
                    <div class="dd dorpdown-layer" style="height: 187px;">

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
                            <img src="img/images2/guanzhujderweima.jpg" alt="关注京东">
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
                        <dl class="fore1">
                            <dt>特色主题</dt>
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
                        <dl class="fore2">
                            <dt>行业频道</dt>
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
                        <dl class="fore3">
                            <dt>生活服务</dt>
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
                        <dl class="fore4">
                            <dt>更多精选</dt>
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
    <!--最顶上的一条结束-->
    <div>

        <!-- 京东图标 -->
        <div class="logo">
            <div style="width: 270px;float: left;position: relative;"><a href="//www.jd.com/" class="link1"><img
                    src="img/images2/jd.png" alt="京东商城"/></a>
                <a href="#none" class="link2"><b></b>购物车</a></div>
            <div class="div-logo-form" style="display:inline-block;float: right;">
                <div style="padding: 0px;margin: 0px;">
                    <form action="getter">
                        <input style="color: rgb(153, 153, 153);" class="itxt" type="text" value="自营"/>
                        <input class="button" value="搜索" type="button"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="nologin-tip" style="visibility:hidden;">
        <span class="wicon"></span>
        您还没有登录！登录后购物车的商品将保存到您账号中
        <a class="btn-1 ml10" href="login.html" clstag="clickcart|keycount|xincart|cart_pageTopLogin">立即登录</a>
    </div>
    <!-- 标题处 -->
    <div class="div2">
        <a href="#" style="" class="toRed"><em class="div2-1 ">全部商品&nbsp;</em><span class="number switch">1</span></a>
        <a href="#"><em class="div2-1" style="margin-left: 27px;">京东大药房</em></a>
        <div class="sendToHere">
            <div>北京朝阳区</div>
            <b class="div2-b"></b>
        </div>
        <div class="sendTo">配送至：</div>

    </div>
    <div class="w-line">
        <div style="width: 82px; left: 0px;" class="floater"></div>
    </div>
    <div class="div2-line"></div>
    <div class="div3">
        <div class="cart-checkbox">
            <input checked="checked" id="selectAll2" class="jdcheckbox" type="checkbox"
                   style="position: relative;top:1px;">
            <label class="checked" for="">全选</label>
            <div class="t-goods">商品</div>
            <div class="t-price">单价(元)</div>
            <div class="t-quantity">数量</div>
            <div class="t-sum">小计(元)</div>
            <div class="t-action">操作</div>
        </div>
    </div>


    <!-- 京东商店-->
    <div class="goods">
        <!--京东自营那一条-->
        <div class="shop">
            <input checked="checked" name="checkShop" id="selectShop" class="jdcheckbox self-shop"
                   style="margin-top:6px;" type="checkbox">
            <a class="self-shop-name shop-a"></a>
            <div class="shop-mes"><span>购满￥99.00&nbsp;已免运费</span>
                <span class="tips-icon"></span>
            </div>
        </div>
        <form action="ZhiFuBaoServlet" method="post">
                <%
    					List<Products> list = (List<Products>)request.getAttribute("list");
							
						double productTotalPrice = 0;
						String subject="";
    					if(list!=null){


	    					for(Products product:list){
	    					
	    						int shoppingCartSum = product.getShoppingCartSum();
	    						double price = product.getPrice();
	    						double singleProductTotalPrice = price * shoppingCartSum;
	    						productTotalPrice = productTotalPrice + singleProductTotalPrice;
	    						subject+=product.getPname()+" ";
    				%>

            <!--单品-->
            <div class="buygoods buygoodsselected item-list">
                <input type="hidden" class="pid" name="pid" value="<%=product.getPid()%>">
                <!--图片及名称-->
                <div class="p-checkbox cell">
                    <input checked="checked"  class="selectGoods jdcheckbox" type="checkbox"/>
                </div>
                <!-- 手机图片 -->
                <div class="p-img">
                    <a target="_blank"><img alt="" src="img/productImage/<%=product.getShopping_car_img()%>"/></a>
                </div>
                <div class="p-name">
                    <a href="//item.jd.com/1601978.html" target="_blank"><%=product.getPname()%>
                    </a>
                </div>
                <div class="p-extend">
                    <span class="promise"><i></i><a>购买礼品包装</a></span><br/>
                    <span class="promise"><i style="background-position: 0 -23px;"></i><a class="jd-service" href="#none">购买增值保障</a></span>
                </div>
                <div class="p-div2">
                    <div class="props-txt" title="黑">颜色：黑</div>
                    <div class="props-txt" title="标准(16GB)">尺码：标准(16GB)</div>
                </div>
                <div style="font-weight: normal" class="cell p-price p-div3"><%=price%></div>
                <div class="quantity-form">
                    <a crement="-1" class="decrement changeCartSum">-</a>
                    <input value="<%=shoppingCartSum%>" type="text" autocomplete="off" class="p-quantity-itxt"/>
                    <a crement="1" class="increment changeCartSum">+</a>
                </div>

                <div class="cell p-sum div4"><%=singleProductTotalPrice%>
                </div>
                <div class="cell p-ops div5">
                    <!--单品-->
                    <a>删除</a>
                    <a class="a1">移到我的关注</a>
                </div>
            </div>
                <%
    						}
    					}
    				%>
    </div>
    <!-- 结算 -->
    <div class="check" id="selectall_div">
        <div class="selectall">
            <div style="float: left;" class="cart-checkbox">
                <input id="selectAll1" checked="checked" class="jdcheckbox selectall-box" type="checkbox">
                <label class="checked" for="">全选</label>
            </div>
            <div class="operation">
                <a href="#none" class="remove-batch">删除选中的商品</a>
                <a href="#none" class="follow-batch">移到我的关注</a>
            </div>
        </div>
    </div>
    <div class="toolbar-right">
        <div class="amount-sum">
            已选择<em>1</em>件商品<b class="up"></b>
        </div>
        <div class="toolbar-right-money">
            <span class="txt">总价（不含运费）：</span>
            <span class="price sumPrice"><em>￥<%=productTotalPrice%></em></span><br/>

            <span class="txt toolbar-right-money-span ">已节省：</span>
            <span class="price totalRePrice toolbar-right-money-span">-￥0.00</span>
        </div>
        <div class="btn-area">
            <input type="hidden" id="subject" value="<%=subject%>">
            <input type="hidden" id="total_amount" name="total_amount" value="<%=productTotalPrice%>">
            <%--<a class="submit-btn" href="ZhiFuBaoServlet?action=toPay&subject=<%=subject%>&total_amount=<%=productTotalPrice%>">--%>
            <input type="button" id="go_pay" class="submit-btn" value="去结算"></input>
        </div>
    </div>
    </form>
    <!-- 猜你喜欢 -->
    <div class="w">
        <div class="m m1" id="c-tabs-new">
            <div class="mt">
                <div class="extra-1">
                    <a href="#none" class="c-item curr">猜你喜欢</a>
                    <a href="#none" class="c-item extra-1-1">我的关注</a>
                    <a href="#none" class="c-item extra-1-2">最近浏览</a>
                </div>
            </div>
            <div style="position: relative;" class="mc c-panel-main">
                <div style="position: absolute; z-index: 1; opacity: 1;" class="c-panel ui-switchable-panel-selected"
                     id="guess-products">
                    <div class="goods-list-tab">
                        <a href="#none" class="s-item curr">&nbsp;</a>
                        <a href="#none" class="s-item">&nbsp;</a>
                        <a href="#none" class="s-item">&nbsp;</a>
                    </div>
                </div>
                <div style="position: absolute; z-index: 1; opacity: 1;"
                     class="goods-list c-panel ui-switchable-panel-selected">
                    <ul>
                        <li>
                            <div class="item">
                                <div style="width: 160px;margin: 0 auto;">
                                    <a target="_blank" href="#"><img src="img/images2/tj1.jpg"
                                                                     alt="派滋 小米note手机壳 透明硅胶软保护套" height="160"
                                                                     width="160"></a>
                                </div>
                                <div class="p-name2">
                                    <a target="_blank" href="#">派滋 小米note手机壳 透明硅胶软保护套<br></a>
                                </div>

                                <div class="p-price p-price-pos">
                                    <em>￥</em><i>19.00</i>
                                </div>
                                <div class="p-btn">
                                    <a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item">
                                <div style="width: 160px;margin: 0 auto;">
                                    <a target="_blank" href="#"><img src="img/images2/tj2.jpg"
                                                                     alt="派滋 小米note手机壳 透明硅胶软保护套" height="160"
                                                                     width="160"></a>
                                </div>
                                <div class="p-name2">
                                    <a target="_blank" href="#">阿奇猫 小米note手机壳/保护套智能唤醒休眠皮套 适用于小米NOTE/顶配版<br></a>
                                </div>

                                <div class="p-price p-price-pos">
                                    <em>￥</em><i>29.00</i>
                                </div>
                                <div class="p-btn">
                                    <a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item">
                                <div style="width: 160px;margin: 0 auto;">
                                    <a target="_blank" href="#"><img src="img/images2/tj3.jpg"
                                                                     alt="派滋 小米note手机壳 透明硅胶软保护套" height="160"
                                                                     width="160"></a>
                                </div>
                                <div class="p-name2">
                                    <a target="_blank" href="#">耐尔金（NILLKIN）小米note 磨砂手机保护壳/保护套/手机套 黑色<br></a>
                                </div>

                                <div class="p-price p-price-pos">
                                    <em>￥</em><i>35.00</i>
                                </div>
                                <div class="p-btn">
                                    <a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item">
                                <div style="width: 160px;margin: 0 auto;">
                                    <a target="_blank" href="//item.jd.com/2290998.html"><img src="img/images2/tj4.jpg"
                                                                                              alt="派滋 小米note手机壳 透明硅胶软保护套"
                                                                                              height="160" width="160"></a>
                                </div>
                                <div class="p-name2">
                                    <a target="_blank" href="//item.jd.com/2290998.html">幻响（i-mu）小米Note 钢化膜 抗蓝光 防爆玻璃膜
                                        手机保护贴膜 5.7英寸 弧边<br></a>
                                </div>

                                <div class="p-price p-price-pos">
                                    <em>￥</em><i>29.00</i>
                                </div>
                                <div class="p-btn">
                                    <a href="#none" _pid="2290998" class="btn-append"><b></b>加入购物车</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 右边悬浮 -->
    <div class="w">
        <div class="backpanel-inner">
            <div id="bp-follow" class="bp-item ">
                <a target="_blank" class="survey" href="#">我的关注</a>
            </div>
            <div class="bp-item " id="bp-faq">
                <a href="#" class="survey" target="_blank">常见问题</a>
            </div>
            <div class="bp-item " id="bp-survery">
                <a href="#" class="survey" target="_blank">我要反馈</a>
            </div>
            <div style="display: block;" class="bp-item " id="bp-backtop">
                <a href="#top" class="backtop">返回顶部</a>
            </div>
        </div>
    </div>
    <!--服务 -->
    <div id="service-2014">
        <div class="slogen">
            <span class="item fore1"><i></i></span>
            <span class="item fore2"><i></i></span>
            <span class="item fore3"><i></i></span>
            <span class="item fore4"><i></i></span>
        </div>
        <div class="w">
            <dl class="fore1">
                <dt>购物指南</dt>
                <dd>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-29.html">购物流程</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-151.html">会员介绍</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-297.html">生活旅行/团购</a>
                    </div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue.html">常见问题</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-136.html">大家电</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/index.html">联系客服</a></div>
                </dd>
            </dl>
            <dl class="fore2">
                <dt>配送方式</dt>
                <dd>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81-100.html">上门自提</a>
                    </div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-81.html">211限时达</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/103-983.html">配送服务查询</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/109-188.html">配送费收取标准</a>
                    </div>
                    <div><a target="_blank" href="//en.jd.com/chinese.html">海外配送</a></div>
                </dd>
            </dl>
            <dl class="fore3">
                <dt>支付方式</dt>
                <dd>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-172.html">货到付款</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-173.html">在线支付</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-176.html">分期付款</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-174.html">邮局汇款</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-175.html">公司转账</a></div>
                </dd>
            </dl>
            <dl class="fore4">
                <dt>售后服务</dt>
                <dd>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/321-981.html">售后政策</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-132.html">价格保护</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/130-978.html">退款说明</a></div>
                    <div><a rel="nofollow" target="_blank" href="//myjd.jd.com/repair/repairs.action">返修/退换货</a></div>
                    <div><a rel="nofollow" target="_blank" href="//help.jd.com/user/issue/list-50.html">取消订单</a></div>
                </dd>
            </dl>
            <dl class="fore5">
                <dt>特色服务</dt>
                <dd>
                    <div><a target="_blank" href="//help.jd.com/user/issue/list-133.html">夺宝岛</a></div>
                    <div><a target="_blank" href="//help.jd.com/user/issue/list-134.html">DIY装机</a></div>
                    <div><a rel="nofollow" target="_blank" href="//fuwu.jd.com/">延保服务</a></div>
                    <div><a rel="nofollow" target="_blank" href="//o.jd.com/market/index.action">京东E卡</a></div>
                    <div><a rel="nofollow" target="_blank" href="//mobile.jd.com/">京东通信</a></div>
                    <div><a rel="nofollow" target="_blank" href="//s.jd.com/">京东JD+</a></div>
                </dd>
            </dl>
            <span class="clr"></span>
        </div>
    </div>
    <!-- 底部版权等 -->
    <div class="w" style="position: relative;top:-30px;">
        <div id="footer-2014">
            <div class="links">
                <a rel="nofollow" target="_blank" href="//www.jd.com/intro/about.aspx">关于我们</a>|
                <a rel="nofollow" target="_blank" href="//www.jd.com/contact/">联系我们</a>|
                <a rel="nofollow" target="_blank" href="//www.jd.com/contact/joinin.aspx">商家入驻</a>|
                <a rel="nofollow" target="_blank" href="//jzt.jd.com">营销中心</a>|
                <a rel="nofollow" target="_blank" href="//app.jd.com/">手机京东</a>|
                <a target="_blank" href="//club.jd.com/links.aspx">友情链接</a>|
                <a target="_blank" href="//media.jd.com/">销售联盟</a>|
                <a href="//club.jd.com/" target="_blank">京东社区</a>|
                <a href="//gongyi.jd.com" target="_blank">京东公益</a>|
                <a href="//en.jd.com/" target="_blank">English Site</a>|
                <a href="//en.jd.com/help/question-58.html" target="_blank">Contact Us</a>
            </div>
            <div class="copyright">
                <a target="_blank"
                   href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000088"><img
                        src="img/images2/gongan.png"> 京公网安备 11000002000088号</a>&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;
                <a target="_blank"
                   href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg">互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>&nbsp;&nbsp;|&nbsp;&nbsp;新出发京零&nbsp;字第大120007号<br>互联网出版许可证编号新出网证(京)字150号&nbsp;&nbsp;|&nbsp;&nbsp;
                <a rel="nofollow"
                   href="//img30.360buyimg.com/uba/jfs/t1036/328/1487467280/1405104/ea57ab94/5732f60aN53b01d06.jpg"
                   target="_blank">出版物经营许可证</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2014]2148-348号</a>&nbsp;&nbsp;|&nbsp;&nbsp;违法和不良信息举报电话：4006561155<br>Copyright&nbsp;©&nbsp;2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有&nbsp;&nbsp;|&nbsp;&nbsp;消费者维权热线：4006067733<br>京东旗下网站：
                <a href="https://www.jdpay.com/" target="_blank">京东钱包</a>
            </div>
            <div class="authentication">
                <a rel="nofollow" target="_blank"
                   href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026"> <img alt="经营性网站备案中心"
                                                                                                  src="img/images2/jingying.png"
                                                                                                  class="err-product"
                                                                                                  height="32"
                                                                                                  width="103"></a>
                <a rel="nofollow" target="_blank" id="urlknet" tabindex="-1"
                   href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005"> <img
                        onclick="CNNIC_change('urlknet')" oncontextmenu="return false;" name="CNNIC_seal" alt="可信网站"
                        src="img/images2/kexin.png" class="err-product" height="32" border="true" width="103"></a>
                <a rel="nofollow" target="_blank" href="http://www.bj.cyberpolice.cn/index.do"> <img alt="网络警察"
                                                                                                     src="img/images2/wangluo.png"
                                                                                                     class="err-product"
                                                                                                     height="32"
                                                                                                     width="103"> </a>
                <a rel="nofollow" target="_blank" href="https://search.szfw.org/cert/l/CX20120111001803001836"> <img
                        src="img/images2/chengxin.png" class="err-product" height="32" width="103"></a>
                <a target="_blank" href="http://www.12377.cn"><img src="img/images2/zhongguo.png" height="32"
                                                                   width="103"></a>
                <a target="_blank" href="http://www.12377.cn/node_548446.htm"><img src="img/images2/jubao.png"
                                                                                   height="32" width="103"></a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="js/network.js"></script>
<script type="text/javascript">
    $(function () {
        var isnoLogin = $("#ttbar-login").hasClass("nologin");
        if (isnoLogin) {//没有登陆
            //$("#ttbar-login").addClass("nologin");
            $(".nologin-tip").show();
            $(".div2").removeClass("div2login");
        } else {
            //$("#ttbar-login").removeClass("nologin");
            $(".nologin-tip").hide();
            $(".div2").addClass("div2login");
        }
        <!--选中店铺-->
        <!--送至北京-->
        Cookie_name = "span_name";//定义一个cookie
        if ($.cookie(Cookie_name)) {//如果该cookie已经存在
            $(".area-text").text($.cookie(Cookie_name));//将span内的地点改为读取到的cookie值
        }
        var $text;
        $(".area-content-list a").click(function () {
            $(".area-content-list a").removeClass("selected");
            $(this).addClass("selected");
            $text = $(this).text();
            //删除原有的cookie
            $.cookie(Cookie_name, null, {path: '/'});
            //保存新的cookie
            $.cookie(Cookie_name, $text, {path: '/', expires: 10});
            $(".area-text").text($.cookie(Cookie_name));
        });

        $(".jdcheckbox").click(function () {
            if ($(this).prop("checked") == true) {
                $(this).parents(".item-list").addClass("buygoodsselected");
                var checked = $(".buygoods").find("jdcheckbox");
                if (checked.prop("checked") == false) {
                    $("#selectAll2").prop("checked", false);
                    $("#selectAll1").prop("checked", false);
                }
            } else {
                $(this).parents(".item-list").removeClass("buygoodsselected");
                if ($("#selectAll2").prop("checked") == true) {
                    $("#selectAll2").prop("checked", false);
                }
                if ($("#selectAll1").prop("checked") == true) {
                    $("#selectAll1").prop("checked", false);
                }
            }
            calcAllPrice();//初始化总价格
        });

        $("#selectAll2").click(function () {
            if ($(this).prop("checked") == true) {
                $(this).parents(".div3").next(".goods").find(".jdcheckbox").prop("checked", true);
                $(this).parents(".div3").next(".goods").find(".item-list").addClass("buygoodsselected");
                $("#selectAll1").prop("checked", true);
            } else {
                $(this).parents(".div3").next(".goods").find(".jdcheckbox").prop("checked", false);
                $(this).parents(".div3").next(".goods").find(".item-list").removeClass("buygoodsselected");
                $("#selectAll1").prop("checked", false);
            }
            calcAllPrice();//初始化总价格
        });

        $("#selectAll1").click(function () {
            if ($(this).prop("checked") == true) {
                $(this).parents("#selectall_div").prev(".goods").find(".jdcheckbox").prop("checked", true);
                $(this).parents("#selectall_div").prev(".goods").find(".item-list").addClass("buygoodsselected");
                $("#selectAll2").prop("checked", true);
            } else {
                $(this).parents("#selectall_div").prev(".goods").find(".jdcheckbox").prop("checked", false);
                $(this).parents("#selectall_div").prev(".goods").find(".item-list").removeClass("buygoodsselected");
                $("#selectAll2").prop("checked", false);
            }
            calcAllPrice();//初始化总价格
        });
        $('.btn-area .submit-btn').click(function () {
            <%--var jsonlist = JSON.stringify(${list});--%>
            <%--console.log(jsonlist);--%>
            return;
        });//去结算页面

        //在这里写添加商品数量的功能
        $('.changeCartSum').click(function () {
            var input=$(this).parent().children('.p-quantity-itxt');
            var count=input.val();
            count=parseInt(count)+parseInt($(this).attr('crement'));
            if (count<1)
            {
                count=1;
            }
            input.val(count);//如果不小于1的话就设置它的值
            //先在这里获取pid的值才能去修改购物车的东西
            var pid=$(input).parent().parent().children(".pid").val();
            //修改购物车的商品数量
            new network('ShoppingCartServlet',{"action":"changeCartCount","pid":pid,"count":count}).then(function () {
                console.log("???")
            });
            var price=parseInt($(input).parent().parent().children('.p-price').text());//获取单价
            var xiaoji_price=price*count;
            $(input).parent().parent().children('.p-sum').text(xiaoji_price+'.0')//设置小计
            calcAllPrice();//这个函数是用来计算所有价格的
        });
        function calcAllPrice() {
            var all_price=0;
            $('.selectGoods').each(function () {
                var ischeck=$(this).prop("checked");
                if (ischeck)
                {
                    all_price+=parseInt($(this).parent().parent().children('.p-sum').text());
                }
            })
            $('.sumPrice').children('em').text('￥'+all_price+'.0');
        }
        //去结算功能
        $('#go_pay').click(function () {
            var pids=[];
            var i=0;
            $(".pid").each(function () {
                pids[i++]=$(this).val();
            })
            var subject=$('#subject').val();
            var jsonPids=JSON.stringify(pids);//转换成json对象
            var total_amount=parseInt($('#total_amount').val());
            location.assign("OrderServlet?action=addOrder&subject="+subject+"&total_amount="+total_amount+"&pids="+jsonPids);
        })
    })
    
</script>
</html>
