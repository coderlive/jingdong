<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath %>"/>
    <meta charset="utf-8" />
    <title>京东(JD.COM)-综合网购首选-正品低价、品质保障、配送及时、轻松购物！</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <style type="text/css">
        body {
            font: 12px/150% Arial, Verdana, "\5b8b\4f53";
            color: #666;
            background: #fff;
            -webkit-font-smoothing: antialiased;
        }

        * {
            margin: 0;
            padding: 0;
        }

        a:hover {
            color: #C81623;
        }

        a {
            color: #666;
            text-decoration: none;
            margin: 0;
            padding: 0;
        }

        ul {
            list-style: none;
        }

        img {
            border: 0;
            vertical-align: middle;
        }

        a, address, b, big, blockquote, body, center, cite, code, dd, del, div, dl, dt, em,
        fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, label, legend,
        li, ol, p, pre, small, span, strong, u, ul, var {
            margin: 0;
            padding: 0;
        }


        .w {
            width: 1210px;
            height: 100px;
            margin: 0 auto;
        }



        .dorpdown {
            position: relative;
        }

        .dorpdown-layer {
            display: none;
            position: absolute;
        }

        .hide {
            display: none;
        }
        /*最上面一条的type 开始*/

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
            background: url(img/product/jd2015img.png) 0 0 no-repeat;
        }

        #shortcut #ttbar-apps:hover .dt .ci-left {
            background: url(img/product/jd2015img.png) 0 -25px no-repeat;
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

        #logo .logo {
            display: block;
            width: 270px;
            height: 60px;
            background: url(img/product/logo-201305.png) no-repeat 0 0;
            text-indent: -20000px;
        }

        #search {
            position: relative;
            z-index: 11;
            float: left;
            width: 462px;
            margin-top: 25px;
        }

        #search .form {
            width: 462px;
            height: 36px;
        }

        #search,
        #search .form {
            width: auto;
            _width: 538px;
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

        #shelper {
            width: 455px;
        }
        #search .text {
            float: left;
            width: 446px;
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

        #settleup {
            float: right;
            z-index: 11;
            height: 36px;
            margin-top: 25px;
            margin-right: 65px;
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

        #settleup:hover .cw-icon,
        #settleup:hover .dorpdown-layer {
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 0 5px rgba(0, 0, 0, .2);
        }

        #settleup .ci-left {
            top: 9px;
            left: 18px;
            width: 18px;
            height: 16px;
            background: url(img/product/jd2015img.png) 0 -58px no-repeat;
            /*_background: url(img/jd2015img.png) 0 -91px no-repeat;*/
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

        #settleup .ci-count {
            position: absolute;
            top: -4px;
            left: 104px;
            display: inline-block;
            padding: 1px 2px;
            font-size: 12px;
            line-height: 12px;
            color: #fff;
            background-color: #c81623;
            border-radius: 7px 7px 7px 0;
            min-width: 12px;
            text-align: center;
        }

        #settleup:hover .spacer {
            position: absolute;
            right: 0;
            top: -7px;
            width: 139px;
            height: 12px;
            background: #fff;
        }

        #settleup:hover .cw-icon,
        #settleup:hover .dorpdown-layer {
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 0 5px rgba(0, 0, 0, .2);
        }

        #settleup:hover .dorpdown-layer {
            display: block;
            right: 0;
            _right: -1px;
            width: 308px;
        }

        #settleup-content {
            position: relative;
            z-index: 2;
            width: 100%;
            background: #fff;
        }

        #settleup .prompt {
            padding: 10px 15px;
        }

        #settleup-content .loading {
            display: block;
            height: 50px;
            background: url(img/product/loading.gif) no-repeat center center;
        }

        #settleup .nogoods {
            padding-left: 30px;
            height: 49px;
            line-height: 49px;
            overflow: hidden;
            color: #999;
        }

        #settleup .nogoods b {
            float: left;
            width: 56px;
            height: 49px;
            background-image: url(img/product/settleup-nogoods.png);
        }

        #hotwords {
            float: left;
            width: 462px;
            height: 20px;
            line-height: 20px;
            overflow: hidden;
        }

        #hotwords a {
            float: left;
            white-space: nowrap;
            margin-right: 10px;
        }

        .style-red {
            color: #C81623;
        }
        /*搜索部分 type 结束*/
        /*导航栏 所有商品开始*/

        #nav {
            height: 44px;
            border-bottom: 2px solid #B1191A;
            _overflow: hidden
        }

        #nav .w {
            position: relative;
            z-index: 9;
            height: 44px
        }

        #nav .w .w-spacer {
            display: none
        }

        #nav .w-spacer {
            position: absolute;
            top: -1px;
            z-index: 1;
            width: 100%;
            height: 44px;
            border-top: 1px solid #DDD;
            border-bottom: 2px solid #B1191A
        }

        #categorys {
            float: left;
            position: relative;
            z-index: 10;
            width: 210px;
            height: 44px;
            overflow: visible;
            background: #B1191A
        }

        #categorys .dt a {
            display: block;
            width: 190px;
            height: 44px;
            padding: 0 10px;
            background: #B1191A;
            font: 400 15px/44px "microsoft yahei";
            color: #fff;
            text-decoration: none
        }

        #categorys .dt s {
            position: relative;
            top: -9px;
            text-decoration: none;
        }

        #categorys .dt .ci-right {
            top: 20px;
            right: 7px;
            height: 7px;
            overflow: hidden;
            font: 700 20px/16px simsun;
            color: #fff;
            transition: transform .1s ease-in 0s;
            -webkit-transition: -webkit-transform .1s ease-in 0s;
            display: block;
            position: absolute;
        }


        #categorys #category-dorpdown-layer{
            height: 466px;
            background: #c81623;
            margin-top: 2px;
        }
        /*修改修改*/
        /*#categorys .dd{*/
        /*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
        .add-category-none{
            height: 466px;
            background: #c81623;
            margin-top: 2px;
            display: none;
        }

        .add-category-block{
            height: 466px;
            background: #c81623;
            margin-top: 2px;
            display:inherit;
        }






        #categorys .dd-inner .item {
            border-left: 1px solid #b61d1d;
            position: relative;
            z-index: 1;
            height: 31px;
            color: #fff;
        }

        #categorys .dd-inner .item a {
            color: #fff;
        }

        #categorys .dd-inner h3 {
            position: absolute;
            z-index: 2;
            height: 31px;
            padding: 0 10px;
            line-height: 31px;
            font-family: "microsoft yahei";
            font-size: 14px;
            font-weight: 400;
        }

        #categorys .dd-inner i {
            position: absolute;
            z-index: 1;
            top: 9px;
            right: 14px;
            width: 4px;
            height: 14px;
            font: 400 9px/14px consolas;
        }

        #categorys .dd-inner .hover {
            background: #f7f7f7;
            color: #B61D1D;
        }

        #categorys .dd-inner .hover a {
            color: #B61D1D;
        }

        #categorys .dd-inner .hover i {
            top: 0;
            left: 205px;
            width: 14px;
            height: 31px;
            background: #f7f7f7;
            overflow: hidden;
            line-height: 200px;
        }

        #categorys .dorpdown-layer {
            display: none;
            position: absolute;
            left: 209px;
            top: 45px;
            width: 779px;
            background: #f7f7f7;
            border: 1px solid #b61d1d;
            overflow: hidden;
        }

        #categorys .dd:hover .dorpdown-layer {
            display: block;
        }

        #categorys .item-sub {
            display: none;
            zoom: 1;
            overflow: hidden;
        }

        #categorys .item-sub:hover {
            display: block;
        }

        #categorys .item-sub:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
        }

        #categorys .item-channels {
            float: left;
            display: inline;
            width: 570px;
            height: 24px;
            padding: 20px 0 0 20px;
            background: #f7f7f7;
            overflow: hidden;
        }

        #categorys .item-channels a {
            float: left;
            display: inline;
            display: inline-block;
            padding: 0 0 0 8px;
            margin-right: 10px;
            line-height: 24px;
            background: #7C7171;
            color: #fff;
            white-space: nowrap
        }

        #categorys .item-channels a:hover {
            background: #C81623
        }

        #categorys .item-channels a:hover i {
            background: #B1191A
        }

        #categorys .item-channels i {
            display: inline-block;
            margin-left: 8px;
            width: 23px;
            height: 24px;
            font: 400 9px/24px consolas;
            background: #5c5251;
            text-align: center;
            cursor: pointer
        }

        #categorys .item-channels .line {
            border-left: 1px solid #dbdbdb;
            display: inline;
            float: left;
            height: 24px;
            margin-right: 7px;
            width: 1px;
            overflow: hidden
        }

        #categorys .item-channels .img-link {
            background: 0 0;
            line-height: normal;
            padding: 0
        }

        #categorys .item-channels .img-link:hover {
            background: 0 0
        }

        #categorys .item-channels .style-red {
            background: #c81623
        }

        #categorys .item-channels .style-red i {
            background: #b1191a
        }

        #categorys .item-channels .style-red:hover {
            background: #961019
        }

        #categorys .item-channels .style-red:hover i {
            background: #851313
        }

        #categorys .subitems {
            float: left;
            width: 570px;
            padding: 6px 0 1006px 20px;
            margin-bottom: -1000px;
            background: #f7f7f7;
            min-height: 409px;
            /*_height: 409px;
				_overflow: visible*/
        }

        #categorys .subitems dl {
            width: 100%;
            overflow: hidden;
            line-height: 2em
        }

        #categorys .subitems dl.fore1 dd {
            border-top: none
        }

        #categorys .subitems dt {
            position: relative;
            float: left;
            width: 54px;
            padding: 8px 30px 0 0;
            text-align: right;
            font-weight: 700
        }

        #categorys .subitems dt i {
            position: absolute;
            top: 13px;
            right: 18px;
            width: 4px;
            height: 14px;
            font: 400 9px/14px consolas;
        }

        #categorys .subitems dd {
            float: left;
            width: 480px;
            padding: 6px 0;
            border-top: 1px solid #eee
        }

        #categorys .subitems dd a {
            float: left;
            padding: 0 8px;
            margin: 4px 0;
            line-height: 16px;
            height: 16px;
            border-left: 1px solid #e0e0e0;
            white-space: nowrap
        }

        #categorys .subitems .style-red {
            color: #c81623
        }

        #categorys .subitems .style-red-border {
            float: left;
            margin: 4px 8px 4px 0;
            height: 16px;
            background: #f6f0f0;
            overflow: hidden
        }

        #categorys .subitems .style-red-border a {
            font-family: "Microsoft YaHei", tahoma, arial, "Hiragino Sans GB", "\5b8b\4f53", sans-serif;
            color: #c81623;
            line-height: 12px;
            line-height: 14px\9;
            line-height: 14px\0;
            line-height: 12px\9\0;
            height: 12px;
            padding: 1px;
            margin: 0;
            border: 1px dotted #db7078;
            border-left: none;
            border-right: none;
            display: inline-block
        }

        #categorys .subitems .style-red-border .left-b,
        #categorys .subitems .style-red-border .right-b {
            float: left;
            background: url(img/product/buying.png) no-repeat 0 0;
            /*//img10.360buyimg.com/uba/jfs/t2986/155/1039328667/119/6d2a472a/57722598N82f09586.png*/
            width: 5px;
            height: 16px
        }

        #categorys .subitems .style-red-border .right-b {
            background-position: -5px 0
        }

        #categorys .item-brands {
            float: right;
            display: inline;
            width: 168px;
            overflow: hidden;
            margin: 19px 20px 10px 0
        }

        #categorys .item-brands a {
            float: left;
            display: inline;
            margin: 1px 0 0 1px
        }

        #categorys .item-promotions {
            float: right;
            display: inline;
            width: 168px;
            margin-right: 20px
        }

        #categorys .item-promotions a {
            display: block;
            margin-bottom: 1px
        }

        #nav .hover .dt .ci-right {
            transform: rotate(180deg);
            -webkit-transform: rotate(180deg);
            /*_top: 17px*/
        }

        #navitems {
            float: left;
            position: relative;
            z-index: 2
        }

        #navitems .spacer,
        #navitems a,
        #navitems li,
        #navitems ul {
            float: left
        }

        #navitems .spacer {
            display: none
        }

        #navitems a {
            height: 44px;
            padding: 0 20px;
            text-align: center;
            text-decoration: none;
            font: 400 15px/44px "microsoft yahei";
            color: #333
        }

        #navitems a:hover {
            color: #C81623
        }

        #navitems .spacer {
            width: 1px;
            height: 24px;
            margin: 10px 0 0;
            background: #DDD;
            overflow: hidden
        }

        #treasure {
            float: right
        }

        #categorys .item-channels {
            width: 790px
        }

        #categorys .dorpdown-layer {
            width: 999px
        }

        #categorys .subitems {
            width: 790px
        }

        #categorys .subitems dd {
            width: 620px
        }

        #categorys .subitems-main1,
        #categorys .subitems-main2 {
            float: left;
            width: 365px;
            padding-right: 10px;
            margin-right: 10px;
            border-right: 1px solid #eee;
            margin-top: 8px
        }

        #categorys .subitems-main1 dd,
        #categorys .subitems-main2 dd {
            width: 275px
        }

        #categorys .subitems-main1 .fore1,
        #categorys .subitems-main1 .fore8,
        #categorys .subitems-main2 .fore1,
        #categorys .subitems-main2 .fore8 {
            margin-top: -5px
        }

        #categorys .subitems-main1 .fore1 dd,
        #categorys .subitems-main1 .fore8 dd,
        #categorys .subitems-main2 .fore1 dd,
        #categorys .subitems-main2 .fore8 dd {
            border-top: 0
        }

        #categorys .subitems-main2 {
            border-right: 0
        }

        #navitems li a {
            font-size: 16px
        }
        /*导航栏结束*/

        /*灰色条 导航 开始*/
        .crumb-wrap {
            background: #f2f2f2;
            position: relative;
            clear: both;
        }

        .crumb-wrap .w {
            width: 1210px;
            height: 45px;
            margin: 0 auto;
        }

        .crumb {
            position: relative;
            z-index: 5;
            padding: 13px 0 9px;
        }

        .fl {
            float: left;
        }


        .crumb .item {
            float: left;
        }


        .crumb .sep {
            font-family: simsun;
            padding: 0 10px;
        }

        .crumb-br {
            top: -2px;
        }

        .EDropdown, .EDropdown .head {
            position: relative;
        }

        /*华为*/
        .crumb-br .border .head {
            border-bottom: 1px solid #ccc;
            height: 20px;
            line-height: 20px;
            background-color: #fff;
        }
        /*设置边框*/
        .EDropdown .border .head {
            border: 1px solid #ccc;
            border-bottom: none;
            padding: 0;
        }
        .crumb-br .head a {
            padding: 0 5px;
        }

        /*华为后面的 小箭头 arrow*/
        .crumb-br .arrow {
            margin-left: 0;
        }
        .EDropdown .arrow {
            display: inline-block;
            vertical-align: middle;
            width: 13px;
            height: 7px;
            margin: 0 10px 0 5px;

            background: url(img/product/arr-close.png) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.12/components/common/i/arr-close.png*/
            /*transition: .2s ease;
    			-ms-transition: .2s ease;
    			-moz-transition: .2s ease;
    			-webkit-transition: .2s ease;
    			-o-transition: .2s ease;*/
            transition: transform .1s ease-in 0s;
            -webkit-transition: -webkit-transform .1s ease-in 0s;
        }
        /*小箭头旋转180°*/
        #head:hover .jiantou {
            transform: rotate(180deg);
            -webkit-transform: rotate(180deg);
        }

        /*出来的下拉框的样式 动画写在了js中*/
        .EDropdown .content {
            right: auto;
            left: 0;
        }
        .EDropdown .border .content {
            border: 1px solid #ccc;
        }
        .crumb-br .content {
            top: 20px;
            width: 660px;
            padding: 10px 0;
        }
        .EDropdown .content {
            position: absolute;
            z-index: 0;
            background-color: #fff;
            top: 23px;
            left: 0;
        }
        .hide {
            display: none;
        }

        .crumb-br .plist-1 {
            padding-bottom: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-bottom: 1px dotted #dfdfdf;
        }

        .plist-1 {
            padding: 0 10px;
        }

        .crumb-br .br-reco li {
            width: 206px;
            height: 65px;
            margin-left: 5px;
            clear: none;
        }
        .lh li {
            float: left;

        }

        .plist-1 .p-img {
            float: left;
            margin-right: 5px;
        }
        .p-img {
            padding-bottom: 5px;
        }

        .p-name {
            /*width: 200px;*/
            max-height: 3em;
            min-height: 36px;
            line-height: 1.5em;
            margin-bottom: 5px;
        }


        .p-price strong {
            color: #e4393c;
            font-size: 14px;
            font-family: Verdana;
        }

        /*下面那几行文字*/
        .crumb-br .br-list li {
            display: inline-block;
            width: 110px;
            padding-left: 15px;
            margin-top: 5px;
        }
        .crumb-br .br-list li, .ellipsis {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }


        /*灰色导航右边部分*/
        .contact {
            padding: 13px 0 0;
        }
        .fr {
            float: right;
        }

        .contact .item{
            float:left;
        }

        .contact .name {
            float: left;
            margin-right: 10px;
        }

        .contact .name .u-jd {
            display: inline-block;
            width: 54px;
            height: 18px;
            line-height: 18px;
            text-align: center;
            border-radius: 3px;
            font-family: simsun;
            color: #fff;
            background: #e4393c;
            margin-left: 3px;
        }
        em, i, u {
            font-style: normal;
        }

        .contact .follow, .contact .im, .contact .jimi, .contact .phone {
            cursor: pointer;
            float: left;
            margin-right: 10px;
            white-space: nowrap;
        }

        .contact .im.gys-im .sprite-im {
            background: url(img/product/sprite-gys-im.gif) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.12/components/contact/i/sprite-gys-im.gif*/
        }

        .contact .im .sprite-im {
            width: 16px;
            height: 20px;
            display: inline-block;
        }

        .contact .jimi .sprite-jimi {
            width: 17px;
            height: 18px;
            background-image: url(img/product/__sprite.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/contact/i/__sprite.png*/
            background-position: 0 0;
            margin-top: -3px;
        }
        .contact .follow i, .contact .im i, .contact .jimi i, .contact .phone i {
            display: inline-block;
            vertical-align: middle;
            margin-right: 5px;
        }

        .contact .follow .sprite-follow {
            position: relative;
            top: -2px;
            width: 16px;
            background-position: -34px 0;
        }
        .contact .follow .sprite-follow, .contact .phone .sprite-phone, .contact .weichat-sp .sprite-qr {
            height: 16px;
            background-image: url(img/product/__sprite.png);
        }

        .contact .item span:hover {
            color: #C81623;
        }





        /*商品详情简略 开始*/
        /*最上面填充*/
        .product-intro {
            position: relative;
            margin-top: 10px;
            margin-bottom: 10px;
        }


        /*左边部分 大图加好几张小图*/
        .product-intro .preview-wrap {
            width: 452px;
            float: left;
            padding-bottom: 15px;
        }

        .preview {
            position: relative;
        }

        /*大图 样式*/
        .preview .jqzoom {
            position: relative;
            padding: 0;
        }
        .preview .main-img {
            border: 1px solid #eee;
            margin-bottom: 20px;
        }
        /*大图 右下方 放大镜图标*/
        .preview .main-img i {
            width: 30px;
            height: 30px;
            display: block;
            position: absolute;
            right: 0;
            bottom: 0;
            background: url(img/product/sprite-magnify.png) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.12/components/preview/i/sprite-magnify.png*/
        }


        /*那几个小图的样式*/
        .preview .spec-list {
            margin-bottom: 18px;
            position: relative;
        }
        /*向左的箭头*/
        .preview .spec-list .arrow-prev {
            left: 0;
        }
        .preview .spec-list .arrow-next, .preview .spec-list .arrow-prev {
            display: block;
            width: 22px;
            height: 32px;
            float: left;
            position: absolute;
            cursor: pointer;
            top: 50%;
            margin-top: -16px;
        }
        .preview .spec-list .arrow-prev.disabled i {
            background: url(img/product/disabled-prev.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/preview/i/disabled-prev.png*/
        }
        .preview .spec-list .arrow-prev .sprite-arrow-prev {
            width: 22px;
            height: 32px;
            background-image: url(img/product/1__sprite.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/preview/i/__sprite.png*/
            background-position: -30px 0;
        }
        .preview .spec-list .arrow-next i, .preview .spec-list .arrow-prev i {
            display: block;
        }
        /*向右的箭头*/
        .preview .spec-list .arrow-next {
            right: 0;
        }
        .preview .spec-list .arrow-next .sprite-arrow-next {
            width: 22px;
            height: 32px;
            background-image: url(img/product/1__sprite.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/preview/i/__sprite.png*/
            background-position: 0 -30px;
        }
        /*除箭头外的手机小图*/
        .preview .spec-items{
            margin: 0 auto;
        }
        /*_________________________________________________________________________*/
        #spec-list{
            position: absolute;
            width: 2000px;
        }
        .preview .spec-items ul li {
            float: left;
            margin: 0 9px;
        }
        /*第一个手机小图*/
        .preview .spec-items ul li img {
            border: 2px solid #fff;
        }
        /*悬浮在哪个小图上哪个加 红色边框*/
        .preview .spec-items ul li:hover img {
            border: 2px solid #e53e41;
        }


        /*小图下面下面的文字*/
        .preview .preview-info {
            height: 20px;
        }
        /*左边*/
        .preview .preview-info .sku {
            float: left;
            text-align: left;
        }
        /*右边*/
        .preview .preview-info .btns {
            float: right;
            margin-top: 0;
            text-align: left;
            font-variant: normal;
        }
        /*右边的 关注*/
        .preview .preview-info .btns a {
            float: left;
            margin-right: 10px;
            cursor: pointer;
        }
        /*关注 前面的 心*/
        .preview .preview-info .btns .follow i {
            width: 14px;
            height: 13px;
            background-image: url(img/product/1__sprite.png);
            background-position: -52px -44px;
        }
        .preview .preview-info .btns a i {
            display: inline-block;
            vertical-align: middle;
            margin-right: 5px;
        }

        /*分享前面的小图标*/
        .preview .preview-info .btns .share i {
            width: 15px;
            height: 14px;
            background-image: url(img/product/1__sprite.png);
            background-position: -52px -16px;
        }

        /*对比 前面的 小图标*/
        .preview .preview-info .btns .compare i {
            width: 15px;
            height: 16px;
            background-image: url(img/product/1__sprite.png);
            background-position: -30px -32px;
        }


        /*商品详情简略  右边部分*/
        .product-intro .itemInfo-wrap {
            width: 738px;
            float: right;
        }

        /*华为P9 标题*/
        .itemInfo-wrap .sku-name {
            font: 700 16px Arial,"microsoft yahei";
            color: #666;
            padding-top: 10px;
            line-height: 28px;
            margin-bottom: 5px;
        }
        /*标题下面  两行红色小字*/
        .itemInfo-wrap .news {
            color: #e4393c;
            margin-bottom: 5px;
        }
        /*红字 整体样式*/
        .itemInfo-wrap .news .item {
            width: 738px;
            margin-bottom: 5px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        /*蓝色 超链接*/
        .itemInfo-wrap .news .item a {
            text-decoration: underline;
        }
        .itemInfo-wrap .news a {
            color: #5e69ad;
        }
        /*红色小字第二行*/
        #p-ad-phone {
            height: 18px;
            text-overflow: ellipsis;
        }


        /*字下面的灰色块部分*/
        .itemInfo-wrap .summary {
            position: relative;
            padding-bottom: 5px;
        }
        .itemInfo-wrap .summary-price-wrap {
            padding: 10px 10px 10px 0;
            background: url(img/product/price-bg.png) repeat-x #efefef;
            /*//static.360buyimg.com/item/default/1.0.12/components/common/i/price-bg.png*/
        }
        .itemInfo-wrap .summary-price-wrap .summary-price {
            position: relative;
            margin-bottom: 5px;
        }
        /*京东价 样式*/
        .itemInfo-wrap .summary-price-wrap .summary-price .dt {
            line-height: 22px;
        }
        .itemInfo-wrap .dt {
            float: left;
            width: 50px;
            padding-left: 10px;
            font-family: simsun;
            color: #999;
        }

        .itemInfo-wrap .dd {
            margin-left: 70px;
        }

        /*红色价格 3188*/
        .itemInfo-wrap .summary-price-wrap .summary-price .p-price {
            color: #E4393C;
            font-family: "microsoft yahei";
            margin-right: 5px;
        }
        /*￥*/
        .itemInfo-wrap .summary-price-wrap .summary-price .p-price span {
            font-size: 16px;
        }
        /*3188*/
        .itemInfo-wrap .summary-price-wrap .summary-price .p-price .price {
            font-size: 22px;
        }
        /*降价通知*/
        .itemInfo-wrap .summary-price-wrap .summary-price .notice {
            color: #5e69ad;
            vertical-align: 2px;
        }

        /*累计评价*/
        .itemInfo-wrap .summary-price-wrap .summary-info {
            position: absolute;
            z-index: 1;
            right: 10px;
            top: 12px;
            color: #999;
        }
        .itemInfo-wrap .summary-price-wrap .summary-info {
            color: #999;
        }
        .itemInfo-wrap .summary-price-wrap .summary-info a {
            color: #005aa0;
            margin-left: 5px;
        }


        /*促销 这一大块*/
        .itemInfo-wrap .summary-price-wrap .summary-top {
            display: block;
        }
        /*促销 两个字样式*/
        #summary-promotion .dt {
            line-height: 30px;
        }
        /*促销后面的那块*/
        .itemInfo-wrap .summary-price-wrap .summary-top .p-promotions-wrap {
            position: relative;
            overflow: hidden;
        }
        .itemInfo-wrap .summary-price-wrap .summary-top .p-promotions {
            position: relative;
            line-height: 30px;
            padding-right: 90px;
        }
        /*以下促销可在购物车任选其一*/
        .itemInfo-wrap .summary-price-wrap .summary-top .p-promotions .hl_red {
            color: #999;
            line-height: 18px;
        }
        /*满赠*/
        .itemInfo-wrap .summary-price-wrap .summary-top .p-promotions .hl_red_bg {
            color: #fff;
            background: #f0999b;
            padding: 2px;
            margin-right: 5px;
            display: inline-block;
            line-height: 18px;
        }
        /*满赠后面灰色字*/
        .itemInfo-wrap .summary-price-wrap .summary-top .p-promotions a:link {
            color: #999;
        }
        /*灰色字后面  >> 符号*/
        .itemInfo-wrap .s-arrow {
            font-family: simsun;
            text-decoration: none;
        }

        #summary-quan {
            padding-bottom: 2px;
        }
        .li {
            margin-bottom: 3px;
            line-height: 32px;
            display: block;
        }




        /*灰色框下面部分*/
        .itemInfo-wrap .summary {
            position: relative;
            padding-bottom: 5px;
        }
        /*以旧换新*/
        .choose-support li {
            margin-right: 10px;
            float: left;
        }
        .choose-support a .sprite-old2new {
            background-position: -16px -16px;
        }

        .choose-support a .sprite-giftbuy, .choose-support a .sprite-jnbt,
        .choose-support a .sprite-old2new, .choose-support a .sprite-question,
        .choose-support a .sprite-sjwx, .choose-support a .sprite-tcbg {
            width: 16px;
            height: 16px;
            background-image: url(img/product/2__sprite.png);
        }
        .choose-support a i {
            display: inline-block;
        }
        .DJD-tips i, .choose-support a i, .summary-stock .dcashDesc i {
            vertical-align: middle;
        }

        .choose-support a span {
            color: #5e69ad;
        }
        .choose-support a .sprite-tcbg {
            background-position: 0 -32px;
        }




        /*配送至 这一块*/
        #summary-support{
            width: 738px;
            height: 32px;
        }
        .summary-stock {
            padding-bottom: 5px;
            margin-bottom: 15px;
            border-bottom: 1px dotted #dfdfdf;
        }
        .summary-stock .store {
            margin-bottom: 5px;
        }
        /*北京朝阳区三环以内*/
        .stock-address {
            float: left;
            margin-top: -3px;
            margin-left: -5px;
        }
        .EDropdown, .EDropdown .head {
            position: relative;
        }

        .stock-address .head {
            white-space: nowrap;
        }
        .EDropdown .head {
            height: 23px;
            line-height: 23px;
            float: left;
            z-index: 1;
            padding: 1px 1px 0;
            cursor: pointer;
        }

        .stock-address .head .text {
            float: left;
        }
        .EDropdown .head .text {
            margin-left: 5px;
        }

        /*有货*/
        .summary-stock .store .store-prompt {
            margin-right: 10px;
            color: #999;
            height: 24px;
            float: left;
        }
        .summary-stock .store .store-prompt strong {
            margin-right: 5px;
            float: left;
            font-size: 12px;
        }

        /*有货后面 整体*/
        .promise-icon-more {
            padding-left: 5px;
        }
        .promise-icon {
            height: 24px;
        }

        .promise-icon .title {
            margin-right: 5px;
        }

        .promise-icon-more .icon-list {
            position: relative;
            padding-right: 20px;
        }
        .promise-icon .icon-list {
            display: inline-block;
            height: 20px;
            overflow: hidden;
        }

        .promise-icon ul {
            background-image: none;
            float: left;
            display: block;
        }

        .promise-icon ul a {
            color: #646FB0;
            float: left;
            overflow: hidden;
            margin-bottom: 5px;
            padding: 0 10px;
            border-right: 1px solid #EAEAEA;
        }

        .promise-icon ul .noborder {
            border-right: none;
        }

        .clear, .clr {
            display: block;
            overflow: hidden;
            clear: both;
            height: 0;
            line-height: 0;
            font-size: 0;
        }


        /*由京东发货...*/
        .summary-stock .summary-service {
            color: #999;
            margin-bottom: 5px;
            display: block;
            width: 410px;
        }

        /*下面的 选择 小图*/
        #choose-color {
            line-height: 40px;
        }
        .li {
            margin-bottom: 3px;
            line-height: 32px;
            display: inline-block;
            display: block;
        }

        /*选择颜色*/
        .itemInfo-wrap .dt {
            float: left;
            width: 50px;
            padding-left: 10px;
            font-family: simsun;
            color: #999;
        }

        /*第一个小图*/
        #choose-color{
            width: 738px;
            height: 47px;
        }

        #choose-color .item {
            background-color: #F7F7F7;
        }
        .li .item {
            float: left;
            color: #666;
            /*background-color: #FFF;*/
            margin-right: 7px;
            margin-bottom: 4px;
            position: relative;
        }
        #choose-color .item a, .ebook #choose-series .item a {
            padding: 0;
        }
        .li .item.hover a, .li .item.selected a, .li .item:hover a {
            border: 1px solid #e3393c;
            color: #666;
        }
        .li .item a {
            display: block;
            white-space: nowrap;
        }
        #choose-color .item a i {
            margin: 0 8px;
        }


        /*选择版本*/
        #choose-version{
            width: 738px;
            height: 38px;
        }
        /*下面 的字*/
        .li .item.disabled a {
            border: 1px dashed #ccc;
            cursor: not-allowed;
            color: #999;
        }


        /*购买方式*/
        #choose-type{
            width: 738px;
            height: 38px;
        }
        #choose-type .J-btype-item .selected{
            display: block;
            width: 76px;
            height: 34px;
            border: 1px solid #e3393c;
            color: #666;
            text-align: center;

        }
        #choose-type .J-btype-item,#choose-suits .item{
            display: block;
            width: 76px;
            height: 34px;
            border: 1px solid #CCCCCC;
            color: #666;
            text-align: center;
        }


        /*套装*/
        #choose-suits{
            width: 738px;
            height: 38px;
        }
        #choose-suits .item{
            width: 76px;
            height: 34px;
        }
        #choose-suits .dd {
            position: relative;
        }
        .choose-suits .item .title {
            background-color: #FFF;
            position: relative;
        }


        .choose-suits .suits-panel {
            position: absolute;
            top: 33px;
            left: 0;
            z-index: 1;
            background-color: #FFF;
            border: 1px solid #ccc;
            width: 500px;
            display: none;
        }


        /*增值保障*/
        #choose-service {
            width: 738px;
            height: 32px;
            margin-bottom: 7px;
            line-height: 18px;
        }
        #choose-service .dt {
            line-height: 30px;
        }
        #choose-service .service-type-yb {
            position: relative;
            z-index: 1;
        }
        /*意外保一年*/
        #choose-service .service-type-yb .yb-item-cat {
            float: left;
            position: relative;
        }
        #choose-service .service-type-yb .yb-item-cat .yb-item {
            padding: 4px 5px 4px 6px;
            margin: 0 7px 2px 0;
            border: 1px solid #DDD;
            line-height: 20px;
            position: relative;
            font-size: 0;
            z-index: 2;
            cursor: pointer;
        }
        #choose-service .service-type-yb .yb-item-cat .yb-item .icon {
            width: 16px;
            height: 16px;
            margin-right: 4px;
            display: inline-block;
        }
        #choose-service .service-type-yb .yb-item-cat .yb-item .name {
            font-size: 12px;
            margin-right: 4px;
            vertical-align: middle;
            max-width: 60px;
            height: 20px;
            overflow: hidden;
            display: inline-block;
        }
        /*价格*/
        #choose-service .service-type-yb .yb-item-cat .yb-item .price {
            margin-right: 5px;
            vertical-align: middle;
            font: 12px/150% Arial,Verdana,"\5b8b\4f53";
        }
        #choose-service .service-type-yb .yb-item-cat .yb-item .arrow-icon {
            width: 15px;
            height: 10px;
            display: inline-block;
            vertical-align: middle;
            background: url(img/product/service-icon.png) -2px -1px;
            /*//static.360buyimg.com/item/default/1.0.12/components/jdservice/i/service-icon.png*/

        }
        /*第一个下面的 下拉列表*/
        #choose-service .service-type-yb .yb-item-cat .more-item {
            display: none;
            position: absolute;
            top: 29px;
            background-color: #FFF;
            border: 1px solid #DDD;
            padding: 10px 0 5px 10px;
            width: 240px;
            overflow: hidden;
            z-index: 1;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li {
            margin-bottom: 10px;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title {
            height: 16px;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title .sprite-checkbox {
            display: inline-block;
            vertical-align: -3px;
            margin-right: 6px;
            width: 14px;
            height: 14px;
            background-image: url(img/product/3__sprite.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/jdservice/i/__sprite.png*/
            background-position: -16px 0;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title .tips {
            display: inline-block;
            padding: 0 4px;
            margin-right: 6px;
            background: #f19c9d;
            color: #fff;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title .name {
            display: inline-block;
            max-width: 60px;
            height: 16px;
            vertical-align: -3px;
            overflow: hidden;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title .price {
            margin-right: 0;
            margin-left: 6px;
        }
        #choose-service .service-type-yb .yb-item-cat .more-item ul li .title .detail-more {
            display: none;
            margin-left: 10px;
            color: #5e69ad;
        }

        /*增值保障 最后面的 问号*/
        #choose-service .service-tips {
            position: relative;
            float: left;
        }
        #choose-service .sprite-question {
            display: inline-block;
            vertical-align: -10px;
            width: 16px;
            height: 16px;
            background-image: url(img/product/3__sprite.png);
            background-position: 0 0;
        }
        #choose-service .service-tips .tips {
            width: 240px;
            position: absolute;
            left: -215px;
            top: 35px;
            display: none;
        }
        #choose-service .service-tips .tips .sprite-arrow {
            width: 11px;
            height: 6px;
            background-image: url(img/product/3__sprite.png);
            background-position: -14px -16px;
            position: absolute;
            overflow: hidden;
            left: 218px;
            top: -5px;
        }
        /*里面的内容 悬浮才出现的*/
        #choose-service .service-tips .tips .content {
            padding: 10px;
            background: #fff;
            border: 1px solid #cecbce;
            color: #666;
            -webkit-box-shadow: 0 0 2px 2px #eee;
            box-shadow: 0 0 2px 2px #eee;
        }
        #choose-service .service-tips .tips .content dd {
            line-height: 170%;
        }
        #choose-service .service-tips .tips .content p {
            border-top: 1px dotted #999;
            margin-top: 7px;
            padding-top: 7px;
        }
        #choose-service .service-tips .tips .content p a {
            color: #5e69ad;
            margin: 0 5px;
        }


        /*白条分期*/
        #choose-baitiao{
            width: 738px;
            height: 39px;
        }
        .baitiao-list {
            float: left;
        }
        .choose-baitiao .item {
            position: relative;
        }
        #choose-baitiao .item{
            display: block;
            width: 107px;
            height: 34px;
            border: 1px solid #CCCCCC;
            color: #666;
            text-align: center;
        }
        .choose-baitiao .item a {
            text-align: center;
        }
        .baitiao-list strong {
            font-weight: 400;
        }
        .baitiao-list span {
            color: #999;
        }
        /*白条第一个 隐藏起来的部分 悬浮才出现*/
        .baitiao-list .baitiao-tips {
            position: absolute;
            z-index: 6;
            top: 32px;
            left: 0;
            width: 250px;
            padding: 5px 10px;
            background: #fefff7;
            border: 1px solid #ccc;
            color: #666;
        }
        .baitiao-list .baitiao-tips ul {
            padding-bottom: 3px;
        }
        .baitiao-list .baitiao-tips li {
            margin-top: 5px;
            line-height: 18px;
        }

        /*最后面的 问号*/
        .bt-info-tips {
            float: left;
            height: 39px;
        }
        .choose-baitiao .question {
            background-image: url(img/product/question.png);
            /*//static.360buyimg.com/item/default/1.0.12/components/baitiao/i/question.png*/
        }
        .choose-baitiao .icon {
            width: 16px;
            height: 16px;
            overflow: hidden;
            line-height: 1000px;
            margin-top: 8px;
            margin-right: 5px;
        }
        .baitiao-text {
            clear: both;
        }



        /*加入购物车 这一大块*/
        .choose-btns {
            border-top: 1px dotted #dfdfdf;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 15px 10px 0;
        }
        /*前面 数字 加减 这里*/
        .choose-btns .choose-amount {
            width: 46px;
            height: 44px;
            overflow: hidden;
            border: 1px solid #ccc;
            position: relative;
        }
        .choose-btns .btn-lg, .choose-btns .choose-amount {
            margin-right: 10px;
            float: left;
        }

        .wrap-input{
            width: 49px;

        }
        /* 1 */
        .choose-btns .choose-amount input {
            display: block;
            width: 31px;
            height: 42px;
            line-height: 42px;
            position: absolute;
            top: 1px;
            left: 0;
            border: 0;
            text-align: center;
        }
        .wrap-input .buy-num{
            display: inline-block;
            width: 33px;
            height: 44px;
        }
        /* - 减号*/
        .choose-btns .choose-amount a.btn-reduce {
            widows: 15px;
            height: 22px;
            display: block;
            bottom: -1px;
            /*	background-color: blue;*/
            background-image: url(img/product/jianhao.png);
        }
        /* + 加号*/
        .choose-btns .choose-amount a.btn-add {
            display: block;
            widows: 15px;
            height: 22px;
            top: -1px;
            /*background-color: darkgoldenrod;*/
            background-image: url(img/product/jiahao.png);
        }

        .btn-lg {
            height: 46px;
            line-height: 46px;
            padding: 0 26px;
            font-size: 18px;
            font-family: "microsoft yahei";
        }
        .btn-special1, .btn-special2 {
            font-weight: 700;
        }

        .btn-primary, .btn-special1 {
            background-color: #df3033;
            color: #fff;
        }
        .btn-def, .btn-primary, .btn-special1, .btn-special2, .btn-special3 {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
        }
        .btn-special2, .btn-special3 {
            background-color: #85c360;
            color: #fff;
        }
        #InitCartUrl{
            display: block;
            width: 143px;
            height: 47px;
            overflow: hidden;
            background-image: url(img/product/cart.PNG);
        }

        /*下面两行小灰字*/
        .itemInfo-wrap .local-tips, .itemInfo-wrap .summary-tips {
            width: 738px;
            height: 18px;
            margin-bottom: 5px;
        }
        ol, ul {
            list-style: none;
        }
        .itemInfo-wrap .local-tips .tips-list li, .itemInfo-wrap .summary-tips .tips-list li {
            float: left;
            margin-right: 15px;
            font-family: simsun;
            color: #999;
        }






        #fittings{
            width: 1210px;
            height: 256px;
            position: absolute;
            /*background-color: pink;*/
            margin-top: 680px;
        }

        .ETab .tab-main {
            position: relative;
            background-color: #f7f7f7;
            border: 1px solid #eee;
            border-bottom: 1px solid #e4393c;
            display: block;
        }

        .ETab .tab-main ul {
            margin-top: -1px;
        }

        .ETab .tab-main li.current {
            background-color: #e4393c;
            color: #fff;
            cursor: default;
        }
        .ETab div.large li {
            padding: 10px 25px;
            font-size: 14px;
        }
        .ETab .tab-main li {
            position: relative;
            display: inline-block;
            font-family: "microsoft yahei";
            /*cursor: pointer;*/
        }

        /*更多配件*/
        .ETab .tab-main .extra {
            position: absolute;
            top: 0;
            right: 0;
        }
        .ETab .tab-main .extra .item {
            float: right;
            margin-right: 10px;
            padding-top: 8px;
        }
        .fittings .item {
            display: block;
        }

        /*导航下面这块*/
        .fittings .tab-con {
            padding-top: 20px;
        }
        .ETab .tab-con {
            padding: 10px 0;
        }

        .fittings .master {
            float: left;
            width: 144px;
        }

        .fittings .p-list {
            padding: 0 5px;
            width: 134px;
            height: 161px;
            position: relative;
            list-style: none;
        }
        .fittings .master .p-list {
            float: right;
        }
        /*第一个图*/
        .p-img {
            padding-bottom: 5px;
        }
        .m, .mb, .mc, .mt, .p-detail, .p-img, .p-market, .p-name, .p-price, .sm, .smb, .smc, .smt {
            overflow: hidden;
        }

        /*第一个图下面的字*/
        .fittings .p-list .p-name {
            margin-bottom: 0;
        }


        .fittings .p-list input {
            vertical-align: middle;
        }

        .fittings .p-list .p-price strong {
            font-size: 14px;
            line-height: 14px;
        }
        .p-price strong {
            color: #e4393c;
            font-size: 14px;
            font-family: Verdana;
        }

        /*加号*/
        .fittings .p-list .plus {
            width: 23px;
            height: 23px;
            overflow: hidden;
            line-height: 1000px;
            position: absolute;
            right: 8px;
            top: 44px;
            background: url(img/product/plus.png) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.13/components/fittings/i/plus.png*/
        }


        /*右边那一块 需要点击 变换的那块*/
        .fittings .suits {
            width: 840px;
            float: left;
            height: 187px;
            overflow: hidden;
            position: relative;
        }

        .fittings .suits .switchable-wrap {
            height: 161px;
            position: relative;
        }

        /*向前 按钮*/
        .fittings .suits .switchable-wrap .prev-btn {
            left: 22px;
        }
        .fittings .suits .switchable-wrap .prev-btn.disabled {
            background-position: -94px -94px !important;
            cursor: default;
        }
        .fittings .suits .switchable-wrap .next-btn, .fittings .suits .switchable-wrap .prev-btn {
            background: url(img/product/page-btn.png) 0 -94px no-repeat;
            /*//static.360buyimg.com/item/default/1.0.13/components/fittings/i/page-btn.png*/
            width: 23px;
            height: 73px;
            display: block;
            position: absolute;
            z-index: 2;
            top: 40px;
        }

        /*向后按钮*/
        .root61 .fittings .suits .switchable-wrap .next-btn {
            right: 2px;
        }
        .fittings .suits .switchable-wrap .next-btn {
            left: auto;
            right: 14px;
            background-position: 0 0;
        }


        .fittings .suits .switchable-wrap .lh-wrap {
            margin: 0 38px 0 68px;
        }

        .ETooltips .arrow, .detail, .lh, .p-name, .plist-2 li, .sp-search p {
            overflow: hidden;
        }


        .fittings .infos {
            position: relative;
            float: left;
            display: inline;
            width: 150px;
            padding-left: 50px;
            padding-top: 15px;
        }

        .fittings .infos .p-price, .fittings .infos .selected {
            margin-bottom: 10px;
        }

        .fittings .infos .p-price strong, .fittings .infos .selected strong {
            font-size: 18px;
        }
        /*3188.00*/
        .p-price strong {
            color: #e4393c;
            font-size: 14px;
            font-family: Verdana;
        }

        /*立即购买 按钮*/
        /*#fittings .infos .btn{
				width: 80px;

			}*/
        .fittings .btn {/*.btn-primary*/
            display: block;
            width: 80px;
            height: 28px;
            /*line-height: 28px;*/
            /*padding: 0 16px;*/
            background-image: url(img/product/buynow.png);

        }
        .btn-special1 {/*.btn-primary, */
            background-color: #df3033;
            color: #fff;
        }
        .btn-def, .btn-special1, .btn-special2, .btn-special3 {/*.btn-primary,*/
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
        }

        /*等号*/
        .fittings .infos .equal {
            width: 23px;
            height: 23px;
            overflow: hidden;
            line-height: 1000px;
            position: absolute;
            left: 0;top: 30px;
            background: url(img/product/equal.png) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.13/components/fittings/i/equal.png*/
        }





        /*详情展示 第二部分*/
        .w-second{
            width:1210px;
            position: relative;
            /*background-color: palegoldenrod;*/
            margin:0px auto;
            margin-top: 820px;

        }
        /*华为官方 旗舰店*/
        .aside {
            float: left;
            width: 210px;
            margin-bottom: 20px;
        }
        .aside, .detail {
            display: inline;
        }

        .m-aside, .m-content {
            margin-bottom: 15px;
        }

        /*华为官方旗舰店*/
        .m-aside .mt {
            padding: 10px;
        }
        .m-aside .mt, .m-content .mt {
            background-color: #f7f7f7;
            border: 1px solid #eee;
        }

        .popbox-inner{
            width: 210px;
            height: 99px;
        }
        .popbox h3 {
            float: left;
            max-width: 160px;
            height: 18px;
            overflow: hidden;
        }
        .m-aside h3, .m-content h3 {
            font: 700 14px "microsoft yahei";
        }

        .popbox .im-wrap {
            margin-left: 5px;
            float: left;
        }
        .popbox .im-wrap .im {
            float: left;
            cursor: pointer;
        }
        .popbox .im-wrap .im.gys-im .sprite-im {
            background: url(img/product/sprite-gys-im.gif) no-repeat;
        }
        .popbox .im-wrap .im .sprite-im {
            width: 16px;
            height: 20px;
            float: left;
            display: inline-block;
        }

        /*进店逛逛 关注店铺*/
        .popbox .mc {
            padding-top: 0;
            background-color: #FFF;
        }
        .m-aside .mc {
            padding: 10px 10px 0;
            border: 1px solid #eee;
            border-top: none;
        }
        .m-aside .mc, .m-content .mc {
            overflow: visible;
        }

        .pop-score-summary .btns {
            padding: 10px 0;
            font-size: 0;
            text-align: center;
        }

        .pop-score-summary .btns .btn-def {
            width: 88px;
            height: 34px;
            line-height: 34px;
            padding: 0;
            margin-right: 8px;
            font-size: 12px;
        }
        .btn-def {
            border: 1px solid #ddd;
            background-color: #f8f8f8;
            color: #666;
        }
        .btn-def, .btn-primary, .btn-special1, .btn-special2, .btn-special3 {
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
        }

        /*进店逛逛 前面的 小图标*/
        .pop-score-summary .btns .sprite-enter {
            width: 16px;
            height: 16px;
            background-image: url(img/product/4__sprite.png);
            background-position: -34px 0;
        }
        .pop-score-summary .btns i {
            display: inline-block;
            vertical-align: -2px;
        }

        /*关注店铺前面 的 小图标*/
        .pop-score-summary .btns .follow-shop {
            margin-right: 0;
        }
        .pop-score-summary .btns .sprite-follow {
            width: 16px;
            height: 16px;
            background-image: url(img/product/4__sprite.png);
            background-position: -34px -16px;
        }


        /*关于手机 你可能在找*/
        .pop-score-summary .btns .sprite-follow {
            width: 16px;
            height: 16px;
            background-image: url(img/product/4__sprite.png);
            background-position: -34px -16px;
        }
        .tag-list li {
            padding: 2px 4px;
            background-color: #eef1ff;
            margin: 0 10px 10px 0;
        }
        .sp-search p label, .sp-search p span, .tag-list li {
            display: inline-block;
        }



        /*第二部分 右半部分*/
        .detail {
            width: 990px;
            float: right;
            min-height: 220px;

        }
        .aside, .detail {
            display: inline;
        }
        .ETooltips .arrow, .detail, .lh, .p-name, .plist-2 li, .sp-search p {
            overflow: hidden;
        }


        /*商品介绍 等 导航条*/
        #detail .tab-main {
            position: relative;
            overflow: visible;
            z-index: 2;
        }

        .ETab .tab-main {
            background-color: #f7f7f7;
            border: 1px solid #eee;
            border-bottom: 1px solid #e4393c;
            display: block;
        }
        .ETab .tab-main ul {
            margin-top: -1px;
        }

        .ETab .tab-main li{
            cursor: pointer;
        }

        .ETab .tab-main li .current {
            background-color: #e4393c;
            color: white;

        }
        .add-detail-current{
            background-color: #e4393c;
            color: white;
        }
        /*.ETab .tab-main li.current a{

    			color: white;
			}*/


        .ETab div.large li {
            padding: 10px 25px;
            font-size: 14px;
        }
        .ETab .tab-main li {
            position: relative;
            display: inline-block;
            font-family: "microsoft yahei";

        }

        /*手机社区 右上角那个红色块*/
        .ETab .tab-main li sup {
            background-color: #c81623;
            color: #fff;
            padding: 0 4px;
            position: absolute;
            right: -5px;
            top: -1px;
            font: 12px/16px arial;
        }
        .ETab .tab-main li sup b {
            position: absolute;
            left: 0;
            top: 13px;
            color: #c81623;
            font: 12px simsun;
        }

        /*扫一扫下单这一块*/
        .ETab .tab-main .extra {
            position: absolute;
            top: 0;
            right: 0;
        }

        .ETab .tab-main .extra .addcart-mini {
            width: 94px;
            height: 32px;
            background: url(img/product/joincart.png) no-repeat;
            margin-top: 5px;
            float: right;
            margin-right: 10px;

        }
        .detail-content-tab .current i, .root61 .addcart-mini, .root61 .z-have-detail-nav .detail-content-nav {
            display: block;
        }
        .EDropdown, .EDropdown .head {
            position: relative;
        }

        /*扫一扫下单*/
        .nav-qrcode .EDropdown .head {
            height: 30px;
        }
        .EDropdown .head {
            line-height: 23px;
            float: left;
            z-index: 1;
            padding: 1px 1px 0;
            cursor: pointer;
        }
        .EDropdown, .EDropdown .head {
            position: relative;
        }


        /*导航条下面 需要切换的部分*/
        #detail .tab-con {
            overflow: hidden;
        }
        .ETab .tab-con {
            padding: 10px 0;
        }

        .p-parameter {
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .detail .p-parameter-list {
            padding: 20px 0 15px;
        }
        .p-parameter ul {
            overflow: hidden;
        }

        .detail .p-parameter-list li {
            width: 200px;
        }
        .p-parameter ul li {
            padding-left: 42px;
            float: left;
            margin-bottom: 5px;
        }
        .p-parameter ul li, .p-parameter ul li .detail p {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        /*商品介绍 第一个小图*/
        .p-parameter ul li .i-phone {
            height: 31px;
            background-image: url(img/product/param1.png);
            /*//static.360buyimg.com/item/default/1.0.13/components/detail/i/param1.png*/
        }
        .p-parameter ul li i {
            float: left;
            width: 33px;
            overflow: hidden;
            line-height: 1000px;
            margin-top: 2px;
            margin-left: -37px;
            background-repeat: no-repeat;
            background-position: 0 0;
        }

        .detail .p-parameter-list li .detail {
            width: 197px;
        }
        .p-parameter ul li .detail {
            min-height: 0px;
        }
        .p-parameter ul li .detail p {
            width: 100%;
            line-height: 18px;
            margin-bottom: 4px;
        }
        .p-parameter ul li, .p-parameter ul li .detail p {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        /*商品介绍 第二个小图*/
        .p-parameter ul li .i-camera {
            background-image: url(img/product/param2.png);
            /*//static.360buyimg.com/item/default/1.0.13/components/detail/i/param2.png*/
            display: block;
            width: 33px;
            height: 33px;
        }
        /*商品介绍 第三个小图*/
        .p-parameter ul li .i-cpu {
            background-image: url(img/product/param3.png);
            display: block;
            width: 33px;
            height: 33px;
        }
        /*商品介绍 第四个小图*/
        .p-parameter ul li .i-network {
            background-image: url(img/product/param4.png);
            display: block;
            width: 33px;
            height: 33px;
        }


        /*隐藏起来的块*/
        /*规格与包装*/
        .detail-correction {
            padding: 8px 0 8px 10px;
            zoom: 1;
            background-color: #fff;
        }
        .detail-correction a {
            color: #005ea7;
        }
        .Ptable {
            margin: 10px 0;
            overflow: hidden;
        }
        .Ptable-item, .package-list {
            border-top: 1px solid #eee;
            padding: 12px 0;
            line-height: 220%;
            color: #999;
            margin-top: -1px;
            font-size: 12px;
        }
        .Ptable-item h3 {
            font-weight: 400;
            width: 110px;
            text-align: right;
            float: left;
            font-size: 12px;
        }
        .Ptable-item dl {
            margin-left: 110px;
        }
        .Ptable-item dt, .package-list h3 {
            width: 130px;
            text-align: right;
            float: left;
        }
        .Ptable-item dd {
            margin-left: 190px;
        }

        .Ptable-item, .package-list {
            border-top: 1px solid #eee;
            padding: 12px 0;
            line-height: 220%;
            color: #999;
            margin-top: -1px;
            font-size: 12px;
        }
        .package-list h3 {
            font-weight: 400;
            font-size: 12px;
        }
        .package-list p {
            margin-left: 155px;
            padding-right: 50px;
        }


        /*售后保障*/
        .m-aside, .m-content {
            margin-bottom: 15px;
        }
        .m-content .mt {
            position: relative;
            padding: 10px;
        }
        .m-aside .mt, .m-content .mt {
            background-color: #f7f7f7;
            border: 1px solid #eee;
        }
        .item-detail-copyright {
            padding: 0 10px;
            line-height: 180%;
        }

        .serve-agree-bd {
            padding: 20px 20px 20px 62px;
        }

        .serve-agree-bd dt .goods {
            background: url(img/product/iconZP.png) no-repeat;
            /*//static.360buyimg.com/item/default/1.0.13/components/detail/i/iconZP.png*/
        }

        .serve-agree-bd dt .unprofor {
            background: url(img/product/iconLB.png) no-repeat;
        }

        .serve-agree-bd dt .no-worries {
            background: url(img/product/iconWY.png) no-repeat;
        }
        .serve-agree-bd dt i {
            display: inline-block;
            width: 32px;
            height: 32px;
            line-height: 32px;
            padding-right: 10px;
            vertical-align: bottom;
        }
        .item-detail-copyright strong {
            display: inline-block;
            padding: 8px 0 3px;
        }
        .serve-agree-bd dd {
            display: block;
            padding: 10px 0 30px;
            line-height: 18px;
        }





        /*尾部*/
        .foot{
            width: 1350px;
            height: 500px;
            /*background-color: cornflowerblue;*/
            position: absolute;
            margin-top: 3850px;
            margin-left:-70px;

        }
        .foot .foot-first{
            width: 100%;
            height: 86px;
            background-image: url(img/product/bottom_picture1.png);
            background-color: #F5F5F5;

        }
        .foot .foot-second{
            width: 100%;
            height: 410px;
            background-image: url(img/product/bottom_picture2.png);
        }




    </style>

</head>

<body>
<!--最顶上的一条开始-->
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
                                    <a href="" class="selected">北京</a>
                                </div>
                                <div class="item">
                                    <a href="">上海</a>
                                </div>
                                <div class="item">
                                    <a href="">天津</a>
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
            <li class="fore1" id="ttbar-login">
                <a href="" class="link-login">你好，请登录</a>&nbsp;&nbsp;
                <a href="../JD/JD_register.html" class="link-regist style-red">免费注册</a>
            </li>
            <li class="spacer"></li>
            <li class="fore2">
                <div class="dt">
                    <a target="_blank" href="">我的订单</a>
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
                            <a href=""><img src="img/top/no-img_mid_.jpg" width="60" height="60"></a>
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
<!--最顶上的一条结束-->

<!--搜索框部分 开始-->
<div class="w">
    <div id="logo">
        <a href="" class="logo">京东</a>
    </div>
    <div id="search">
        <ul id="shelper" class="hide" style="display: none;"></ul>
        <div class="form">
            <input type="text" autocomplete="off" id="key" class="text">
            <button onclick="" class="button cw-icon"><i></i>搜索</button>
        </div>
    </div>
    <div id="settleup" class="dorpdown">
        <div class="cw-icon">
            <i class="ci-left"></i>
            <i class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i>
            <a target="_blank" href="ShoppingCartServlet?action=queryShoppingCart">我的购物车</a>
        </div>
        <div class="dorpdown-layer">
            <div class="spacer"></div>
            <div id="settleup-content"><span class="loading"></span></div>
            <div class="prompt">
                <div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>
            </div>
        </div>
    </div>
    <div id="hotwords">
        <a href="" target="_blank" class="style-red">9.9团购</a>
        <a href="" target="_blank">领免息券</a>
        <a href="" target="_blank">3件7折</a>
        <a href="" target="_blank">手机暑促</a>
        <a href="" target="_blank">100元红包</a>
        <a href="" target="_blank">运动裤</a>
        <a href="" target="_blank">七夕礼物</a>
        <a href="" target="_blank">0元试用</a>
        <a href="" target="_blank">卫裤男</a>
    </div>
    <span class="clr"></span>
</div>
<!--搜索框部分 结束-->

<!--导航栏 所有商品分类 开始-->
<div id="nav">
    <div class="w">
        <div class="w-spacer"></div>

        <div id="categorys" class="dorpdown">
            <div class="dt" id="category-dt">
                <a target="_blank" href="">全部商品分类</a>
            </div>
            <div class="dd">
                <div class="dd-inner" id="categorys-dd-inner">

                    <div class="item fore1" data-index="1">
                        <h3><a target="_blank" href="">家用电器</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore2" data-index="2">
                        <h3><a target="_blank" href="list.html">手机</a>
                            <a target="_blank" href="">数码</a>、
                            <a target="_blank" href="">京东通信</a>
                        </h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore3" data-index="3">
                        <h3><a target="_blank" href="">电脑、办公</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore4" data-index="4">
                        <h3><a target="_blank" href="">家居</a>、
                            <a target="_blank" href="">家具</a>、
                            <a target="_blank" href="">家装</a>、
                            <a target="_blank" href="">厨具</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore5" data-index="5">
                        <h3><a target="_blank" href="">男装</a>、
                            <a target="_blank" href="">女装</a>、
                            <a target="_blank" href="">童装</a>、
                            <a target="_blank" href="">内衣</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore6" data-index="6">
                        <h3><a target="_blank" href="">个护化妆</a>、
                            <a target="_blank" href="">清洁用品</a>、
                            <a target="_blank" href="">宠物</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore7" data-index="7">
                        <h3><a target="_blank" href="">鞋靴</a>、
                            <a target="_blank" href="">箱包</a>、
                            <a target="_blank" href="">珠宝</a>、
                            <a target="_blank" href="">奢侈品</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore8" data-index="8">
                        <h3><a target="_blank" href="">运动户外</a>、
                            <a target="_blank" href="">钟表</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore9" data-index="9">
                        <h3><a target="_blank" href="">汽车</a>、
                            <a target="_blank" href="">汽车用品</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore10" data-index="10">
                        <h3><a target="_blank" href="">母婴</a>、
                            <a target="_blank" href="">玩具乐器</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore11" data-index="11">
                        <h3><a target="_blank" href="">食品</a>、
                            <a target="_blank" href="">酒类</a>、
                            <a target="_blank" href="//fresh.jd.com">生鲜</a>、
                            <a target="_blank" href="//china.jd.com">特产</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore12" data-index="12">
                        <h3><a target="_blank" href="//health.jd.com">医药保健</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore13" data-index="13">
                        <h3><a target="_blank" href="">图书</a>、<a target="_blank" href="//mvd.jd.com/">音像</a>、<a target="_blank" href="//e.jd.com/ebook.html">电子书</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore14" data-index="14">
                        <h3><a target="_blank" href="//caipiao.jd.com/">彩票</a>、<a target="_blank" href="//trip.jd.com/">旅行</a>、<a target="_blank" href="//chongzhi.jd.com/">充值</a>、<a target="_blank" href="//piao.jd.com/">票务</a></h3>
                        <i>&gt;</i>
                    </div>
                    <div class="item fore15" data-index="15">
                        <h3><a target="_blank" href="//licai.jd.com/">理财</a>、<a target="_blank" href="//z.jd.com/">众筹</a>、<a target="_blank" href="//baitiao.jd.com">白条</a>、<a target="_blank" href="//bao.jd.com/">保险</a></h3>
                        <i>&gt;</i>
                    </div>
                </div>
                <div class="dorpdown-layer" id="category-dorpdown-layer">
                    <div class="item-sub" id="category-item-1" data-id="1">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">品牌日<i>&gt;</i></a>
                                <a href="" target="_blank">家电城<i>&gt;</i></a>
                                <a href="" target="_blank">智能生活馆<i>&gt;</i></a>
                                <a href="" target="_blank">京东净化馆<i>&gt;</i></a>
                                <a href="" target="_blank">京东帮服务店<i>&gt;</i></a>
                                <a href="" target="_blank">家电众筹馆<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">大家电<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">平板电视</a>
                                    <a href="" target="_blank">空调</a>
                                    <a href="" target="_blank">冰箱</a>
                                    <a href="" target="_blank">洗衣机</a>
                                    <a href="" target="_blank">家庭影院</a>
                                    <a href="" target="_blank">DVD</a>
                                    <a href="" target="_blank">迷你音响</a>
                                    <a href="" target="_blank">冷柜/冰吧</a>
                                    <a href="" target="_blank">酒柜</a>
                                    <a href="" target="_blank">家电配件</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">厨卫大电<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">油烟机</a>
                                    <a href="" target="_blank">燃气灶</a>
                                    <a href="" target="_blank">烟灶套装</a>
                                    <a href="" target="_blank">消毒柜</a>
                                    <a href="" target="_blank">洗碗机</a>
                                    <a href="" target="_blank">电热水器</a>
                                    <a href="" target="_blank">燃气热水器</a>
                                    <a href="" target="_blank">嵌入式厨电</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">厨房小电<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">电饭煲</a>
                                    <a href="" target="_blank">微波炉</a>
                                    <a href="" target="_blank">电烤箱</a>
                                    <a href="" target="_blank">电磁炉</a>
                                    <a href="" target="_blank">电压力锅</a>
                                    <a href="" target="_blank">豆浆机</a>
                                    <a href="" target="_blank">咖啡机</a>
                                    <a href="" target="_blank">面包机</a>
                                    <a href="" target="_blank">榨汁机</a>
                                    <a href="" target="_blank">料理机</a>
                                    <a href="" target="_blank">电饼铛</a>
                                    <a href="" target="_blank">养生壶/煎药壶</a>
                                    <a href="" target="_blank">酸奶机</a>
                                    <a href="" target="_blank">煮蛋器</a>
                                    <a href="" target="_blank">电水壶/热水瓶</a>
                                    <a href="" target="_blank">电炖锅</a>
                                    <a href="" target="_blank">多用途锅</a>
                                    <a href="" target="_blank">电烧烤炉</a>
                                    <a href="" target="_blank">电热饭盒</a>
                                    <a href="" target="_blank">其它厨房电器</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">生活电器<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">电风扇</a>
                                    <a href="" target="_blank">冷风扇</a>
                                    <a href="" target="_blank">吸尘器</a>
                                    <a href="" target="_blank">净化器</a>
                                    <a href="" target="_blank">扫地机器人</a>
                                    <a href="" target="_blank">加湿器</a>
                                    <a href="" target="_blank">挂烫机/熨斗</a>
                                    <a href="" target="_blank">取暖电器</a>
                                    <a href="" target="_blank">插座</a>
                                    <a href="" target="_blank">电话机</a>
                                    <a href="" target="_blank">净水器</a>
                                    <a href="" target="_blank">饮水机</a>
                                    <a href="" target="_blank">除湿机</a>
                                    <a href="" target="_blank">干衣机</a>
                                    <a href="" target="_blank">清洁机</a>
                                    <a href="" target="_blank">收录/音机</a>
                                    <a href="" target="_blank">其它生活电器</a>
                                    <a href="" target="_blank">生活电器配件</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">个护健康<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">剃须刀</a>
                                    <a href="" target="_blank">口腔护理</a>
                                    <a href="" target="_blank">电吹风</a>
                                    <a href="" target="_blank">美容器</a>
                                    <a href="" target="_blank">卷/直发器</a>
                                    <a href="" target="_blank">理发器</a>
                                    <a href="" target="_blank">剃/脱毛器</a>
                                    <a href="" target="_blank">足浴盆</a>
                                    <a href="" target="_blank">健康秤/厨房秤</a>
                                    <a href="" target="_blank">按摩器</a>
                                    <a href="" target="_blank">按摩椅</a>
                                    <a href="" target="_blank">血压计</a>
                                    <a href="" target="_blank">血糖仪</a>
                                    <a href="" target="_blank">体温计</a>
                                    <a href="" target="_blank">计步器/脂肪检测仪</a>
                                    <a href="" target="_blank">其它健康电器</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">五金家装<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">电动工具</a>
                                    <a href="" target="_blank">手动工具</a>
                                    <a href="" target="_blank">仪器仪表</a>
                                    <a href="" target="_blank">浴霸/排气扇</a>
                                    <a href="" target="_blank">灯具</a>
                                    <a href="" target="_blank">LED灯</a>
                                    <a href="" target="_blank">洁身器</a>
                                    <a href="" target="_blank">水槽</a>
                                    <a href="" target="_blank">龙头</a>
                                    <a href="" target="_blank">淋浴花洒</a>
                                    <a href="" target="_blank">厨卫五金</a>
                                    <a href="" target="_blank">家具五金</a>
                                    <a href="" target="_blank">门铃</a>
                                    <a href="" target="_blank">电气开关</a>
                                    <a href="" target="_blank">插座</a>
                                    <a href="" target="_blank">电工电料</a>
                                    <a href="" target="_blank">监控安防</a>
                                    <a href="" target="_blank">电线/线缆</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-2" data-id="2">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">玩3C<i>&gt;</i></a>
                                <a href="" target="_blank">手机频道<i>&gt;</i></a>
                                <a href="" target="_blank">网上营业厅<i>&gt;</i></a>
                                <a href="" target="_blank">配件城<i>&gt;</i></a>
                                <a href="" target="_blank">影像Club<i>&gt;</i></a>
                                <a href="" target="_blank">以旧换新<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">手机通讯<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">手机</a>
                                    <a href="" target="_blank">对讲机</a>
                                    <a href="" target="_blank">以旧换新</a>
                                    <a href="" target="_blank">手机维修</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">京东通信<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">选号中心</a>
                                    <a href="" target="_blank">自助服务</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">运营商<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">合约机</a>
                                    <a href="" target="_blank">办套餐</a>
                                    <a href="" target="_blank">选号码</a>
                                    <a href="" target="_blank">装宽带</a>
                                    <a href="" target="_blank">中国移动</a>
                                    <a href="" target="_blank">中国联通</a>
                                    <a href="" target="_blank">中国电信</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">手机配件<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">手机电池</a>
                                    <a href="" target="_blank">移动电源</a>
                                    <a href="" target="_blank">蓝牙耳机</a>
                                    <a href="" target="_blank">充电器</a>
                                    <a href="" target="_blank">数据线</a>
                                    <a href="" target="_blank">手机耳机</a>
                                    <a href="" target="_blank">手机支架</a>
                                    <a href="" target="_blank">贴膜</a>
                                    <a href="" target="_blank">手机存储卡</a>
                                    <a href="" target="_blank">保护套</a>
                                    <a href="" target="_blank">车载配件</a>
                                    <a href="" target="_blank">苹果周边</a>
                                    <a href="" target="_blank">创意配件</a>
                                    <a href="" target="_blank">手机饰品</a>
                                    <a href="" target="_blank">拍照配件</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">摄影摄像<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">数码相机</a>
                                    <a href="" target="_blank">单电/微单相机</a>
                                    <a href="" target="_blank">单反相机</a>
                                    <a href="" target="_blank">拍立得</a>
                                    <a href="" target="_blank">运动相机</a>
                                    <a href="" target="_blank">摄像机</a>
                                    <a href="" target="_blank">镜头</a>
                                    <a href="" target="_blank">户外器材</a>
                                    <a href="" target="_blank">影棚器材</a>
                                    <a href="" target="_blank">冲印服务</a>
                                    <a href="" target="_blank">数码相框</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">数码配件<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">存储卡</a>
                                    <a href="" target="_blank">读卡器</a>
                                    <a href="" target="_blank">支架</a>
                                    <a href="" target="_blank">滤镜</a>
                                    <a href="" target="_blank">闪光灯/手柄</a>
                                    <a href="" target="_blank">相机包</a>
                                    <a href="" target="_blank">三脚架/云台</a>
                                    <a href="" target="_blank">相机清洁/贴膜</a>
                                    <a href="" target="_blank">机身附件</a>
                                    <a href="" target="_blank">镜头附件</a>
                                    <a href="" target="_blank">电池/充电器</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">影音娱乐<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">耳机/耳麦</a>
                                    <a href="" target="_blank">音箱/音响</a>
                                    <a href="" target="_blank">便携/无线音箱</a>
                                    <a href="" target="_blank">收音机</a>
                                    <a href="" target="_blank">麦克风</a>
                                    <a href="" target="_blank">MP3/MP4</a>
                                    <a href="" target="_blank">专业音频</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">智能设备<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">智能手环</a>
                                    <a href="" target="_blank">智能手表</a>
                                    <a href="" target="_blank">智能眼镜</a>
                                    <a href="" target="_blank">智能机器人</a>
                                    <a href="" target="_blank">运动跟踪器</a>
                                    <a href="" target="_blank">健康监测</a>
                                    <a href="" target="_blank">智能配饰</a>
                                    <a href="" target="_blank">智能家居</a>
                                    <a href="" target="_blank">体感车</a>
                                    <a href="" target="_blank">无人机</a>
                                    <a href="" target="_blank">其他配件</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">电子教育<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">学生平板</a>
                                    <a href="" target="_blank">点读机/笔</a>
                                    <a href="" target="_blank">早教益智</a>
                                    <a href="" target="_blank">录音笔</a>
                                    <a href="" target="_blank">电纸书</a>
                                    <a href="" target="_blank">电子词典</a>
                                    <a href="" target="_blank">复读机</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-3" data-id="3">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">玩3C<i>&gt;</i></a>
                                <a href="" target="_blank">本周热卖<i>&gt;</i></a>
                                <a href="" target="_blank">游戏部落<i>&gt;</i></a>
                                <a href="" target="_blank">GAME+<i>&gt;</i></a>
                                <a href="" target="_blank">装机大师<i>&gt;</i></a>
                                <a href="" target="_blank">办公生活馆<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">电脑整机<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">笔记本</a>
                                    <a href="" target="_blank">游戏本</a>
                                    <a href="" target="_blank">平板电脑</a>
                                    <a href="" target="_blank">平板电脑配件</a>
                                    <a href="" target="_blank">台式机</a>
                                    <a href="" target="_blank">一体机</a>
                                    <a href="" target="_blank">服务器/工作站</a>
                                    <a href="" target="_blank">笔记本配件</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">电脑配件<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">CPU</a>
                                    <a href="" target="_blank">主板</a>
                                    <a href="" target="_blank">显卡</a>
                                    <a href="" target="_blank">硬盘</a>
                                    <a href="" target="_blank">SSD固态硬盘</a>
                                    <a href="" target="_blank">内存</a>
                                    <a href="" target="_blank">机箱</a>
                                    <a href="" target="_blank">电源</a>
                                    <a href="" target="_blank">显示器</a>
                                    <a href="" target="_blank">刻录机/光驱</a>
                                    <a href="" target="_blank">声卡/扩展卡</a>
                                    <a href="" target="_blank">散热器</a>
                                    <a href="" target="_blank">装机配件</a>
                                    <a href="" target="_blank">组装电脑</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">外设产品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">鼠标</a>
                                    <a href="" target="_blank">键盘</a>
                                    <a href="" target="_blank">键鼠套装</a>
                                    <a href="" target="_blank">网络仪表仪器</a>
                                    <a href="" target="_blank">U盘</a>
                                    <a href="" target="_blank">移动硬盘</a>
                                    <a href="" target="_blank">鼠标垫</a>
                                    <a href="" target="_blank">摄像头</a>
                                    <a href="" target="_blank">线缆</a>
                                    <a href="" target="_blank">手写板</a>
                                    <a href="" target="_blank">硬盘盒</a>
                                    <a href="" target="_blank">电脑工具</a>
                                    <a href="" target="_blank">电脑清洁</a>
                                    <a href="" target="_blank">UPS电源</a>
                                    <a href="" target="_blank">插座</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">游戏设备<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">游戏机</a>
                                    <a href="" target="_blank">游戏耳机</a>
                                    <a href="" target="_blank">手柄/方向盘</a>
                                    <a href="" target="_blank">游戏软件</a>
                                    <a href="" target="_blank">游戏周边</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">网络产品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">路由器</a>
                                    <a href="" target="_blank">网卡</a>
                                    <a href="" target="_blank">交换机</a>
                                    <a href="" target="_blank">网络存储</a>
                                    <a href="" target="_blank">4G/3G上网</a>
                                    <a href="" target="_blank">网络盒子</a>
                                    <a href="" target="_blank">网络配件</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">办公设备<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">投影机</a>
                                    <a href="" target="_blank">投影配件</a>
                                    <a href="" target="_blank">多功能一体机</a>
                                    <a href="" target="_blank">打印机</a>
                                    <a href="" target="_blank">传真设备</a>
                                    <a href="" target="_blank">验钞/点钞机</a>
                                    <a href="" target="_blank">扫描设备</a>
                                    <a href="" target="_blank">复合机</a>
                                    <a href="" target="_blank">碎纸机</a>
                                    <a href="" target="_blank">考勤机</a>
                                    <a href="" target="_blank">收款/POS机</a>
                                    <a href="" target="_blank">会议音频视频</a>
                                    <a href="" target="_blank">保险柜</a>
                                    <a href="" target="_blank">装订/封装机</a>
                                    <a href="" target="_blank">安防监控</a>
                                    <a href="" target="_blank">办公家具</a>
                                    <a href="" target="_blank">白板</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">文具耗材<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">硒鼓/墨粉</a>
                                    <a href="" target="_blank">墨盒</a>
                                    <a href="" target="_blank">色带</a>
                                    <a href="" target="_blank">纸类</a>
                                    <a href="" target="_blank">办公文具</a>
                                    <a href="" target="_blank">学生文具</a>
                                    <a href="" target="_blank">文件管理</a>
                                    <a href="" target="_blank">本册/便签</a>
                                    <a href="" target="_blank">计算器</a>
                                    <a href="" target="_blank">笔类</a>
                                    <a href="" target="_blank">画具画材</a>
                                    <a href="" target="_blank">财会用品</a>
                                    <a href="" target="_blank">刻录碟片/附件</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">服务产品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">延保服务</a>
                                    <a href="" target="_blank">上门安装</a>
                                    <a href="" target="_blank">维修保养</a>
                                    <a href="" target="_blank">电脑软件</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-4" data-id="4">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">家装城<i>&gt;</i></a>
                                <a href="" target="_blank">居家日用<i>&gt;</i></a>
                                <a href="" target="_blank">精品家具<i>&gt;</i></a>
                                <a href="" target="_blank">家装建材<i>&gt;</i></a>
                                <a href="" target="_blank">厨房达人<i>&gt;</i></a>
                                <a href="" target="_blank">装修服务<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">厨具<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">烹饪锅具</a>
                                    <a href="" target="_blank">刀剪菜板</a>
                                    <a href="" target="_blank">厨房配件</a>
                                    <a href="" target="_blank">水具酒具</a>
                                    <a href="" target="_blank">餐具</a>
                                    <a href="" target="_blank">茶具/咖啡具</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">家装建材<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">灯饰照明</a>
                                    <a href="" target="_blank">厨房卫浴</a>
                                    <a href="" target="_blank">五金工具</a>
                                    <a href="" target="_blank">电工电料</a>
                                    <a href="" target="_blank">墙地面材料</a>
                                    <a href="" target="_blank">装饰材料</a>
                                    <a href="" target="_blank">装修服务</a>
                                    <a href="" target="_blank">吸顶灯</a>
                                    <a href="" target="_blank">淋浴花洒</a>
                                    <a href="" target="_blank">开关插座</a>
                                    <a href="" target="_blank">油漆涂料</a>
                                    <a href="" target="_blank">龙头</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">家纺<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">床品套件</a>
                                    <a href="" target="_blank">被子</a>
                                    <a href="" target="_blank">枕芯</a>
                                    <a href="" target="_blank">蚊帐</a>
                                    <a href="" target="_blank">凉席</a>
                                    <a href="" target="_blank">毛巾浴巾</a>
                                    <a href="" target="_blank">床单被罩</a>
                                    <a href="" target="_blank">床垫/床褥</a>
                                    <a href="" target="_blank">毯子</a>
                                    <a href="" target="_blank">抱枕靠垫</a>
                                    <a href="" target="_blank">窗帘/窗纱</a>
                                    <a href="" target="_blank">电热毯</a>
                                    <a href="" target="_blank">布艺软饰</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">家具<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">卧室家具</a>
                                    <a href="" target="_blank">客厅家具</a>
                                    <a href="" target="_blank">餐厅家具</a>
                                    <a href="" target="_blank">书房家具</a>
                                    <a href="" target="_blank">儿童家具</a>
                                    <a href="" target="_blank">储物家具</a>
                                    <a href="" target="_blank">阳台/户外</a>
                                    <a href="" target="_blank">商业办公</a>
                                    <a href="" target="_blank">床</a>
                                    <a href="" target="_blank">床垫</a>
                                    <a href="" target="_blank">沙发</a>
                                    <a href="" target="_blank">电脑椅</a>
                                    <a href="" target="_blank">衣柜</a>
                                    <a href="" target="_blank">茶几</a>
                                    <a href="" target="_blank">电视柜</a>
                                    <a href="" target="_blank">餐桌</a>
                                    <a href="" target="_blank">电脑桌</a>
                                    <a href="" target="_blank">鞋架/衣帽架</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">灯具<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">台灯</a>
                                    <a href="" target="_blank">吸顶灯</a>
                                    <a href="" target="_blank">筒灯射灯</a>
                                    <a href="" target="_blank">LED灯</a>
                                    <a href="" target="_blank">节能灯</a>
                                    <a href="" target="_blank">落地灯</a>
                                    <a href="" target="_blank">五金电器</a>
                                    <a href="" target="_blank">应急灯/手电</a>
                                    <a href="" target="_blank">装饰灯</a>
                                    <a href="" target="_blank">吊灯</a>
                                    <a href="" target="_blank">氛围照明</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">生活日用<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">收纳用品</a>
                                    <a href="" target="_blank">雨伞雨具</a>
                                    <a href="" target="_blank">净化除味</a>
                                    <a href="" target="_blank">浴室用品</a>
                                    <a href="" target="_blank">洗晒/熨烫</a>
                                    <a href="" target="_blank">缝纫/针织用品</a>
                                    <a href="" target="_blank">清洁工具</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">家装软饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">桌布/罩件</a>
                                    <a href="" target="_blank">地毯地垫</a>
                                    <a href="" target="_blank">沙发垫套/椅垫</a>
                                    <a href="" target="_blank">装饰字画</a>
                                    <a href="" target="_blank">装饰摆件</a>
                                    <a href="" target="_blank">手工/十字绣</a>
                                    <a href="" target="_blank">相框/照片墙</a>
                                    <a href="" target="_blank">墙贴/装饰贴</a>
                                    <a href="" target="_blank">花瓶花艺</a>
                                    <a href="" target="_blank">香薰蜡烛</a>
                                    <a href="" target="_blank">节庆饰品</a>
                                    <a href="" target="_blank">钟饰</a>
                                    <a href="" target="_blank">帘艺隔断</a>
                                    <a href="" target="_blank">创意家居</a>
                                    <a href="" target="_blank">保暖防护</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-5" data-id="5">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">男装<i>&gt;</i></a>
                                <a href="" target="_blank">女装<i>&gt;</i></a>
                                <a href="" target="_blank">内衣<i>&gt;</i></a>
                                <a href="" target="_blank">童装童鞋<i>&gt;</i></a>
                                <a href="" target="_blank">国际品牌<i>&gt;</i></a>
                                <a href="" target="_blank">自营服装<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">女装<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">连衣裙</a>
                                    <a href="" target="_blank">T恤</a>
                                    <a href="" target="_blank">雪纺衫</a>
                                    <a href="" target="_blank">衬衫</a>
                                    <a href="" target="_blank">休闲裤</a>
                                    <a href="" target="_blank">牛仔裤</a>
                                    <a href="" target="_blank">针织衫</a>
                                    <a href="" target="_blank">短外套</a>
                                    <a href="" target="_blank">卫衣</a>
                                    <a href="" target="_blank">小西装</a>
                                    <a href="" target="_blank">风衣</a>
                                    <a href="" target="_blank">毛呢大衣</a>
                                    <a href="" target="_blank">半身裙</a>
                                    <a href="" target="_blank">短裤</a>
                                    <a href="" target="_blank">吊带/背心</a>
                                    <a href="" target="_blank">打底衫</a>
                                    <a href="" target="_blank">打底裤</a>
                                    <a href="" target="_blank">正装裤</a>
                                    <a href="" target="_blank">马甲</a>
                                    <a href="" target="_blank">大码女装</a>
                                    <a href="" target="_blank">中老年女装</a>
                                    <a href="" target="_blank">真皮皮衣</a>
                                    <a href="" target="_blank">皮草</a>
                                    <a href="" target="_blank">羊毛衫</a>
                                    <a href="" target="_blank">羊绒衫</a>
                                    <a href="" target="_blank">棉服</a>
                                    <a href="" target="_blank">羽绒服</a>
                                    <a href="" target="_blank">仿皮皮衣</a>
                                    <a href="" target="_blank">加绒裤</a>
                                    <a href="" target="_blank">婚纱</a>
                                    <a href="" target="_blank">旗袍/唐装</a>
                                    <a href="" target="_blank">礼服</a>
                                    <a href="" target="_blank">设计师/潮牌</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">男装<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">衬衫</a>
                                    <a href="" target="_blank">T恤</a>
                                    <a href="" target="_blank">牛仔裤</a>
                                    <a href="" target="_blank">休闲裤</a>
                                    <a href="" target="_blank">卫衣</a>
                                    <a href="" target="_blank">针织衫</a>
                                    <a href="" target="_blank">西服</a>
                                    <a href="" target="_blank">西裤</a>
                                    <a href="" target="_blank">POLO衫</a>
                                    <a href="" target="_blank">羽绒服</a>
                                    <a href="" target="_blank">西服套装</a>
                                    <a href="" target="_blank">真皮皮衣</a>
                                    <a href="" target="_blank">夹克</a>
                                    <a href="" target="_blank">风衣</a>
                                    <a href="" target="_blank">卫裤/运动裤</a>
                                    <a href="" target="_blank">短裤</a>
                                    <a href="" target="_blank">仿皮皮衣</a>
                                    <a href="" target="_blank">棉服</a>
                                    <a href="" target="_blank">马甲/背心</a>
                                    <a href="" target="_blank">毛呢大衣</a>
                                    <a href="" target="_blank">羊毛衫</a>
                                    <a href="" target="_blank">羊绒衫</a>
                                    <a href="" target="_blank">大码男装</a>
                                    <a href="" target="_blank">中老年男装</a>
                                    <a href="" target="_blank">工装</a>
                                    <a href="" target="_blank">设计师/潮牌</a>
                                    <a href="" target="_blank">唐装/中山装</a>
                                    <a href="" target="_blank">加绒裤</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">内衣<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">文胸</a>
                                    <a href="" target="_blank">睡衣/家居服</a>
                                    <a href="" target="_blank">男式内裤</a>
                                    <a href="" target="_blank">女式内裤</a>
                                    <a href="" target="_blank">塑身美体</a>
                                    <a href="" target="_blank">文胸套装</a>
                                    <a href="" target="_blank">情侣睡衣</a>
                                    <a href="" target="_blank">吊带/背心</a>
                                    <a href="" target="_blank">少女文胸</a>
                                    <a href="" target="_blank">休闲棉袜</a>
                                    <a href="" target="_blank">商务男袜</a>
                                    <a href="" target="_blank">连裤袜/丝袜</a>
                                    <a href="" target="_blank">美腿袜</a>
                                    <a href="" target="_blank">打底裤袜</a>
                                    <a href="" target="_blank">抹胸</a>
                                    <a href="" target="_blank">内衣配件</a>
                                    <a href="" target="_blank">大码内衣</a>
                                    <a href="" target="_blank">打底衫</a>
                                    <a href="" target="_blank">泳衣</a>
                                    <a href="" target="_blank">秋衣秋裤</a>
                                    <a href="" target="_blank">保暖内衣</a>
                                    <a href="" target="_blank">情趣内衣</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">配饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">太阳镜</a>
                                    <a href="" target="_blank">光学镜架/镜片</a>
                                    <a href="" target="_blank">男士腰带/礼盒</a>
                                    <a href="" target="_blank">防辐射眼镜</a>
                                    <a href="" target="_blank">老花镜</a>
                                    <a href="" target="_blank">女士丝巾/围巾/披肩</a>
                                    <a href="" target="_blank">男士丝巾/围巾</a>
                                    <a href="" target="_blank">棒球帽</a>
                                    <a href="" target="_blank">遮阳帽</a>
                                    <a href="" target="_blank">鸭舌帽</a>
                                    <a href="" target="_blank">贝雷帽</a>
                                    <a href="" target="_blank">礼帽</a>
                                    <a href="" target="_blank">毛线帽</a>
                                    <a href="" target="_blank">防晒手套</a>
                                    <a href="" target="_blank">真皮手套</a>
                                    <a href="" target="_blank">围巾/手套/帽子套装</a>
                                    <a href="" target="_blank">遮阳伞/雨伞</a>
                                    <a href="" target="_blank">女士腰带/礼盒</a>
                                    <a href="" target="_blank">口罩</a>
                                    <a href="" target="_blank">假领</a>
                                    <a href="" target="_blank">毛线/布面料</a>
                                    <a href="" target="_blank">领带/领结/领带夹</a>
                                    <a href="" target="_blank">耳罩/耳包</a>
                                    <a href="" target="_blank">袖扣</a>
                                    <a href="" target="_blank">钥匙扣</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">童装童鞋<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">套装</a>
                                    <a href="" target="_blank">上衣</a>
                                    <a href="" target="_blank">运动鞋</a>
                                    <a href="" target="_blank">裤子</a>
                                    <a href="" target="_blank">内衣</a>
                                    <a href="" target="_blank">皮鞋/帆布鞋</a>
                                    <a href="" target="_blank">亲子装</a>
                                    <a href="" target="_blank">羽绒服/棉服</a>
                                    <a href="" target="_blank">运动服</a>
                                    <a href="" target="_blank">靴子</a>
                                    <a href="" target="_blank">演出服</a>
                                    <a href="" target="_blank">裙子</a>
                                    <a href="" target="_blank">功能鞋</a>
                                    <a href="" target="_blank">凉鞋</a>
                                    <a href="" target="_blank">配饰</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-6" data-id="6">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">清洁用品<i>&gt;</i></a>
                                <a href="" target="_blank">美妆商城<i>&gt;</i></a>
                                <a href="" target="_blank">官方旗舰店<i>&gt;</i></a>
                                <a href="" target="_blank">美妆特卖<i>&gt;</i></a>
                                <a href="" target="_blank">妆比社<i>&gt;</i></a>
                                <a href="" target="_blank">全球购美妆<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">面部护肤<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">卸妆</a>
                                    <a href="" target="_blank">洁面</a>
                                    <a href="" target="_blank">爽肤水</a>
                                    <a href="" target="_blank">乳液面霜</a>
                                    <a href="" target="_blank">精华</a>
                                    <a href="" target="_blank">眼霜</a>
                                    <a href="" target="_blank">防晒</a>
                                    <a href="" target="_blank">面膜</a>
                                    <a href="" target="_blank">剃须</a>
                                    <a href="" target="_blank">套装</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">洗发护发<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">洗发</a>
                                    <a href="" target="_blank">护发</a>
                                    <a href="" target="_blank">染发</a>
                                    <a href="" target="_blank">造型</a>
                                    <a href="" target="_blank">假发</a>
                                    <a href="" target="_blank">套装</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">身体护肤<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">沐浴</a>
                                    <a href="" target="_blank">润肤</a>
                                    <a href="" target="_blank">精油</a>
                                    <a href="" target="_blank">颈部</a>
                                    <a href="" target="_blank">手足</a>
                                    <a href="" target="_blank">纤体塑形</a>
                                    <a href="" target="_blank">美胸</a>
                                    <a href="" target="_blank">套装</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">口腔护理<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">牙膏/牙粉</a>
                                    <a href="" target="_blank">牙刷/牙线</a>
                                    <a href="" target="_blank">漱口水</a>
                                    <a href="" target="_blank">套装</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">女性护理<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">卫生巾</a>
                                    <a href="" target="_blank">卫生护垫</a>
                                    <a href="" target="_blank">私密护理</a>
                                    <a href="" target="_blank">脱毛膏</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">香水彩妆<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">女士香水</a>
                                    <a href="" target="_blank">男士香水</a>
                                    <a href="" target="_blank">底妆</a>
                                    <a href="" target="_blank">眉笔</a>
                                    <a href="" target="_blank">睫毛膏</a>
                                    <a href="" target="_blank">眼线</a>
                                    <a href="" target="_blank">眼影</a>
                                    <a href="" target="_blank">唇膏/彩</a>
                                    <a href="" target="_blank">腮红</a>
                                    <a href="" target="_blank">美甲</a>
                                    <a href="" target="_blank">美妆工具</a>
                                    <a href="" target="_blank">套装</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">清洁用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">纸品湿巾</a>
                                    <a href="" target="_blank">衣物清洁</a>
                                    <a href="" target="_blank">清洁工具</a>
                                    <a href="" target="_blank">家庭清洁</a>
                                    <a href="" target="_blank">一次性用品</a>
                                    <a href="" target="_blank">驱虫用品</a>
                                    <a href="" target="_blank">皮具护理</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">宠物生活<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">水族用品</a>
                                    <a href="" target="_blank">宠物主粮</a>
                                    <a href="" target="_blank">宠物零食</a>
                                    <a href="" target="_blank">猫砂/尿布</a>
                                    <a href="" target="_blank">洗护美容</a>
                                    <a href="" target="_blank">家居日用</a>
                                    <a href="" target="_blank">医疗保健</a>
                                    <a href="" target="_blank">出行装备</a>
                                    <a href="" target="_blank">宠物玩具</a>
                                    <a href="" target="_blank">宠物牵引</a>
                                    <a href="" target="_blank">宠物驱虫</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-7" data-id="7">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">当季热卖<i>&gt;</i></a>
                                <a href="" target="_blank">国际品牌<i>&gt;</i></a>
                                <a href="" target="_blank">时尚期刊<i>&gt;</i></a>
                                <a href="" target="_blank">珠宝首饰<i>&gt;</i></a>
                                <a href="" target="_blank">奢侈品<i>&gt;</i></a>
                                <a href="" target="_blank">收藏投资<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">时尚女鞋<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">单鞋</a>
                                    <a href="" target="_blank">休闲鞋</a>
                                    <a href="" target="_blank">帆布鞋</a>
                                    <a href="" target="_blank">鱼嘴鞋</a>
                                    <a href="" target="_blank">妈妈鞋</a>
                                    <a href="" target="_blank">凉鞋</a>
                                    <a href="" target="_blank">拖鞋/人字拖</a>
                                    <a href="" target="_blank">布鞋/绣花鞋</a>
                                    <a href="" target="_blank">坡跟鞋</a>
                                    <a href="" target="_blank">松糕鞋</a>
                                    <a href="" target="_blank">防水台</a>
                                    <a href="" target="_blank">高跟鞋</a>
                                    <a href="" target="_blank">踝靴</a>
                                    <a href="" target="_blank">内增高</a>
                                    <a href="" target="_blank">女靴</a>
                                    <a href="" target="_blank">马丁靴</a>
                                    <a href="" target="_blank">雪地靴</a>
                                    <a href="" target="_blank">雨鞋/雨靴</a>
                                    <a href="" target="_blank">鞋配件</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">流行男鞋<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">休闲鞋</a>
                                    <a href="" target="_blank">商务休闲鞋</a>
                                    <a href="" target="_blank">正装鞋</a>
                                    <a href="" target="_blank">帆布鞋</a>
                                    <a href="" target="_blank">工装鞋</a>
                                    <a href="" target="_blank">增高鞋</a>
                                    <a href="" target="_blank">拖鞋/人字拖</a>
                                    <a href="" target="_blank">凉鞋/沙滩鞋</a>
                                    <a href="" target="_blank">雨鞋/雨靴</a>
                                    <a href="" target="_blank">定制鞋</a>
                                    <a href="" target="_blank">男靴</a>
                                    <a href="" target="_blank">传统布鞋</a>
                                    <a href="" target="_blank">功能鞋</a>
                                    <a href="" target="_blank">鞋配件</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">潮流女包<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">单肩包</a>
                                    <a href="" target="_blank">手提包</a>
                                    <a href="" target="_blank">斜挎包</a>
                                    <a href="" target="_blank">双肩包</a>
                                    <a href="" target="_blank">钱包</a>
                                    <a href="" target="_blank">手拿包</a>
                                    <a href="" target="_blank">卡包/零钱包</a>
                                    <a href="" target="_blank">钥匙包</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">精品男包<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">商务公文包</a>
                                    <a href="" target="_blank">单肩/斜挎包</a>
                                    <a href="" target="_blank">男士手包</a>
                                    <a href="" target="_blank">双肩包</a>
                                    <a href="" target="_blank">男士钱包</a>
                                    <a href="" target="_blank">卡包名片夹</a>
                                    <a href="" target="_blank">钥匙包</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">功能箱包<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">拉杆箱</a>
                                    <a href="" target="_blank">拉杆包</a>
                                    <a href="" target="_blank">旅行包</a>
                                    <a href="" target="_blank">电脑包</a>
                                    <a href="" target="_blank">休闲运动包</a>
                                    <a href="" target="_blank">相机包</a>
                                    <a href="" target="_blank">腰包/胸包</a>
                                    <a href="" target="_blank">登山包</a>
                                    <a href="" target="_blank">旅行配件</a>
                                    <a href="" target="_blank">书包</a>
                                    <a href="" target="_blank">妈咪包</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">奢侈品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">箱包</a>
                                    <a href="" target="_blank">钱包</a>
                                    <a href="" target="_blank">服饰</a>
                                    <a href="" target="_blank">腰带</a>
                                    <a href="" target="_blank">鞋靴</a>
                                    <a href="" target="_blank">太阳镜/眼镜框</a>
                                    <a href="" target="_blank">饰品</a>
                                    <a href="" target="_blank">配件</a>
                                    <a href="" target="_blank">GUCCI</a>
                                    <a href="" target="_blank">COACH</a>
                                    <a href="" target="_blank">雷朋</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">礼品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">火机烟具</a>
                                    <a href="" target="_blank">军刀军具</a>
                                    <a href="" target="_blank">美妆礼品</a>
                                    <a href="" target="_blank">工艺礼品</a>
                                    <a href="" target="_blank">礼盒礼券</a>
                                    <a href="" target="_blank">礼品文具</a>
                                    <a href="" target="_blank">收藏品</a>
                                    <a href="" target="_blank">古董把玩</a>
                                    <a href="" target="_blank">礼品定制</a>
                                    <a href="" target="_blank">创意礼品</a>
                                    <a href="" target="_blank">婚庆用品</a>
                                    <a href="" target="_blank">鲜花绿植</a>
                                    <a href="" target="_blank">京东卡</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">珠宝首饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">黄金</a>
                                    <a href="" target="_blank">K金</a>
                                    <a href="" target="_blank">时尚饰品</a>
                                    <a href="" target="_blank">钻石</a>
                                    <a href="" target="_blank">翡翠玉石</a>
                                    <a href="" target="_blank">银饰</a>
                                    <a href="" target="_blank">水晶玛瑙</a>
                                    <a href="" target="_blank">彩宝</a>
                                    <a href="" target="_blank">铂金</a>
                                    <a href="" target="_blank">木手串/把件</a>
                                    <a href="" target="_blank">珍珠</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">金银投资<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">投资金</a>
                                    <a href="" target="_blank">投资银</a>
                                    <a href="" target="_blank">投资收藏</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-8" data-id="8">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">赛事<i>&gt;</i></a>
                                <a href="" target="_blank">运动城<i>&gt;</i></a>
                                <a href="" target="_blank">户外馆<i>&gt;</i></a>
                                <a href="" target="_blank">健身房<i>&gt;</i></a>
                                <a href="" target="_blank">骑行馆<i>&gt;</i></a>
                                <a href="" target="_blank">钟表城<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">运动鞋包<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">跑步鞋</a>
                                    <a href="" target="_blank">休闲鞋</a>
                                    <a href="" target="_blank">篮球鞋</a>
                                    <a href="" target="_blank">帆布鞋</a>
                                    <a href="" target="_blank">板鞋</a>
                                    <a href="" target="_blank">拖鞋</a>
                                    <a href="" target="_blank">运动包</a>
                                    <a href="" target="_blank">足球鞋</a>
                                    <a href="" target="_blank">乒羽网鞋</a>
                                    <a href="" target="_blank">训练鞋</a>
                                    <a href="" target="_blank">专项运动鞋</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">运动服饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">T恤</a>
                                    <a href="" target="_blank">运动裤</a>
                                    <a href="" target="_blank">健身服</a>
                                    <a href="" target="_blank">运动套装</a>
                                    <a href="" target="_blank">运动背心</a>
                                    <a href="" target="_blank">羽绒服</a>
                                    <a href="" target="_blank">卫衣/套头衫</a>
                                    <a href="" target="_blank">棉服</a>
                                    <a href="" target="_blank">夹克/风衣</a>
                                    <a href="" target="_blank">运动配饰</a>
                                    <a href="" target="_blank">乒羽网服</a>
                                    <a href="" target="_blank">毛衫/线衫</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">健身训练<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">跑步机</a>
                                    <a href="" target="_blank">健身车/动感单车</a>
                                    <a href="" target="_blank">哑铃</a>
                                    <a href="" target="_blank">仰卧板/收腹机</a>
                                    <a href="" target="_blank">甩脂机</a>
                                    <a href="" target="_blank">踏步机</a>
                                    <a href="" target="_blank">运动护具</a>
                                    <a href="" target="_blank">瑜伽舞蹈</a>
                                    <a href="" target="_blank">武术搏击</a>
                                    <a href="" target="_blank">综合训练器</a>
                                    <a href="" target="_blank">其他大型器械</a>
                                    <a href="" target="_blank">其他中小型器材</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">骑行运动<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">山地车/公路车</a>
                                    <a href="" target="_blank">折叠车</a>
                                    <a href="" target="_blank">电动车</a>
                                    <a href="" target="_blank">平衡车</a>
                                    <a href="" target="_blank">其他整车</a>
                                    <a href="" target="_blank">骑行装备</a>
                                    <a href="" target="_blank">骑行服</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">体育用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">乒乓球</a>
                                    <a href="" target="_blank">羽毛球</a>
                                    <a href="" target="_blank">篮球</a>
                                    <a href="" target="_blank">足球</a>
                                    <a href="" target="_blank">轮滑滑板</a>
                                    <a href="" target="_blank">网球</a>
                                    <a href="" target="_blank">高尔夫</a>
                                    <a href="" target="_blank">台球</a>
                                    <a href="" target="_blank">排球</a>
                                    <a href="" target="_blank">棋牌麻将</a>
                                    <a href="" target="_blank">其它</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">户外鞋服<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">户外风衣</a>
                                    <a href="" target="_blank">徒步鞋</a>
                                    <a href="" target="_blank">T恤</a>
                                    <a href="" target="_blank">冲锋衣裤</a>
                                    <a href="" target="_blank">速干衣裤</a>
                                    <a href="" target="_blank">越野跑鞋</a>
                                    <a href="" target="_blank">滑雪服</a>
                                    <a href="" target="_blank">羽绒服/棉服</a>
                                    <a href="" target="_blank">休闲衣裤</a>
                                    <a href="" target="_blank">抓绒衣裤</a>
                                    <a href="" target="_blank">溯溪鞋</a>
                                    <a href="" target="_blank">沙滩/凉拖</a>
                                    <a href="" target="_blank">休闲鞋</a>
                                    <a href="" target="_blank">软壳衣裤</a>
                                    <a href="" target="_blank">功能内衣</a>
                                    <a href="" target="_blank">军迷服饰</a>
                                    <a href="" target="_blank">登山鞋</a>
                                    <a href="" target="_blank">工装鞋</a>
                                    <a href="" target="_blank">户外袜</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">户外装备<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">帐篷/垫子</a>
                                    <a href="" target="_blank">望远镜</a>
                                    <a href="" target="_blank">野餐烧烤</a>
                                    <a href="" target="_blank">便携桌椅床</a>
                                    <a href="" target="_blank">背包</a>
                                    <a href="" target="_blank">户外配饰</a>
                                    <a href="" target="_blank">军迷用品</a>
                                    <a href="" target="_blank">睡袋/吊床</a>
                                    <a href="" target="_blank">救援装备</a>
                                    <a href="" target="_blank">户外照明</a>
                                    <a href="" target="_blank">旅游用品</a>
                                    <a href="" target="_blank">户外工具</a>
                                    <a href="" target="_blank">户外仪表</a>
                                    <a href="" target="_blank">登山攀岩</a>
                                    <a href="" target="_blank">极限户外</a>
                                    <a href="" target="_blank">冲浪潜水</a>
                                    <a href="" target="_blank">滑雪装备</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">垂钓用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">鱼竿鱼线</a>
                                    <a href="" target="_blank">浮漂鱼饵</a>
                                    <a href="" target="_blank">钓鱼桌椅</a>
                                    <a href="" target="_blank">钓鱼配件</a>
                                    <a href="" target="_blank">钓箱鱼包</a>
                                    <a href="" target="_blank">其它</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">游泳用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">泳镜</a>
                                    <a href="" target="_blank">男士泳衣</a>
                                    <a href="" target="_blank">女士泳衣</a>
                                    <a href="" target="_blank">比基尼</a>
                                    <a href="" target="_blank">泳帽</a>
                                    <a href="" target="_blank">游泳包防水包</a>
                                    <a href="" target="_blank">其它</a>
                                </dd>
                            </dl>
                            <dl class="fore10"><dt><a href="" target="_blank">钟表<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">男表</a>
                                    <a href="" target="_blank">女表</a>
                                    <a href="" target="_blank">儿童表</a>
                                    <a href="" target="_blank">智能手表</a>
                                    <a href="" target="_blank">座钟挂钟</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-9" data-id="9">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">全新汽车<i>&gt;</i></a>
                                <a href="" target="_blank">汽车用品<i>&gt;</i></a>
                                <a href="" target="_blank">旗舰店<i>&gt;</i></a>
                                <a href="" target="_blank">二手车<i>&gt;</i></a>
                                <a href="" target="_blank">直营店<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">汽车车型<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">微型车</a>
                                    <a href="" target="_blank">小型车</a>
                                    <a href="" target="_blank">紧凑型车</a>
                                    <a href="" target="_blank">中型车</a>
                                    <a href="" target="_blank">中大型车</a>
                                    <a href="" target="_blank">豪华车</a>
                                    <a href="" target="_blank">MPV</a>
                                    <a href="" target="_blank">SUV</a>
                                    <a href="" target="_blank">跑车</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">汽车价格<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">5万以下</a>
                                    <a href="" target="_blank">5-8万</a>
                                    <a href="" target="_blank">8-10万</a>
                                    <a href="" target="_blank">10-15万</a>
                                    <a href="" target="_blank">15-25万</a>
                                    <a href="" target="_blank">25-40万</a>
                                    <a href="" target="_blank">40万以上</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">汽车品牌<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">宝马</a>
                                    <a href="" target="_blank">比亚迪</a>
                                    <a href="" target="_blank">上汽大众</a>
                                    <a href="" target="_blank">奔腾</a>
                                    <a href="" target="_blank">东风标致</a>
                                    <a href="" target="_blank">宝沃</a>
                                    <a href="" target="_blank">华晨</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">维修保养<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">机油</a>
                                    <a href="" target="_blank">添加剂</a>
                                    <a href="" target="_blank">防冻液</a>
                                    <a href="" target="_blank">滤清器</a>
                                    <a href="" target="_blank">火花塞</a>
                                    <a href="" target="_blank">雨刷</a>
                                    <a href="" target="_blank">车灯</a>
                                    <a href="" target="_blank">减震器</a>
                                    <a href="" target="_blank">轮胎</a>
                                    <a href="" target="_blank">轮毂</a>
                                    <a href="" target="_blank">刹车片/盘</a>
                                    <a href="" target="_blank">维修配件</a>
                                    <a href="" target="_blank">蓄电池</a>
                                    <a href="" target="_blank">底盘装甲/护板</a>
                                    <a href="" target="_blank">贴膜</a>
                                    <a href="" target="_blank">汽修工具</a>
                                    <a href="" target="_blank">改装配件</a>
                                    <a href="" target="_blank">正时皮带</a>
                                    <a href="" target="_blank">汽车喇叭</a>
                                    <a href="" target="_blank">汽车玻璃</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">车载电器<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">行车记录仪</a>
                                    <a href="" target="_blank">导航仪</a>
                                    <a href="" target="_blank">电源</a>
                                    <a href="" target="_blank">电器配件</a>
                                    <a href="" target="_blank">净化器</a>
                                    <a href="" target="_blank">车载影音</a>
                                    <a href="" target="_blank">冰箱</a>
                                    <a href="" target="_blank">安全预警仪</a>
                                    <a href="" target="_blank">倒车雷达</a>
                                    <a href="" target="_blank">蓝牙设备</a>
                                    <a href="" target="_blank">智能驾驶</a>
                                    <a href="" target="_blank">车载电台</a>
                                    <a href="" target="_blank">吸尘器</a>
                                    <a href="" target="_blank">智能车机</a>
                                    <a href="" target="_blank">汽车音响</a>
                                    <a href="" target="_blank">车载生活电器</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">美容清洗<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">车蜡</a>
                                    <a href="" target="_blank">镀晶镀膜</a>
                                    <a href="" target="_blank">补漆笔</a>
                                    <a href="" target="_blank">玻璃水</a>
                                    <a href="" target="_blank">清洁剂</a>
                                    <a href="" target="_blank">洗车机</a>
                                    <a href="" target="_blank">洗车水枪</a>
                                    <a href="" target="_blank">洗车配件</a>
                                    <a href="" target="_blank">毛巾掸子</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">汽车装饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">脚垫</a>
                                    <a href="" target="_blank">座垫</a>
                                    <a href="" target="_blank">座套</a>
                                    <a href="" target="_blank">后备箱垫</a>
                                    <a href="" target="_blank">方向盘套</a>
                                    <a href="" target="_blank">头枕腰靠</a>
                                    <a href="" target="_blank">香水</a>
                                    <a href="" target="_blank">空气净化</a>
                                    <a href="" target="_blank">功能小件</a>
                                    <a href="" target="_blank">车衣</a>
                                    <a href="" target="_blank">挂件摆件</a>
                                    <a href="" target="_blank">车身装饰件</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">安全自驾<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">安全座椅</a>
                                    <a href="" target="_blank">胎压监测</a>
                                    <a href="" target="_blank">充气泵</a>
                                    <a href="" target="_blank">防盗设备</a>
                                    <a href="" target="_blank">应急救援</a>
                                    <a href="" target="_blank">保温箱</a>
                                    <a href="" target="_blank">储物箱</a>
                                    <a href="" target="_blank">自驾野营</a>
                                    <a href="" target="_blank">摩托车装备</a>
                                    <a href="" target="_blank">摩托车</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">赛事改装<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">赛事服装</a>
                                    <a href="" target="_blank">赛事用品</a>
                                    <a href="" target="_blank">制动系统</a>
                                    <a href="" target="_blank">悬挂系统</a>
                                    <a href="" target="_blank">进气系统</a>
                                    <a href="" target="_blank">排气系统</a>
                                    <a href="" target="_blank">电子管理</a>
                                    <a href="" target="_blank">车身强化</a>
                                </dd>
                            </dl>
                            <dl class="fore10"><dt><a href="" target="_blank">汽车服务<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">清洗美容</a>
                                    <a href="" target="_blank">功能升级</a>
                                    <a href="" target="_blank">保养维修</a>
                                    <a href="" target="_blank">驾驶培训</a>
                                    <a href="" target="_blank">ETC</a>
                                    <a href="" target="_blank">加油卡</a>
                                    <a href="" target="_blank">油卡充值</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f5939N38f0a9dc.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-10" data-id="10">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/56f138bfN71952631.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">母婴<i>&gt;</i></a>
                                <a href="" target="_blank">玩具乐器<i>&gt;</i></a>
                                <a href="" target="_blank">品牌街<i>&gt;</i></a>
                                <a href="" target="_blank">亲子馆<i>&gt;</i></a>
                                <a href="" target="_blank">全球购母婴<i>&gt;</i></a>
                                <a href="" target="_blank">大牌特卖<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">奶粉<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">1段</a>
                                    <a href="" target="_blank">2段</a>
                                    <a href="" target="_blank">3段</a>
                                    <a href="" target="_blank">4段</a>
                                    <a href="" target="_blank">孕妈奶粉</a>
                                    <a href="" target="_blank">特殊配方奶粉</a>
                                    <a href="" target="_blank">有机奶粉</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">营养辅食<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">米粉/菜粉</a>
                                    <a href="" target="_blank">面条/粥</a>
                                    <a href="" target="_blank">果泥/果汁</a>
                                    <a href="" target="_blank">益生菌/初乳</a>
                                    <a href="" target="_blank">DHA</a>
                                    <a href="" target="_blank">钙铁锌/维生素</a>
                                    <a href="" target="_blank">清火/开胃</a>
                                    <a href="" target="_blank">宝宝零食</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">尿裤湿巾<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">NB</a>
                                    <a href="" target="_blank">S</a>
                                    <a href="" target="_blank">M</a>
                                    <a href="" target="_blank">L</a>
                                    <a href="" target="_blank">XL</a>
                                    <a href="" target="_blank">XXL</a>
                                    <a href="" target="_blank">拉拉裤</a>
                                    <a href="" target="_blank">成人尿裤</a>
                                    <a href="" target="_blank">婴儿湿巾</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">喂养用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">奶瓶奶嘴</a>
                                    <a href="" target="_blank">吸奶器</a>
                                    <a href="" target="_blank">暖奶消毒</a>
                                    <a href="" target="_blank">辅食料理机</a>
                                    <a href="" target="_blank">牙胶安抚</a>
                                    <a href="" target="_blank">食物存储</a>
                                    <a href="" target="_blank">儿童餐具</a>
                                    <a href="" target="_blank">水壶/水杯</a>
                                    <a href="" target="_blank">围兜/防溅衣</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">洗护用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">宝宝护肤</a>
                                    <a href="" target="_blank">日常护理</a>
                                    <a href="" target="_blank">洗发沐浴</a>
                                    <a href="" target="_blank">洗澡用具</a>
                                    <a href="" target="_blank">洗衣液/皂</a>
                                    <a href="" target="_blank">理发器</a>
                                    <a href="" target="_blank">婴儿口腔清洁</a>
                                    <a href="" target="_blank">座便器</a>
                                    <a href="" target="_blank">驱蚊防晒</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">寝居服饰<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">睡袋/抱被</a>
                                    <a href="" target="_blank">家居床品</a>
                                    <a href="" target="_blank">安全防护</a>
                                    <a href="" target="_blank">爬行垫</a>
                                    <a href="" target="_blank">婴儿内衣</a>
                                    <a href="" target="_blank">婴儿礼盒</a>
                                    <a href="" target="_blank">婴儿鞋帽袜</a>
                                    <a href="" target="_blank">婴儿外出服</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">妈妈专区<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">防辐射服</a>
                                    <a href="" target="_blank">孕妈装</a>
                                    <a href="" target="_blank">孕妇护肤</a>
                                    <a href="" target="_blank">妈咪包/背婴带</a>
                                    <a href="" target="_blank">待产护理</a>
                                    <a href="" target="_blank">产后塑身</a>
                                    <a href="" target="_blank">文胸/内裤</a>
                                    <a href="" target="_blank">防溢乳垫</a>
                                    <a href="" target="_blank">孕期营养</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">童车童床<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">安全座椅</a>
                                    <a href="" target="_blank">婴儿推车</a>
                                    <a href="" target="_blank">婴儿床</a>
                                    <a href="" target="_blank">婴儿床垫</a>
                                    <a href="" target="_blank">餐椅</a>
                                    <a href="" target="_blank">学步车</a>
                                    <a href="" target="_blank">三轮车</a>
                                    <a href="" target="_blank">自行车</a>
                                    <a href="" target="_blank">扭扭车</a>
                                    <a href="" target="_blank">滑板车</a>
                                    <a href="" target="_blank">电动车</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">玩具<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">适用年龄</a>
                                    <a href="" target="_blank">遥控/电动</a>
                                    <a href="" target="_blank">益智玩具</a>
                                    <a href="" target="_blank">积木拼插</a>
                                    <a href="" target="_blank">动漫玩具</a>
                                    <a href="" target="_blank">毛绒布艺</a>
                                    <a href="" target="_blank">模型玩具</a>
                                    <a href="" target="_blank">健身玩具</a>
                                    <a href="" target="_blank">娃娃玩具</a>
                                    <a href="" target="_blank">DIY玩具</a>
                                    <a href="" target="_blank">创意减压</a>
                                </dd>
                            </dl>
                            <dl class="fore10"><dt><a href="" target="_blank">乐器<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">钢琴</a>
                                    <a href="" target="_blank">电子琴/电钢琴</a>
                                    <a href="" target="_blank">吉他/尤克里里</a>
                                    <a href="" target="_blank">打击乐器</a>
                                    <a href="" target="_blank">西洋管弦</a>
                                    <a href="" target="_blank">民族乐器</a>
                                    <a href="" target="_blank">乐器配件</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/5785154eN49fbd276.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-11" data-id="11">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">生鲜<i>&gt;</i></a>
                                <a href="" target="_blank">食品饮料<i>&gt;</i></a>
                                <a href="" target="_blank">酒类<i>&gt;</i></a>
                                <a href="" target="_blank">地方特产<i>&gt;</i></a>
                                <a href="" target="_blank">全球购美食<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">水果蔬菜<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">苹果</a>
                                    <a href="" target="_blank">奇异果</a>
                                    <a href="" target="_blank">芒果</a>
                                    <a href="" target="_blank">大樱桃</a>
                                    <a href="" target="_blank">时令水果</a>
                                    <a href="" target="_blank">叶菜类</a>
                                    <a href="" target="_blank">茄果瓜类</a>
                                    <a href="" target="_blank">根茎类</a>
                                    <a href="" target="_blank">鲜菌菇</a>
                                    <a href="" target="_blank">葱姜蒜椒</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">海鲜水产<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">虾类</a>
                                    <a href="" target="_blank">鱼类</a>
                                    <a href="" target="_blank">蟹类</a>
                                    <a href="" target="_blank">贝类</a>
                                    <a href="" target="_blank">海参</a>
                                    <a href="" target="_blank">海产干货</a>
                                    <a href="" target="_blank">三文鱼</a>
                                    <a href="" target="_blank">北极甜虾</a>
                                    <a href="" target="_blank">鳕鱼</a>
                                    <a href="" target="_blank">扇贝</a>
                                    <a href="" target="_blank">红虾</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">猪牛羊肉<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">牛肉</a>
                                    <a href="" target="_blank">羊肉</a>
                                    <a href="" target="_blank">猪肉</a>
                                    <a href="" target="_blank">牛排</a>
                                    <a href="" target="_blank">牛腩</a>
                                    <a href="" target="_blank">牛腱</a>
                                    <a href="" target="_blank">牛肉卷</a>
                                    <a href="" target="_blank">羊肉卷</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">禽类蛋品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">鸡肉</a>
                                    <a href="" target="_blank">鸡翅</a>
                                    <a href="" target="_blank">鸡蛋</a>
                                    <a href="" target="_blank">咸鸭蛋</a>
                                    <a href="" target="_blank">松花蛋</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">冷冻食饮<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">水饺</a>
                                    <a href="" target="_blank">汤圆</a>
                                    <a href="" target="_blank">面点</a>
                                    <a href="" target="_blank">火锅丸串</a>
                                    <a href="" target="_blank">速冻半成品</a>
                                    <a href="" target="_blank">奶酪/黄油</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">中外名酒<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">白酒</a>
                                    <a href="" target="_blank">葡萄酒</a>
                                    <a href="" target="_blank">洋酒</a>
                                    <a href="" target="_blank">啤酒</a>
                                    <a href="" target="_blank">黄酒/养生酒</a>
                                    <a href="" target="_blank">收藏酒/陈年老酒</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">进口食品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">牛奶</a>
                                    <a href="" target="_blank">饼干蛋糕</a>
                                    <a href="" target="_blank">糖果/巧克力</a>
                                    <a href="" target="_blank">休闲零食</a>
                                    <a href="" target="_blank">冲调饮品</a>
                                    <a href="" target="_blank">粮油调味</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">休闲食品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">休闲零食</a>
                                    <a href="" target="_blank">坚果炒货</a>
                                    <a href="" target="_blank">肉干肉脯</a>
                                    <a href="" target="_blank">蜜饯果干</a>
                                    <a href="" target="_blank">糖果/巧克力</a>
                                    <a href="" target="_blank">饼干蛋糕</a>
                                    <a href="" target="_blank">无糖食品</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><a href="" target="_blank">地方特产<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">新疆</a>
                                    <a href="" target="_blank">四川</a>
                                    <a href="" target="_blank">云南</a>
                                    <a href="" target="_blank">湖南</a>
                                    <a href="" target="_blank">内蒙</a>
                                    <a href="" target="_blank">北京</a>
                                    <a href="" target="_blank">山西</a>
                                    <a href="" target="_blank">福建</a>
                                    <a href="" target="_blank">东北</a>
                                    <a href="" target="_blank">其他</a>
                                </dd>
                            </dl>
                            <dl class="fore10"><dt><a href="" target="_blank">茗茶<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">铁观音</a>
                                    <a href="" target="_blank">普洱</a>
                                    <a href="" target="_blank">龙井</a>
                                    <a href="" target="_blank">绿茶</a>
                                    <a href="" target="_blank">红茶</a>
                                    <a href="" target="_blank">乌龙茶</a>
                                    <a href="" target="_blank">花草茶</a>
                                    <a href="" target="_blank">花果茶</a>
                                    <a href="" target="_blank">黑茶</a>
                                    <a href="" target="_blank">白茶</a>
                                    <a href="" target="_blank">养生茶</a>
                                    <a href="" target="_blank">其他茶</a>
                                </dd>
                            </dl>
                            <dl class="fore11"><dt><a href="" target="_blank">饮料冲调<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">牛奶乳品</a>
                                    <a href="" target="_blank">饮料</a>
                                    <a href="" target="_blank">饮用水</a>
                                    <a href="" target="_blank">咖啡/奶茶</a>
                                    <a href="" target="_blank">蜂蜜/柚子茶</a>
                                    <a href="" target="_blank">冲饮谷物</a>
                                    <a href="" target="_blank">成人奶粉</a>
                                </dd>
                            </dl>
                            <dl class="fore12"><dt><a href="" target="_blank">粮油调味<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">米面杂粮</a>
                                    <a href="" target="_blank">食用油</a>
                                    <a href="" target="_blank">调味品</a>
                                    <a href="" target="_blank">南北干货</a>
                                    <a href="" target="_blank">方便食品</a>
                                    <a href="" target="_blank">有机食品</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f5939N38f0a9dc.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/5784c4c4Nb078a907.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-12" data-id="12">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">专科用药<i>&gt;</i></a>
                                <a href="" target="_blank">滋补养生<i>&gt;</i></a>
                                <a href="" target="_blank">膳食补充<i>&gt;</i></a>
                                <a href="" target="_blank">健康监测<i>&gt;</i></a>
                                <a href="" target="_blank">两性情话<i>&gt;</i></a>
                                <a href="" target="_blank">靓眼视界<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">中西药品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">感冒咳嗽</a>
                                    <a href="" target="_blank">补肾壮阳</a>
                                    <a href="" target="_blank">补气养血</a>
                                    <a href="" target="_blank">止痛镇痛</a>
                                    <a href="" target="_blank">耳鼻喉用药</a>
                                    <a href="" target="_blank">眼科用药</a>
                                    <a href="" target="_blank">口腔用药</a>
                                    <a href="" target="_blank">皮肤用药</a>
                                    <a href="" target="_blank">肠胃消化</a>
                                    <a href="" target="_blank">风湿骨外伤</a>
                                    <a href="" target="_blank">男科/泌尿</a>
                                    <a href="" target="_blank">妇科用药</a>
                                    <a href="" target="_blank">儿科用药</a>
                                    <a href="" target="_blank">心脑血管</a>
                                    <a href="" target="_blank">肝胆用药</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">营养健康<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">调节免疫</a>
                                    <a href="" target="_blank">调节三高</a>
                                    <a href="" target="_blank">缓解疲劳</a>
                                    <a href="" target="_blank">美体塑身</a>
                                    <a href="" target="_blank">美容养颜</a>
                                    <a href="" target="_blank">肝肾养护</a>
                                    <a href="" target="_blank">肠胃养护</a>
                                    <a href="" target="_blank">明目益智</a>
                                    <a href="" target="_blank">骨骼健康</a>
                                    <a href="" target="_blank">改善睡眠</a>
                                    <a href="" target="_blank">抗氧化</a>
                                    <a href="" target="_blank">耐缺氧</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">营养成分<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">维生素/矿物质</a>
                                    <a href="" target="_blank">蛋白质</a>
                                    <a href="" target="_blank">鱼油/磷脂</a>
                                    <a href="" target="_blank">螺旋藻</a>
                                    <a href="" target="_blank">番茄红素</a>
                                    <a href="" target="_blank">叶酸</a>
                                    <a href="" target="_blank">葡萄籽</a>
                                    <a href="" target="_blank">左旋肉碱</a>
                                    <a href="" target="_blank">辅酶Q10</a>
                                    <a href="" target="_blank">益生菌</a>
                                    <a href="" target="_blank">玛咖</a>
                                    <a href="" target="_blank">膳食纤维</a>
                                    <a href="" target="_blank">牛初乳</a>
                                    <a href="" target="_blank">胶原蛋白</a>
                                    <a href="" target="_blank">大豆异黄酮</a>
                                    <a href="" target="_blank">芦荟提取</a>
                                    <a href="" target="_blank">酵素</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">滋补养生<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">阿胶</a>
                                    <a href="" target="_blank">蜂蜜/蜂产品</a>
                                    <a href="" target="_blank">枸杞</a>
                                    <a href="" target="_blank">燕窝</a>
                                    <a href="" target="_blank">海参</a>
                                    <a href="" target="_blank">冬虫夏草</a>
                                    <a href="" target="_blank">人参/西洋参</a>
                                    <a href="" target="_blank">三七</a>
                                    <a href="" target="_blank">鹿茸</a>
                                    <a href="" target="_blank">雪蛤</a>
                                    <a href="" target="_blank">青钱柳</a>
                                    <a href="" target="_blank">石斛/枫斗</a>
                                    <a href="" target="_blank">灵芝/孢子粉</a>
                                    <a href="" target="_blank">当归</a>
                                    <a href="" target="_blank">养生茶饮</a>
                                    <a href="" target="_blank">药食同源</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">成人用品<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">安全避孕</a>
                                    <a href="" target="_blank">验孕测孕</a>
                                    <a href="" target="_blank">人体润滑</a>
                                    <a href="" target="_blank">男用延时</a>
                                    <a href="" target="_blank">男用器具</a>
                                    <a href="" target="_blank">女用器具</a>
                                    <a href="" target="_blank">情趣内衣</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">保健器械<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">血压计</a>
                                    <a href="" target="_blank">血糖仪</a>
                                    <a href="" target="_blank">血氧仪</a>
                                    <a href="" target="_blank">体温计</a>
                                    <a href="" target="_blank">体重秤</a>
                                    <a href="" target="_blank">胎心仪</a>
                                    <a href="" target="_blank">呼吸制氧</a>
                                    <a href="" target="_blank">雾化器</a>
                                    <a href="" target="_blank">助听器</a>
                                    <a href="" target="_blank">轮椅</a>
                                    <a href="" target="_blank">拐杖</a>
                                    <a href="" target="_blank">中医保健</a>
                                    <a href="" target="_blank">养生器械</a>
                                    <a href="" target="_blank">理疗仪</a>
                                    <a href="" target="_blank">家庭护理</a>
                                    <a href="" target="_blank">智能健康</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">护理护具<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">隐形眼镜</a>
                                    <a href="" target="_blank">护理液</a>
                                    <a href="" target="_blank">口罩</a>
                                    <a href="" target="_blank">眼罩/耳塞</a>
                                    <a href="" target="_blank">跌打损伤</a>
                                    <a href="" target="_blank">暖贴</a>
                                    <a href="" target="_blank">鼻喉护理</a>
                                    <a href="" target="_blank">眼部保健</a>
                                    <a href="" target="_blank">美体护理</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-13" data-id="13">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">图书频道<i>&gt;</i></a>
                                <a href="" target="_blank">音像<i>&gt;</i></a>
                                <a href="" target="_blank">电子书<i>&gt;</i></a>
                                <a href="" target="_blank">图书榜<i>&gt;</i></a>
                                <a href="" target="_blank">音乐榜<i>&gt;</i></a>
                                <a href="" target="_blank">文娱众筹馆<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">音像<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">音乐</a>
                                    <a href="" target="_blank">影视</a>
                                    <a href="" target="_blank">教育音像</a>
                                    <a href="" target="_blank">游戏</a>
                                    <a href="" target="_blank">影视/动漫周边</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">少儿<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">0-2岁</a>
                                    <a href="" target="_blank">3-6岁</a>
                                    <a href="" target="_blank">7-10岁</a>
                                    <a href="" target="_blank">11-14岁</a>
                                    <a href="" target="_blank">儿童文学</a>
                                    <a href="" target="_blank">绘本</a>
                                    <a href="" target="_blank">科普</a>
                                    <a href="" target="_blank">幼儿启蒙</a>
                                    <a href="" target="_blank">手工游戏</a>
                                    <a href="" target="_blank">智力开发</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">教育<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">教材</a>
                                    <a href="" target="_blank">中小学教辅</a>
                                    <a href="" target="_blank">考试</a>
                                    <a href="" target="_blank">外语学习</a>
                                    <a href="" target="_blank">字典词典</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">文艺<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">小说</a>
                                    <a href="" target="_blank">文学</a>
                                    <a href="" target="_blank">青春文学</a>
                                    <a href="" target="_blank">传记</a>
                                    <a href="" target="_blank">动漫</a>
                                    <a href="" target="_blank">艺术</a>
                                    <a href="" target="_blank">摄影</a>
                                    <a href="" target="_blank">书法</a>
                                    <a href="" target="_blank">音乐</a>
                                    <a href="" target="_blank">绘画</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">经管励志<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">管理</a>
                                    <a href="" target="_blank">金融与投资</a>
                                    <a href="" target="_blank">经济</a>
                                    <a href="" target="_blank">励志与成功</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">人文社科<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">历史</a>
                                    <a href="" target="_blank">心理学</a>
                                    <a href="" target="_blank">政治/军事</a>
                                    <a href="" target="_blank">国学/古籍</a>
                                    <a href="" target="_blank">哲学/宗教</a>
                                    <a href="" target="_blank">社会科学</a>
                                    <a href="" target="_blank">法律</a>
                                    <a href="" target="_blank">文化</a>
                                </dd>
                            </dl>
                            <dl class="fore7"><dt><a href="" target="_blank">生活<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">育儿/家教</a>
                                    <a href="" target="_blank">孕产/胎教</a>
                                    <a href="" target="_blank">健身保健</a>
                                    <a href="" target="_blank">旅游/地图</a>
                                    <a href="" target="_blank">美食</a>
                                    <a href="" target="_blank">时尚美妆</a>
                                    <a href="" target="_blank">家居</a>
                                    <a href="" target="_blank">手工DIY</a>
                                    <a href="" target="_blank">两性</a>
                                    <a href="" target="_blank">体育</a>
                                </dd>
                            </dl>
                            <dl class="fore8"><dt><a href="" target="_blank">科技<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">计算机与互联网</a>
                                    <a href="" target="_blank">科普</a>
                                    <a href="" target="_blank">建筑</a>
                                    <a href="" target="_blank">工业技术</a>
                                    <a href="" target="_blank">电子/通信</a>
                                    <a href="" target="_blank">医学</a>
                                    <a href="" target="_blank">科学与自然</a>
                                    <a href="" target="_blank">农林</a>
                                </dd>
                            </dl>
                            <dl class="fore9"><dt><span>刊/原版<i>&gt;</i></span></dt>
                                <dd>
                                    <a href="" target="_blank">杂志/期刊</a>
                                    <a href="" target="_blank">英文原版书</a>
                                    <a href="" target="_blank">港台图书</a>
                                </dd>
                            </dl>
                            <dl class="fore10"><dt><a href="" target="_blank">电子书<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">畅读VIP</a>
                                    <a href="" target="_blank">小说</a>
                                    <a href="" target="_blank">励志与成功</a>
                                    <a href="" target="_blank">经济金融</a>
                                    <a href="" target="_blank">文学</a>
                                    <a href="" target="_blank">社科</a>
                                    <a href="" target="_blank">婚恋两性</a>
                                    <a href="" target="_blank">外文原版</a>
                                    <a href="" target="_blank">免费</a>
                                </dd>
                            </dl>
                            <dl class="fore11"><dt><a href="" target="_blank">数字音乐<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">通俗流行</a>
                                    <a href="" target="_blank">古典音乐</a>
                                    <a href="" target="_blank">摇滚说唱</a>
                                    <a href="" target="_blank">爵士蓝调</a>
                                    <a href="" target="_blank">乡村民谣</a>
                                    <a href="" target="_blank">有声读物</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-14" data-id="14">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">充值缴费<i>&gt;</i></a>
                                <a href="" target="_blank">京东彩票<i>&gt;</i></a>
                                <a href="" target="_blank">培训教育<i>&gt;</i></a>
                                <a href="" target="_blank">优选机票<i>&gt;</i></a>
                                <a href="" target="_blank">火车票<i>&gt;</i></a>
                                <a href="" target="_blank">京东游戏<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <div class="subitems-main1">
                                <dl class="fore1"><dt><a href="" target="_blank">彩票<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">双色球</a>
                                        <a href="" target="_blank">福彩3D</a>
                                        <a href="" target="_blank">七乐彩</a>
                                        <a href="" target="_blank">新时时彩</a>
                                        <a href="" target="_blank">快3</a>
                                        <a href="" target="_blank">大乐透</a>
                                        <a href="" target="_blank">排列三</a>
                                        <a href="" target="_blank">七星彩</a>
                                        <a href="" target="_blank">新11选5</a>
                                        <a href="" target="_blank">11选5</a>
                                        <a href="" target="_blank">竞彩足球</a>
                                        <a href="" target="_blank">竞彩篮球</a>
                                        <a href="" target="_blank">北单</a>
                                        <a href="" target="_blank">足彩</a>
                                        <a href="" target="_blank">排列五</a>
                                    </dd>
                                </dl>
                                <dl class="fore2"><dt><a href="" target="_blank">通讯充值<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">手机话费充值</a>
                                        <a href="" target="_blank">手机流量充值</a>
                                    </dd>
                                </dl>
                                <dl class="fore3"><dt><a href="" target="_blank">游戏<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">QQ充值</a>
                                        <a href="" target="_blank">游戏点卡</a>
                                        <a href="" target="_blank">网页游戏</a>
                                        <a href="" target="_blank">游戏周边</a>
                                        <a href="" target="_blank">手机游戏</a>
                                        <a href="" target="_blank">单机游戏</a>
                                    </dd>
                                </dl>
                                <dl class="fore4"><dt><a href="" target="_blank">本地生活<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">外卖订座</a>
                                        <a href="" target="_blank">生活缴费</a>
                                        <a href="" target="_blank">健康丽人</a>
                                    </dd>
                                </dl>
                                <dl class="fore5"><dt><a href="" target="_blank">演出票务<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">电影选座</a>
                                        <a href="" target="_blank">演唱会</a>
                                        <a href="" target="_blank">音乐会</a>
                                        <a href="" target="_blank">话剧歌剧</a>
                                        <a href="" target="_blank">体育赛事</a>
                                        <a href="" target="_blank">舞蹈芭蕾</a>
                                        <a href="" target="_blank">戏曲综艺</a>
                                    </dd>
                                </dl>
                                <dl class="fore6"><dt><a href="" target="_blank">教育培训<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">早教幼教</a>
                                        <a href="" target="_blank">中小学教育</a>
                                        <a href="" target="_blank">语言/留学</a>
                                        <a href="" target="_blank">学历教育</a>
                                        <a href="" target="_blank">职业技能</a>
                                        <a href="" target="_blank">兴趣爱好</a>
                                    </dd>
                                </dl>
                                <dl class="fore7"><dt><a href="" target="_blank">商旅服务<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">企业差旅</a>
                                        <a href="" target="_blank">奖励旅游</a>
                                        <a href="" target="_blank">会议周边</a>
                                        <a href="" target="_blank">会议活动</a>
                                    </dd>
                                </dl>
                            </div>
                            <div class="subitems-main2">
                                <dl class="fore8"><dt><a href="" target="_blank">出行服务<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">国内机票</a>
                                        <a href="" target="_blank">国际机票</a>
                                        <a href="" target="_blank">火车票</a>
                                        <a href="" target="_blank">机场服务</a>
                                    </dd>
                                </dl>
                                <dl class="fore9"><dt><a href="" target="_blank">酒店预订<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">国内酒店</a>
                                        <a href="" target="_blank">特惠酒店</a>
                                    </dd>
                                </dl>
                                <dl class="fore10"><dt><a href="" target="_blank">旅游度假<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">度假首页</a>
                                        <a href="" target="_blank">旅行保险</a>
                                    </dd>
                                </dl>
                                <dl class="fore11"><dt><a href="" target="_blank">签证门票<i>&gt;</i></a></dt>
                                    <dd>
                                        <a href="" target="_blank">全球签证</a>
                                        <a href="" target="_blank">景点门票</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                    <div class="item-sub" id="category-item-15" data-id="15">
                        <div class="item-brands">
                            <div class="brands-inner">
                                <a href="" class="img-link" target="_blank"><img src="img/category/54d9ef34N7cc61f4c.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/5534f4d6N6cf59e34.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55a5b5baN89a65ec2.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/55b1d930Nf0bfccbb.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/562f4971Na5379aba.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/564a8df2Nbab8fdab.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a6d27cNbb9b4a77.jpg" width="83" height="35"></a>
                                <a href="" class="img-link" target="_blank"><img src="img/category/56a72d4fN4d1b42fe.jpg" width="83" height="35"></a>
                            </div>
                        </div>
                        <div class="item-channels">
                            <div class="channels">
                                <a href="" target="_blank">金融首页<i>&gt;</i></a>
                                <a href="" target="_blank">尖er货<i>&gt;</i></a>
                                <a href="" target="_blank">玩bigger<i>&gt;</i></a>
                                <a href="" target="_blank">大牌免息<i>&gt;</i></a>
                                <a href="" target="_blank">财发现<i>&gt;</i></a>
                            </div>
                        </div>
                        <div class="subitems">
                            <dl class="fore1"><dt><a href="" target="_blank">理财<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">京东小金库</a>
                                    <a href="" target="_blank">票据理财</a>
                                    <a href="" target="_blank">基金理财</a>
                                    <a href="" target="_blank">定期理财</a>
                                    <a href="" target="_blank">固收理财</a>
                                    <a href="" target="_blank">妈妈理财</a>
                                    <a href="" target="_blank">众投理财</a>
                                </dd>
                            </dl>
                            <dl class="fore2"><dt><a href="" target="_blank">众筹<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">智能硬件</a>
                                    <a href="" target="_blank">流行文化</a>
                                    <a href="" target="_blank">生活美学</a>
                                    <a href="" target="_blank">公益</a>
                                    <a href="" target="_blank">其他权益众筹</a>
                                </dd>
                            </dl>
                            <dl class="fore3"><dt><a href="" target="_blank">东家<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">私募股权</a>
                                </dd>
                            </dl>
                            <dl class="fore4"><dt><a href="" target="_blank">白条<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">京东白条</a>
                                    <a href="" target="_blank">白条联名卡</a>
                                    <a href="" target="_blank">京东钢镚</a>
                                    <a href="" target="_blank">旅游白条</a>
                                    <a href="" target="_blank">安居白条</a>
                                    <a href="" target="_blank">校园白条</a>
                                    <a href="" target="_blank">京东金采</a>
                                </dd>
                            </dl>
                            <dl class="fore5"><dt><a href="" target="_blank">钱包<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">京东钱包</a>
                                </dd>
                            </dl>
                            <dl class="fore6"><dt><a href="" target="_blank">保险<i>&gt;</i></a></dt>
                                <dd>
                                    <a href="" target="_blank">车险</a>
                                    <a href="" target="_blank">健康险</a>
                                    <a href="" target="_blank">意外险</a>
                                    <a href="" target="_blank">旅行险</a>
                                </dd>
                            </dl>
                        </div>
                        <div class="item-promotions">
                            <a href="" class="img-link" target="_blank"><img src="img/category/577e364eN86c8f187.jpg" width="168" height="134"></a>
                            <a href="" class="img-link" target="_blank"><img src="img/category/577f019cN4ea29161.jpg" width="168" height="134"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--index_ok-->
        <div id="navitems">

            <ul id="navitems-group1">
                <li class="fore1">
                    <a target="_blank" href="">服装城</a>
                </li>
                <li class="fore2">
                    <a target="_blank" href="">美妆馆</a>
                </li>
                <li class="fore3">
                    <a target="_blank" href="">京东超市</a>
                </li>
                <li class="fore4">
                    <a target="_blank" href="">生鲜</a>
                </li>
            </ul>
            <div class="spacer"></div>
            <ul id="navitems-group2">
                <li class="fore1">
                    <a target="_blank" href="">全球购</a>
                </li>
                <li class="fore2">
                    <a target="_blank" href="">闪购</a>
                </li>
                <li class="fore3">
                    <a target="_blank" href="">团购</a>
                </li>
                <li class="fore4">
                    <a target="_blank" href="">拍卖</a>
                </li>
                <li class="fore5">
                    <a target="_blank" href="">金融</a>
                </li>
            </ul>
        </div>
        <!--index_ok-->

        <div id="treasure"></div>
        <span class="clr"></span>
    </div>
</div>

<!--导航栏 所有商品分类 结束-->

<!--灰色条 导航-->
<div class="crumb-wrap">
    <div class="w">
        <div class="crumb fl clearfix">
            <div class="item first"><a href='//shouji.jd.com' clstag="shangpin|keycount|product|mbNav-1">手机</a></div>
            <div class="item sep">&gt;</div>
            <div class="item"><a href='//list.jd.com/list.html?cat=9987,653' clstag="shangpin|keycount|product|mbNav-2">手机通讯</a></div>
            <div class="item sep">&gt;</div>
            <div class="item"><a href='//list.jd.com/list.html?cat=9987,653,655' clstag="shangpin|keycount|product|mbNav-3">手机</a></div>
            <div class="item sep">&gt;</div>
            <div class="item">
                <div class="J-crumb-br crumb-br EDropdown">
                    <div class="inner border">
                        <div class="head" id="head" data-drop="head">
                            <a href='//list.jd.com/list.html?cat=9987,653,655&ev=exbrand_8557' clstag="shangpin|keycount|product|mbNav-4">
                                华为（HUAWEI）
                            </a>
                            <span class="arrow arr-close jiantou"></span>
                        </div>
                        <div class="content hide xialakuang" id="content_hide" data-drop="content">
                            <ul style="display: block;" class="br-reco plist-1 lh clearfix" clstag="shangpin|keycount|product|mbTJ-1">
                                <li class="fore1">
                                    <div class="p-img">
                                        <a href="//item.jd.com/3046724.html" target="_blank">
                                            <img alt="荣耀 V8 4GB+32GB 铂光金 移动联通4G手机 双卡双待双通" src="img/product/inner1.jpg" height="65" width="65">
                                        </a>
                                    </div>
                                    <div class="p-name">
                                        <a href="//item.jd.com/3046724.html" target="_blank">
                                            荣耀 V8 4GB+32GB 铂光金  移动联通4G
                                        </a>
                                    </div>
                                    <div class="p-price">
                                        <strong class="J-p-3046724">￥2299.00</strong>
                                    </div>
                                </li>
                                <li class="fore2">
                                    <div class="p-img">
                                        <a href="//item.jd.com/3245084.html" target="_blank">
                                            <img alt="荣耀8 4GB+32GB 全网通版  珠光白" src="img/product/inner2.jpg" height="65" width="65">
                                        </a>
                                    </div>
                                    <div class="p-name">
                                        <a href="//item.jd.com/3245084.html" target="_blank">
                                            荣耀8 4GB+32GB 全网通版  珠光白 4G手机
                                        </a>
                                    </div>
                                    <div class="p-price">
                                        <strong class="J-p-3245084">￥2299.00</strong>
                                    </div>
                                </li>
                                <li class="fore3">
                                    <div class="p-img">
                                        <a href="//item.jd.com/1684485.html" target="_blank">
                                            <img alt="荣耀7 (PLK-AL10) 3GB+64GB内存版 荣耀金 移动联通电信4G手机 双卡双待双通" src="img/product/inner3.jpg" height="65" width="65">
                                        </a>
                                    </div>
                                    <div class="p-name">
                                        <a href="//item.jd.com/1684485.html" target="_blank">
                                            荣耀7 (PLK-AL10) 3GB+64GB内存 荣耀金
                                        </a>
                                    </div>
                                    <div class="p-price">
                                        <strong class="J-p-1684485">￥1999.00</strong>
                                    </div>
                                </li>
                            </ul>

                            <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
                            <ul class="br-list" clstag="shangpin|keycount|product|mbTJ-2">
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_8557" target="_blank" title="华为（HUAWEI）">
                                        华为（HUAWEI）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_12669" target="_blank" title="魅族（MEIZU）">
                                        魅族（MEIZU）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_18374" target="_blank" title="小米（MI）">
                                        小米（MI）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_14026" target="_blank" title="Apple">
                                        Apple
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_15127" target="_blank" title="三星（SAMSUNG）">
                                        三星（SAMSUNG）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_11188" target="_blank" title="乐视（Letv）">
                                        乐视（Letv）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_27306" target="_blank" title="360">
                                        360
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_2032" target="_blank" title="OPPO">
                                        OPPO
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_21011" target="_blank" title="中兴（ZTE）">
                                        中兴（ZTE）
                                    </a>
                                </li>
                                <li>
                                    <a href="//list.jd.com/list.html?cat=9987,653,655" target="_blank" title="更多">
                                        更多&gt;&gt;
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item sep">&gt;</div>

            <!--1.8 产品详情-->
            <div class="item ellipsis" title="${product.pname}">${product.pname}</div>
        </div>

        <!-- .crumb -->
        <!--灰色导航 右边-->
        <div class="contact fr clearfix">
            <div class="item">
                <div class="name">
                    <a href="//huawei.jd.com" target="_blank" title="华为官方旗舰店" clstag="shangpin|keycount|product|dianpuname1">
                        华为官方旗舰店
                    </a>
                    <em class="u-jd">京东自营</em>
                </div>
            </div>
            <div class="item">
                <div class="J-im-btn" clstag="shangpin|keycount|product|dongdong_1">
                    <div data-domain="chat.jd.com" data-code="1" data-seller="华为官方旗舰店" title="联系供应商" class="im gys-im">
                        <i class="sprite-im"></i>
                        <span>联系供应商</span>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="J-jimi-btn" clstag="shangpin|keycount|product|jimi_1">
                    <div class="jimi">
                        <a href="//jimi.jd.com/index.action?productId=2600210&amp;source=productpop" target="_blank">
                            <i class="sprite-jimi"></i>
                            JIMI
                        </a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="follow J-follow-shop" data-vid="1000004259" clstag="shangpin|keycount|product|guanzhu">
                    <i class="sprite-follow"></i><span>关注店铺</span>
                </div>
            </div>
        </div>
        <div class="clr">
        </div>
    </div>

</div>
<!--灰色导航结束-->

<!--商品详情简略部分开始-->
<div class="w">
    <div class="product-intro clearfix">
        <div class="preview-wrap">
            <div class="preview" id="preview">
                <div style="width: 452px;height: 452px;" id="spec-n1" class="jqzoom main-img" onclick="window.open('//item.jd.com/bigimage.aspx?id=2600210')" clstag="shangpin|keycount|product|mainpic_1">

                </div>

                <div class="spec-list" clstag="shangpin|keycount|product|lunbotu_1" id="spec_animate">
                    <a id="spec-forward" href="javascript:;" class="arrow-prev disabled">
                        <i class="sprite-arrow-prev"></i>
                    </a>
                    <a id="spec-backward" href="javascript:;" class="arrow-next">
                        <i class="sprite-arrow-next"></i>
                    </a>
                    <div style="position: relative;width: 380px;height: 58px;overflow: hidden;margin-left: 30px;" >
                        <div style="position: relative; width: 2000px; height: 58px; overflow: hidden;" id="spec-list" class="spec-items">
                            <ul style="position: absolute; width: 988px; height: 58px; top: 0px; left: 0px;" class="lh">
                                <%--data-img="1"--%>
                                <li class="tel" id="1"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_large_img}"    height="54" width="54"></li>
                                <li class="tel" id="2"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_small_img1}"   height="54" width="54"></li>
                                <li class="tel" id="3"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_small_img2}"   height="54" width="54"></li>
                                <li class="tel" id="4"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_small_img3}"   height="54" width="54"></li>
                                <li class="tel" id="5"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_small_img4}"   height="54" width="54"></li>
                                <li class="tel" id="6"><img alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待" src="img/productImage/${product.detail_small_img5}"   height="54" width="54"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="preview-info">
                    <div class="sku">商品编号：
                        <span>2600210</span>
                    </div>
                    <div class="btns">
                        <a class="follow J-follow" data-id="2600210" href="#none" clstag="shangpin|keycount|product|guanzhushangpin_1">
                            <i class="sprite-follow-sku"></i>
                            <em>关注</em>
                        </a>
                        <a class="share J-share" href="#none" clstag="shangpin|keycount|product|share_1">
                            <i class="sprite-share"></i>
                            <em>分享</em>
                        </a>
                        <a class="compare J-compare J_contrast" id="comp_2600210" data-sku="2600210" href="#none" clstag="shangpin|keycount|product|jiaruduibi">
                            <i class="sprite-compare"></i>
                            <em>对比</em>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="itemInfo-wrap">
            <!--1.8 产品名称-->
            <div class="sku-name">${product.pname}</div>
            <div class="news">

                <div title="${product.pdesc}" style="display: block;" class="item hide" id="p-ad" clstag="shangpin|keycount|product|slogana" data-hook="hide">
                    <!--1.8 产品描述-->
                    ${product.pdesc}
                    <a target="_blank" href="http://sale.jd.com/act/OTgDpRcL2QMb.html">

                    </a>
                </div>
                <div title="选择下方购买方式→【移动优惠购】→【北京老用户优惠购机】即享优惠【套餐享7折+免费宽带】" style="display: block;" class="item hide" id="p-ad-phone" clstag="shangpin|keycount|product|sloganb" data-hook="hide">
                    选择下方购买方式→【移动优惠购】→【北京老用户优惠购机】即享优惠【套餐享7折+免费宽带】
                </div>
            </div>

            <div class="summary summary-first">
                <div class="summary-price-wrap">
                    <div class="summary-price J-summary-price">
                        <div class="dt">京 东 价</div>
                        <div class="dd">
                            <!--1.8 产品价格-->
                            <span class="p-price"><span>￥</span><span class="price J-p-2600210">${product.price}</span></span>
                            <a class="notice J-notify-sale" data-type="1" data-sku="2600210" href="#none" clstag="shangpin|keycount|product|jiangjia_1">降价通知</a>
                        </div>
                    </div>

                    <div class="summary-info">
                        <div class="comment-count">
                            累计评价
                            <a class="count J-comm-2600210" href="#comment" clstag="shangpin|keycount|product|pingjiabtn_1">
                                16214
                            </a>
                        </div>
                    </div>
                    <div id="J-summary-top" class="summary-top z-has-more-promotion" clstag="shangpin|keycount|product|cuxiao_1">
                        <div class="" id="summary-promotion" data-hook="hide">
                            <div class="dt">促　　销</div>
                            <div class="dd J-prom-wrap p-promotions-wrap">
                                <div class="p-promotions">
                                    <ins id="prom-mbuy" data-url="http://cd.jd.com/qrcode?skuId=2600210&amp;location=3&amp;isWeChatStock=2"></ins>
                                    <!--<ins id="prom-gift" clstag="shangpin|keycount|product|zengpin_1">
                                        	<div class="J-prom-gift">
                                        		<div class="prom-gifts clearfix">
                                        			<span class="prom-gift-label">
                                        				<em class="hl_red_bg">赠品</em>
                                        			</span>
                                        			<div class="prom-gift-list">
                                        				<div class="prom-gift-item" data-count="true">
                                        					<a target="_blank" href="//item.jd.com/2213008.html" title="Capshi Type-C数据线转换头 micro安卓转接头 适于华为麦芒5/P9/荣耀V8 乐视1S/2/Pro/Max 小米4C/5 魅族PRO5">
                                        						<img src="//img13.360buyimg.com/n1/s25x25_jfs/t1891/37/1636536309/130593/3f5fb704/566fa4b9Na1c2fac7.jpg" class="gift-img" height="25" width="25">
                                        					</a>
                                        					<em class="gift-number">× 1</em>
                                        				</div>
                                        				<div class="J-gift-limit">（赠完即止）</div>
                                        			</div>
                                        		</div>
                                        	</div>
                                        </ins>-->
                                    <ins id="prom">
                                        <div class="J-prom">
                                        </div>
                                    </ins>
                                    <ins id="prom-one">
                                        <div class="J-prom">
                                            <div class="prom-item" data-code="">
                                                <em class="hl_red">以下促销可在购物车任选其一</em>
                                            </div>
                                            <div class="prom-item" data-code="18">
                                                <em class="hl_red_bg">满赠</em>
                                                <em class="hl_red">满99.00元即赠热销商品，赠完即止，请在购物车点击领取</em>
                                                <a href="//sale.jd.com/act/a6GEnjbcL8WD.html" target="_blank">
                                                    &nbsp;&nbsp;详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                            <div class="prom-item" data-code="17">
                                                <em class="hl_red_bg">加价购</em>
                                                <em class="hl_red">满999.00另加25.00元，或满1999.00另加33.00元，即可在购物车换购热销商品</em>
                                                <a href="//sale.jd.com/act/0qPOwYVtbds.html" target="_blank">
                                                    &nbsp;&nbsp;详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </div>
                                    </ins>
                                    <ins id="prom-phone"></ins>
                                    <ins id="prom-phone-jjg"></ins>
                                    <ins id="prom-tips"></ins>
                                    <ins id="prom-quan"></ins>
                                    <div style="visibility: visible;" class="J-prom-more view-all-promotions" data-hook="hide">
                                        <span class="prom-sum">共<em class="prom-number J-prom-count">3</em>项促销</span>
                                        <a href="#none" class="view-link"><i class="sprite-arr-close"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="summary-quan" class="li p-choose hide" clstag="shangpin|keycount|product|lingquan"></div>
                </div>
            </div>
            <div class="summary p-choose-wrap">
                <div id="summary-support" class="li hide">
                    <div class="dt">支　　持</div>
                    <div class="dd">
                        <ul class="choose-support lh">
                            <li id="old2new" clstag="shangpin|keycount|product|zhichi_old2new_655">
                                <a target="_blank" href="//sale.jd.com/act/02ZCO1Nqk7eALJw.html" title="">
                                    <i class="sprite-old2new"></i>
                                    <span>以旧换新，闲置手机回收</span>
                                </a>
                            </li>
                            <li id="tcbg" clstag="shangpin|keycount|product|zhichi_tcbg_655">
                                <a href="#none" title="">
                                    <i class="sprite-tcbg"></i>
                                    <span>4G套餐超值抢</span>
                                </a>
                            </li>
                            <li id="giftbuy" clstag="shangpin|keycount|product|zhichi_giftbuy_655">
                                <a target="_blank" href="//cart-gift.jd.com/cart/addGiftToCart.action?pid=2600210&amp;pcount=1&amp;ptype=1" title="">
                                    <i class="sprite-giftbuy"></i>
                                    <span>礼品购</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="summary-stock" clstag="shangpin|keycount|product|quyuxuanze_1">
                    <div class="dt">配 送 至</div>
                    <div class="dd">
                        <div class="store clearfix">
                            <div id="stock-address" class="stock-address EDropdown" data-role="drop">
                                <div class="inner">
                                    <div data-drop="head" class="head">
                                        <span class="text" data-res="">北京朝阳区三环以内</span>
                                        <span class="arrow arr-close"></span>
                                    </div>
                                    <div data-drop="content" class="content hide">
                                        <!--<div class="close" data-close>x</div>-->
                                        <dl data-role="drop" class="address-used hide">
                                            <dt data-drop="head"><strong>常用地址</strong><span class="arrow"></span></dt>
                                            <dd class="stock-address-list J-common-address hide" clstag="shangpin|keycount|product|morendizhi_1"></dd>
                                        </dl>
                                        <div class="line hide"></div>
                                        <dl data-role="drop" class="address-select clicked">
                                            <dt data-drop="head"><strong>选择新地址</strong><span class="arrow"></span></dt>
                                            <dd class="stock-address-list hide">
                                                <div class="address-tab J-address-tab ETab">
                                                    <ul class="tab">
                                                        <li data-tab="trigger" class="current">请选择</li>
                                                        <li data-tab="trigger">请选择</li>
                                                        <li data-tab="trigger">请选择</li>
                                                        <li data-tab="trigger" style="display:none">请选择</li>
                                                    </ul>
                                                    <div class="tab-con">
                                                        <div data-tab="item" data-level="0" clstag="shangpin|keycount|product|yijidizhi_1">
                                                            <li data-value="1" data-name="北京"><a href="#none">北京</a></li>
                                                            <li data-value="2" data-name="上海"><a href="#none">上海</a></li>
                                                            <li data-value="3" data-name="天津"><a href="#none">天津</a></li>
                                                            <li data-value="4" data-name="重庆"><a href="#none">重庆</a></li>
                                                            <li data-value="5" data-name="河北"><a href="#none">河北</a></li>
                                                            <li data-value="6" data-name="山西"><a href="#none">山西</a></li>
                                                            <li data-value="7" data-name="河南"><a href="#none">河南</a></li>
                                                            <li data-value="8" data-name="辽宁"><a href="#none">辽宁</a></li>
                                                            <li data-value="9" data-name="吉林"><a href="#none">吉林</a></li>
                                                            <li data-value="10" data-name="黑龙江"><a href="#none">黑龙江</a></li>
                                                            <li data-value="11" data-name="内蒙古"><a href="#none">内蒙古</a></li>
                                                            <li data-value="12" data-name="江苏"><a href="#none">江苏</a></li>
                                                            <li data-value="13" data-name="山东"><a href="#none">山东</a></li>
                                                            <li data-value="14" data-name="安徽"><a href="#none">安徽</a></li>
                                                            <li data-value="15" data-name="浙江"><a href="#none">浙江</a></li>
                                                            <li data-value="16" data-name="福建"><a href="#none">福建</a></li>
                                                            <li data-value="17" data-name="湖北"><a href="#none">湖北</a></li>
                                                            <li data-value="18" data-name="湖南"><a href="#none">湖南</a></li>
                                                            <li data-value="19" data-name="广东"><a href="#none">广东</a></li>
                                                            <li data-value="20" data-name="广西"><a href="#none">广西</a></li>
                                                            <li data-value="21" data-name="江西"><a href="#none">江西</a></li>
                                                            <li data-value="22" data-name="四川"><a href="#none">四川</a></li>
                                                            <li data-value="23" data-name="海南"><a href="#none">海南</a></li>
                                                            <li data-value="24" data-name="贵州"><a href="#none">贵州</a></li>
                                                            <li data-value="25" data-name="云南"><a href="#none">云南</a></li>
                                                            <li data-value="26" data-name="西藏"><a href="#none">西藏</a></li>
                                                            <li data-value="27" data-name="陕西"><a href="#none">陕西</a></li>
                                                            <li data-value="28" data-name="甘肃"><a href="#none">甘肃</a></li>
                                                            <li data-value="29" data-name="青海"><a href="#none">青海</a></li>
                                                            <li data-value="30" data-name="宁夏"><a href="#none">宁夏</a></li>
                                                            <li data-value="31" data-name="新疆"><a href="#none">新疆</a></li>
                                                            <li data-value="32" data-name="台湾"><a href="#none">台湾</a></li>
                                                            <li data-value="42" data-name="香港"><a href="#none">香港</a></li>
                                                            <li data-value="43" data-name="澳门"><a href="#none">澳门</a></li>
                                                            <li data-value="84" data-name="钓鱼岛">
                                                                <a href="#none">钓鱼岛</a>
                                                            </li>
                                                        </div>
                                                        <div data-tab="item" data-level="1" class="hide" clstag="shangpin|keycount|product|erjidizhi_1">请选择</div>
                                                        <div data-tab="item" data-level="2" class="hide" clstag="shangpin|keycount|product|sanjidizhi_1">请选择</div>
                                                        <div data-tab="item" data-level="3" class="hide" clstag="shangpin|keycount|product|sijidizhi_1">请选择</div>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div id="store-prompt" class="store-prompt">
                                <strong>有货</strong>
                            </div>
                            <div data-role="drop" class="J-promise-icon promise-icon fl promise-icon-more" clstag="shangpin|keycount|product|promisefw_1">
                                <div class="title fl">支持</div>
                                <div class="icon-list fl">
                                    <ul>
                                        <div class="line1 clearfix">
                                            <a target="_blank" title="钻石会员自营订单满79元（含）免运费，其他会员自营订单满99元（含）免运费，不足金额订单收取6元/单运费。" href="//help.jd.com/user/issue/103-983.html" class="free_delivery" clstag="shangpin|keycount|product|promisefw_1">
                                                99元免运费
                                            </a>
                                            <a target="_blank" title="支持送货上门后再收款，支持现金、POS机刷卡等方式" href="//help.jd.com/user/issue/103-983.html" class="payment_cod" clstag="shangpin|keycount|product|promisefw_1">
                                                货到付款
                                            </a>
                                            <a target="_blank" title="支持晚上19:00-22:00送货" href="//help.jd.com/user/issue/103-983.html" class="sendpay_311 noborder" clstag="shangpin|keycount|product|promisefw_1">
                                                夜间配
                                            </a>
                                        </div>
                                        <div class="line2 clearfix">
                                            <a target="_blank" title="我们提供多种自提服务，包括京东自提点、自助提货柜、移动自提车等服务，钻石会员自提自营商品订单满79元免运费，其他会员自提自营商品订单满99元免运费；不足金额订单收取3元/单运费。" href="//help.jd.com/user/issue/103-983.html" class="special_ziti noborder" clstag="shangpin|keycount|product|promisefw_1">
                                                自提
                                            </a>
                                        </div>
                                    </ul>
                                    <span class="clr"></span>
                                    <i></i>
                                </div>
                            </div>
                            <div class="J-dcashDesc dcashDesc fl"></div>
                        </div>
                        <div id="summary-service" class="summary-service" clstag="shangpin|keycount|product|fuwu_1">
                            由 京东 发货，并提供售后服务。15:00前完成下单,可预约今晚送达
                        </div>
                    </div>
                </div>
                <div id="choose-color" class="li">
                    <div class="dt">选择颜色</div>
                    <div class="dd clearfix">
                        <div class="item  selected">
                            <a href="javascript:;" data-text="金色" title="金色" clstag="shangpin|keycount|product|yanse-金色">
                                <img src="img/product/choose1.jpg" alt="金色" height="40" width="40">
                                <i>金色</i>
                            </a>
                        </div>
                        <div class="item"><a href="javascript:;" data-text="灰色" title="灰色" clstag="shangpin|keycount|product|yanse-灰色">
                            <img src="img/product/choose2.jpg" alt="灰色" height="40" width="40">
                            <i>灰色</i>
                        </a>
                        </div>
                        <div class="item">
                            <a href="javascript:;" data-text="皓月银" title="皓月银" clstag="shangpin|keycount|product|yanse-皓月银">
                                <img src="img/product/choose3.jpg" alt="皓月银" height="40" width="40">
                                <i>皓月银</i>
                            </a>
                        </div>
                    </div>
                </div>
                <div id="choose-version" class="li">
                    <div class="dt">选择版本</div>
                    <div class="dd clearfix">
                        <div class="item  selected">
                            <a href="javascript:;" data-text="移动联通电信4G" title="移动联通电信4G" clstag="shangpin|keycount|product|banben-移动联通电信4G">
                                移动联通电信4G
                            </a>
                        </div>
                        <div class="item disabled">
                            <a href="javascript:;" data-text="移动4G" title="所选颜色该版本商品在该地区无货" clstag="shangpin|keycount|product|banben-移动4G">
                                移动4G
                            </a>
                        </div>
                        <div class="item disabled">
                            <a href="javascript:;" data-text="移动联通4G" title="所选颜色该版本商品在该地区无货" clstag="shangpin|keycount|product|banben-移动联通4G">
                                移动联通4G
                            </a>
                        </div>
                    </div>
                </div>
                <div id="choose-type" class="li" data-hook="hide" style="">
                    <div class="dt">购买方式</div>
                    <div class="dd">
                        <div class="J-btype-item item selected" clstag="shangpin|keycount|product|gmfs-官方标配" data-ind="0" data-matched="false" data-sp="-1" data-count="1">
                            <b></b>
                            <a href="#none" title="">官方标配</a>
                        </div>
                        <div class="J-btype-item item" clstag="shangpin|keycount|product|gmfs-电信优惠购" data-ind="1" data-matched="false" data-ishy="true" data-sp="3" data-count="2">
                            <b></b>
                            <a href="#none" title="">电信优惠购</a>
                        </div>
                        <div class="J-btype-item item" clstag="shangpin|keycount|product|gmfs-移动优惠购" data-ind="2" data-matched="false" data-ishy="true" data-sp="1" data-count="2">
                            <b></b>
                            <a href="#none" title="">移动优惠购</a>
                        </div>
                        <div class="J-btype-item item" clstag="shangpin|keycount|product|gmfs-联通优惠购" data-ind="3" data-matched="false" data-ishy="true" data-sp="2" data-count="1">
                            <b></b>
                            <a href="#none" title="">联通优惠购</a>
                        </div>
                    </div>
                </div>
                <div id="choose-type-hy" class="li" data-hook="hide" style="display: none;">            <div class="dt">优惠类型</div>            <div class="dd">                <div class="J-hy-btype">                    <div class="item selected" clstag="shangpin|keycount|product|hylx-非合约机" data-aurl="" data-rurl="" data-type="0" data-id="100" data-skus="" data-ad="选择下方购买方式→【移动优惠购】→【北京老用户优惠购机】即享优惠【套餐享7折+免费宽带】" data-ind="0" data-sku="2600210" data-sp="-1">                        <b></b>                        <a href="#none" title="">非合约机</a>                    </div>                </div>                <div class="J-hy-btype hide">                    <div class="item selected" clstag="shangpin|keycount|product|hylx-电信老用户购机送费" data-aurl="http://eve.jd.com/apollo/ctcc/main?phoneWid={sku}&amp;bType=33&amp;provinceId={pid}&amp;cityId={cid}" data-rurl="http://eve.jd.com/redirect.action?wid={sku}&amp;btype=33&amp;pid={pid}&amp;cid={cid}" data-type="1" data-id="33" data-skus="" data-ad="选择电信老用户购机送费，不换号码享新款机器！下单前请咨询阅读电信购机赠费入网协议！" data-ind="0" data-sku="2729494" data-sp="3">                        <b></b>                        <a href="#none" title="">电信老用户购机送费</a>                    </div>                    <div class="item" clstag="shangpin|keycount|product|hylx-买手机送话费" data-aurl="" data-rurl="http://eve.jd.com/redirect.action?wid={sku}&amp;btype=5&amp;pid={pid}&amp;cid={cid}" data-type="0" data-id="5" data-skus="" data-ad="只需加1元，129以上套餐档位可得200元自由话费立即到账！每月还有额外送费，享受全国套餐！" data-ind="1" data-sku="2729494" data-sp="3">                        <b></b>                        <a href="#none" title="">买手机送话费</a>                    </div>                </div>                <div class="J-hy-btype hide">                    <div class="item selected" clstag="shangpin|keycount|product|hylx-北京老用户优惠购机" data-aurl="" data-rurl="http://eve.jd.com/redirect.action?wid={sku}&amp;btype=34&amp;pid={pid}&amp;cid={cid}" data-type="1" data-id="34" data-skus="" data-ad="" data-ind="0" data-sku="2670579" data-sp="1">                        <b></b>                        <a href="#none" title="">北京老用户优惠购机</a>                    </div>                    <div class="item" clstag="shangpin|keycount|product|hylx-老用户优惠购机" data-aurl="//eve.jd.com/apollo/mobile/main.htm?phoneWid={sku}&amp;bType=18&amp;provinceId={pid}&amp;cityId={cid}" data-rurl="//eve.jd.com/redirect.action?wid={sku}&amp;btype=18&amp;pid={pid}&amp;cid={cid}" data-type="1" data-id="18" data-skus="" data-ad="" data-ind="1" data-sku="2965242" data-sp="1">                        <b></b>                        <a href="#none" title="">老用户优惠购机</a>                    </div>                </div>                <div class="J-hy-btype hide">                    <div class="item selected" clstag="shangpin|keycount|product|hylx-买手机送话费" data-aurl="" data-rurl="http://eve.jd.com/redirect.action?wid={sku}&amp;btype=2&amp;pid={pid}&amp;cid={cid}" data-type="0" data-id="2" data-skus="" data-ad="选择1月合约期本地4G套餐，月费低，本地流量多；选择12月合约期加36元得360元话费，享全国套餐。" data-ind="0" data-sku="2729496" data-sp="2">                        <b></b>                        <a href="#none" title="">买手机送话费</a>                    </div>                </div>                     <a style="display: none;" class="J-hy-btype-tips hy-btype-tips icon question fl" href="#none"><i class="sprite-question"></i></a>            </div></div>
                <div id="choose-type-suit" class="li" data-hook="hide" style="display:none;">
                    <div class="dt">优惠套餐</div>
                    <div class="dd clearfix">
                        <div class="item J-suit-trigger" clstag="shangpin|keycount|product|taocanleixing">
                            <i class="sprite-selected"></i>
                            <a href="#none" title="选择套餐与资费">选择套餐与资费</a>
                        </div>
                        <div class="fl" style="padding-top:5px;">
                            <span class="J-suit-tips hide">请选择套餐内容</span>
                            <span class="J-suit-resel J-suit-trigger hl_blue hide" href="#none">重选</span>
                        </div>
                    </div>
                </div>
                <div id="btype-tip" data-hook="hide" style="display:none;">
                    　您选择的地区暂不支持合约机销售！
                </div>
                <div id="choose-suits" class="li choose-suits">
                    <div class="dt">套　　装</div>
                    <div class="dd clearfix">
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,2819667" data-type="p" data-sid="4212254" clstag="shangpin|keycount|product|xuanzetaozhuang_655">
                                保护套装
                            </a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,2805155" data-type="p" data-sid="4212255" clstag="shangpin|keycount|product|xuanzetaozhuang_655">保护套装</a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,1887518" data-type="p" data-sid="4217026" clstag="shangpin|keycount|product|xuanzetaozhuang_655">
                                存储扩展
                            </a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,1138288" data-type="p" data-sid="4216482" clstag="shangpin|keycount|product|xuanzetaozhuang_655">
                                充电套装
                            </a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,2896470" data-type="p" data-sid="4222556" clstag="shangpin|keycount|product|xuanzetaozhuang_655">
                                充电套装
                            </a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                        <div class="item">
                            <a href="#none" class="title" data-drop="head" data-skus="2600210,2819991" data-type="p" data-sid="4224086" clstag="shangpin|keycount|product|xuanzetaozhuang_655">
                                耳机套装
                            </a>
                            <div class="suits-panel J-suits-panel"></div>
                        </div>
                    </div>
                </div>
                <div id="choose-gift" class="choose-gift li" style="display: none;">
                    <div class="dt">搭配赠品</div>
                    <div class="dd clearfix">
                        <div class="gift J-gift" clstag="shangpin|keycount|product|dapeizengpin">
                            <i class="sprite-gift J-popup"></i>
                            <span class="gift-tips">选择搭配赠品(共<em>0</em>个)</span>
                        </div>
                        <!--choosed-->
                        <div class="J-gift-selected hide">
                            <div class="gift choosed J-gift-choosed"></div>
                            <a href="#none" class="gift-modify J-popup" clstag="shangpin|keycount|product|zengpin-genggai">
                                更改
                            </a>
                        </div>
                    </div>
                </div>
                <div id="choose-service" class="li" data-hook="hide" style="">
                    <div class="dt" data-yb="new_yb_server">增值保障</div>
                    <div class="dd">
                        <div class="service-type-yb clearfix">
                            <div class="yb-item-cat">
                                <div class="yb-item">
                                    <img class="icon" src="img/product/zengzhi1.png">
                                    <span class="name">意外保1年</span>
                                    <span class="price">￥99</span>
                                    <i class="arrow-icon"></i>
                                </div>
                                <div class="more-item">
                                    <ul>
                                        <li data-sku="10154225687">
                                            <div class="title" title="意外故障免费上门取修，所修部件保修3个月">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154225687">
                    									<i class="sprite-checkbox"></i>
                    									<span class="tips">优惠</span>
                    									<span class="name">意外保1年</span>
                    									<span class="price">￥99</span>
                    								</span>
                                                <a href="//item.jd.com/10154225687.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10238107821">
                                            <div class="title" title="为移动类设备提供一年的数据恢复服务">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10238107821">
                    									<i class="sprite-checkbox"></i>
                    									<span class="tips">优惠</span>
                    									<span class="name">数据恢复</span>
                    									<span class="price">￥169</span>
                    								</span>
                                                <a href="//item.jd.com/10238107821.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10358567578">
                                            <div class="title" title="手机屏幕意外碎裂保障服务">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10358567578">
                    									<i class="sprite-checkbox"></i>
                    									<span class="tips">优惠</span>
                    									<span class="name">手机碎屏保</span>
                    									<span class="price">￥79</span>
                    								</span>
                                                <a href="//item.jd.com/10358567578.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="2660266">
                                            <div class="title" title="2年内听话筒免费维修或按购机价赔付15%">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_2660266">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">手机包听讲</span>
                    									<span class="price">￥40</span>
                    								</span>
                                                <a href="//item.jd.com/2660266.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="yb-item-cat">
                                <div class="yb-item">
                                    <img class="icon" src="img/product/zengzhi2.png">
                                    <span class="name">延长保1年</span>
                                    <span class="price">￥79</span>
                                    <i class="arrow-icon"></i>
                                </div>
                                <div class="more-item">
                                    <ul>
                                        <li data-sku="10154192969">
                                            <div class="title" title="保修期延长1年，延长期内免费上门取修">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154192969">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">延长保1年</span>
                    									<span class="price">￥79</span>
                    								</span>
                                                <a href="//item.jd.com/10154192969.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10154204217">
                                            <div class="title" title="保修期延长2年，延长期内免费上门取修">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154204217">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">延长保2年</span>
                    									<span class="price">￥179</span>
                    								</span>
                                                <a href="//item.jd.com/10154204217.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="yb-item-cat">
                                <div class="yb-item">
                                    <img class="icon" src="img/product/zengzhi3.png">
                                    <span class="name">全保2年</span>
                                    <span class="price">￥299</span>
                                    <i class="arrow-icon"></i>
                                </div>
                                <div class="more-item">
                                    <ul>
                                        <li data-sku="10154255268">
                                            <div class="title" title="2年意外保+1年延保，免费上门取修">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154255268">
                    									<i class="sprite-checkbox"></i>
                    									<span class="tips">优惠</span>
                    									<span class="name">全保2年</span>
                    									<span class="price">￥299</span>
                    								</span>
                                                <a href="//item.jd.com/10154255268.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10128545927">
                                            <div class="title" title="意外故障免费上门取修，所修部件保修3个月">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10128545927">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">意外保2年</span>
                    									<span class="price">￥249</span>
                    								</span>
                                                <a href="//item.jd.com/10128545927.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10245507181">
                                            <div class="title" title="1年内手机被盗窃或抢劫，给予一定金额补偿">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10245507181">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">手机盗抢保</span>
                    									<span class="price">￥99</span>
                    								</span>
                                                <a href="//item.jd.com/10245507181.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10154271111">
                                            <div class="title" title="屏幕碎裂免费上门取修，新换屏幕保修3个月">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154271111">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">屏碎保1年</span>
                    									<span class="price">￥159</span>
                    								</span>
                                                <a href="//item.jd.com/10154271111.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                        <li data-sku="10154517220">
                                            <div class="title" title="屏幕碎裂免费上门取修，新换屏幕保修3个月">
                    								<span class="choose-btn" clstag="shangpin|keycount|product|jingdongfuwu_10154517220">
                    									<i class="sprite-checkbox"></i>
                    									<span class="name">屏碎保2年</span>
                    									<span class="price">￥269</span>
                    								</span>
                                                <a href="//item.jd.com/10154517220.html" target="_blank" class="detail-more" clstag="shangpin|keycount|product|jingdongfuwu_xiangqing">
                                                    详情
                                                    <s class="s-arrow">&gt;&gt;</s>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="service-tips">
                                <a href="#none"><i class="sprite-question"></i></a>
                                <div class="tips">
                                    <div class="sprite-arrow"></div>
                                    <div class="content">
                                        <dl>
                                            <dd>增值保障是指凡在京东购买商品或服务的消费者，在保障期间内遇到无论是正常使用中的问题还是意外事故，即可享受增值保障服务。保障内容包括：延长保修、只换不修、意外保护、服务保障。覆盖家电、手机数码、电脑办公、汽车用品、服饰家居等商品。</dd>
                                        </dl>
                                        <p>如有疑问，请与
                                            <a href="//chat.jd.com/pop/chat?shopId=162403" target="_blank">
                                                在线客服
                                            </a>
                                            联系
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="choose-baitiao" class="li choose-baitiao" style="">
                    <div class="dt">白条分期</div>
                    <div class="dd">
                        <div class="baitiao-list J-baitiao-list">
                            <div class="item" clstag="shangpin|keycount|product|baitiaofenqi_1_9987_653_655" data-snum="1">
                                <b></b>
                                <a href="#none">
                                    <strong>
                                        30天免息
                                    </strong>
                                    <span style="display:none;">
                    						<em>惠</em>
                    						 0手续费
                    					</span>
                                </a>
                                <div class="baitiao-tips hide">
                                    <ul>
                                        <li>无手续费</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item" clstag="shangpin|keycount|product|baitiaofenqi_3_9987_653_655" data-snum="3">
                                <b></b>
                                <a href="#none">
                                    <strong> ￥1078.61×3期                    </strong>
                                    <span style="display:none;">
                    						<em>惠</em> 含手续费
                    					</span>
                                </a>
                                <div class="baitiao-tips hide">
                                    <ul>
                                        <li>
                                            含手续费：费率0.5%，￥15.94×3期
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item" clstag="shangpin|keycount|product|baitiaofenqi_6_9987_653_655" data-snum="6">
                                <b></b>
                                <a href="#none">
                                    <strong> ￥547.27×6期                    </strong>
                                    <span style="display:none;">
                    						<em>惠</em> 含手续费
                    					</span>
                                </a>
                                <div class="baitiao-tips hide">
                                    <ul>
                                        <li>含手续费：费率0.5%，￥15.94×6期</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item" clstag="shangpin|keycount|product|baitiaofenqi_12_9987_653_655" data-snum="12">
                                <b></b>
                                <a href="#none">
                                    <strong> ￥281.61×12期                    </strong>
                                    <span style="display:none;">
                    						<em>惠</em> 含手续费
                    					</span>
                                </a>
                                <div class="baitiao-tips hide">
                                    <ul>
                                        <li>含手续费：费率0.5%，￥15.94×12期  </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item" clstag="shangpin|keycount|product|baitiaofenqi_24_9987_653_655" data-snum="24">
                                <b></b>
                                <a href="#none">
                                    <strong> ￥148.77×24期                    </strong>
                                    <span style="display:none;">
                    						<em>惠</em> 含手续费
                    					</span>
                                </a>
                                <div class="baitiao-tips hide">
                                    <ul>
                                        <li>含手续费：费率0.5%，￥15.94×24期</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="bt-info-tips">
                                <a class="J-icon-hui prom icon fl" href="#none">　</a>
                            </div>
                            <div class="bt-info-tips">
                                <a class="J-bt-tips question icon fl" href="#none">　</a>
                            </div>
                        </div>
                        <div class="baitiao-text J-baitiao-text"></div>
                    </div>
                </div>
                <div id="choose-btns" class="choose-btns clearfix">
                    <div class="choose-amount" clstag="shangpin|keycount|product|goumaishuliang_1">
                        <div class="wrap-input">
                            <input class="text buy-num" onkeyup="setAmount.modify('#buy-num');" id="buy-num" value="1">
                            <a class="btn-add" onclick="setAmount.add('#buy-num')" href="">+</a>
                            <a class="btn-reduce" onclick="setAmount.reduce('#buy-num')" href="">-</a>

                        </div>
                    </div>

                    <!--<a id="choose-btn-gift" class="btn-special1 btn-lg" style="display:none;" href="//cart.gift.jd.com/cart/addGiftToCart.action?pid=2600210&pcount=1&ptype=1" class="btn-gift" clstag="shangpin|keycount|product|选作礼物购买_1"><b></b>选作礼物购买</a>-->

                    <a href="//eve.jd.com/redirect.action?wid=2600210&amp;btype=100&amp;pid=1&amp;cid=72&amp;r=0.08266748638877608" id="btn-heyue" class="btn-special1 btn-lg" style="display:none;" clstag="shangpin|keycount|product|选择号码和套餐_1">
                        选择号码和套餐
                    </a>
                    <a href="ShoppingCartServlet?action=addToCart&pid=${product.pid}" id="InitCartUrl"  clstag="shangpin|keycount|product|加入购物车_1">

                    </a>
                    <a href="#none" id="btn-baitiao" class="btn-special2 btn-lg" style="display:none;">
                        打白条
                    </a>
                    <a href="#none" id="btn-onkeybuy" class="btn-special2 btn-lg" style="display:none;" clstag="shangpin|keycount|product|easybuy_1">
                        一键购
                    </a>
                    <a href="#none" id="btn-notify" class="J-notify-stock btn-special3 btn-lg notify-stock" style="display:none;" data-type="2" data-sku="2600210" clstag="shangpin|keycount|product|daohuo_1">到货通知</a>
                </div>
                <div style="display: block;" id="local-tips" class="summary-tips hide">
                    <div class="dt">本地活动</div>
                    <div class="dd">
                        <ol class="tips-list clearfix"><li>·<a data-aid="{0}" href="http://sale.jd.com/act/mRZ4HLxoOews3.html" target="_blank" clstag="shangpin|keycount|product|bendihuodong-10元抢1GB流量">10元抢1GB流量 &gt;&gt;</a></li></ol>
                    </div>
                </div>
                <div id="summary-tips" class="summary-tips" clstag="shangpin|keycount|product|wenxintishi_1" style="">
                    <div class="dt">温馨提示</div>
                    <div class="dd">
                        <ol class="tips-list clearfix"><li>·本商品不能使用 东券</li><li>·支持7天无理由退货</li></ol>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!--第一部分 导航部分-->
<div class="w">
    <div id="fittings" class="fittings ETab hide" style="display: block;">
        <div class="tab-main large">
            <ul>
                <li data-tab="trigger" class="current" data-name="人气配件" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_人气配件&quot;,&quot;&quot;,&quot;main&quot;)">人气配件</li>
                <li data-tab="trigger" data-name="手机贴膜" data-id="3" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_手机贴膜&quot;,&quot;&quot;,&quot;main&quot;)">手机贴膜</li><li data-tab="trigger" data-name="手机保护套" data-id="4" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_手机保护套&quot;,&quot;&quot;,&quot;main&quot;)">手机保护套</li><li data-tab="trigger" data-name="移动电源" data-id="10" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_移动电源&quot;,&quot;&quot;,&quot;main&quot;)">移动电源</li><li data-tab="trigger" data-name="数码存储卡" data-id="17" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_数码存储卡&quot;,&quot;&quot;,&quot;main&quot;)">数码存储卡</li><li data-tab="trigger" data-name="数据线" data-id="13" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_数据线&quot;,&quot;&quot;,&quot;main&quot;)">数据线</li><li data-tab="trigger" data-name="充电器" data-id="12" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_pjfl_充电器&quot;,&quot;&quot;,&quot;main&quot;)">充电器</li></ul>
            <div class="extra">
                <div class="item">
                    <a href="//kong.jd.com/mobile/accyCenter?sku=2600210" target="_blank" class="J-more" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_gdpj&quot;,&quot;&quot;,&quot;main&quot;)">更多配件 <s>&gt;&gt;</s></a>
                </div>
            </div>
        </div>
        <div class="tab-con J_fitting_con clearfix">
            <div class="master">
                <div class="p-list">
                    <div class="p-img">
                        <a href="//jd.com/" target="_blank">
                            <img data-img="1" src="img/product/p-img.jpg" width="100" height="100" alt="华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待">
                        </a>
                    </div>
                    <div class="p-name">
                        <!--1.8 商品名称-->
                        <a href="//item.jd.com/2600210.html" target="_blank">${product.pname}</a>
                    </div>
                    <div class="p-price hide">
                        <input type="checkbox" data-sku="2600210" id="inp-acc-master" checked="" data-jp="3188.00" data-mp="10999.00">
                        <label for="inp-acc-master"><strong class="J-p-2600210">3188.00</strong></label>
                    </div>
                    <i class="plus">+</i>
                </div>
            </div>
            <div class="suits">
                <div class="switchable-wrap" data-tab="item" style="display: block;">
                    <div class="btns">
                        <a href="javascript:void(0)" target="_self" class="prev-btn disabled"></a>
                        <a href="javascript:void(0)" target="_self" class="next-btn"></a>
                    </div>
                    <div class="lh-wrap" style="position: relative; width: 720px; height: 161px; overflow: hidden;">
                        <ul class="lh clearfix" style="position: absolute; width: 864px; height: 161px; top: 0px; left: 0px;">
                            <li data-push="2" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_0&quot;,&quot;&quot;,&quot;main&quot;)">
                                <div class="p-img">
                                    <a href="//item.jd.com/10365820562.html" target="_blank">
                                        <img width="100" height="100" src="img/product/p1.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="//item.jd.com/10365820562.html" target="_blank">闪魔 华为P9钢化玻璃膜5.2寸p9高清防爆全屏覆盖手机膜保护膜贴膜适用于华为P9 华为P9(金色带网点全覆盖钢化膜)</a>
                                </div>
                                <div class="p-price">
                                    <input type="checkbox" data-sku="10365820562" id="inp-acc-10365820562" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_0&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="16.80" data-mp="38.00">
                                    <label for="inp-acc-10365820562"><strong class="J-p-10365820562">￥16.80</strong></label>
                                </div>
                            </li>
                            <li data-push="3" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_1&quot;,&quot;&quot;,&quot;main&quot;)">
                                <div class="p-img">
                                    <a href="//item.jd.com/2653580.html" target="_blank">
                                        <img width="100" height="100" src="img/product/p2.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="//item.jd.com/2653580.html" target="_blank">亿色（ESR）华为 P9手机壳/保护套 透明硅胶防摔软壳 初色零感系列 啫喱白</a>
                                </div>
                                <div class="p-price">
                                    <input type="checkbox" data-sku="2653580" id="inp-acc-2653580" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_1&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="29.90" data-mp="59.00">
                                    <label for="inp-acc-2653580"><strong class="J-p-2653580">￥29.90</strong></label>
                                </div>
                            </li>
                            <li data-push="4" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_2&quot;,&quot;&quot;,&quot;main&quot;)">
                                <div class="p-img">
                                    <a href="//item.jd.com/879074.html" target="_blank">
                                        <img width="100" height="100" src="img/product/p3.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="//item.jd.com/879074.html" target="_blank">罗马仕（ROMOSS）sense4 10400mAh 超智能移动电源充电宝</a>
                                </div>
                                <div class="p-price">
                                    <input type="checkbox" data-sku="879074" id="inp-acc-879074" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_2&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="59.00" data-mp="199.00">
                                    <label for="inp-acc-879074"><strong class="J-p-879074">￥59.00</strong></label>
                                </div>
                            </li>
                            <li data-push="5" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_3&quot;,&quot;&quot;,&quot;main&quot;)">
                                <div class="p-img">
                                    <a href="//item.jd.com/2089986.html" target="_blank">
                                        <img width="100" height="100" src="img/product/p4.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="//item.jd.com/2089986.html" target="_blank">金士顿（Kingston）16GB 80MB/s TF(Micro SD)Class10 UHS-I高速存储卡 </a>
                                </div>
                                <div class="p-price">
                                    <input type="checkbox" data-sku="2089986" id="inp-acc-2089986" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_3&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="29.90" data-mp="59.00">
                                    <label for="inp-acc-2089986"><strong class="J-p-2089986">￥29.90</strong></label>
                                </div>
                            </li>
                            <li data-push="6" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_4&quot;,&quot;&quot;,&quot;main&quot;)">
                                <div class="p-img">
                                    <a href="//item.jd.com/1031615.html" target="_blank">
                                        <img width="100" height="100" src="img/product/p5.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="//item.jd.com/1031615.html" target="_blank">品胜 数据充电线二代 Micro USB 安卓接口手机数据线/充电线 1.5米白色 适于三星/小米/魅族/索尼/HTC/华为</a>
                                </div>
                                <div class="p-price">
                                    <input type="checkbox" data-sku="1031615" id="inp-acc-1031615" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_4&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="13.90" data-mp="23.00">
                                    <label for="inp-acc-1031615"><strong class="J-p-1031615">￥13.90</strong></label>
                                </div>
                            </li>
                            <li data-push="7" class="p-list" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_sp_5&quot;,&quot;&quot;,&quot;main&quot;)">        <div class="p-img">            <a href="//item.jd.com/797802.html" target="_blank">                <img width="100" height="100" src="//img12.360buyimg.com/n4/g16/M00/0B/17/rBEbRlN_BcwIAAAAAAC8IaP4SwoAACSCAJCPlAAALw5668.jpg">            </a>        </div>        <div class="p-name">            <a href="//item.jd.com/797802.html" target="_blank">品胜 爱充1A新版 移动电源/手机充电器/USB电源适配器/充电插头（不含数据线）苹果白</a>        </div>        <div class="p-price">            <input type="checkbox" data-sku="797802" id="inp-acc-797802" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_fxk_5&quot;,&quot;&quot;,&quot;main&quot;)" data-jp="25.00" data-mp="55.00">            <label for="inp-acc-797802"><strong class="J-p-797802">￥25.00</strong></label>        </div>    </li></ul>
                    </div>
                </div>
                <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div>                        <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div>                        <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div>                        <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div>                        <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div>                        <div class="switchable-wrap" data-tab="item" style="display: none;">                            <div class="btns">                                <a href="javascript:void(0)" target="_self" class="prev-btn"></a>                                <a href="javascript:void(0)" target="_self" class="next-btn"></a>                            </div>                            <div class="lh-wrap">                                <ul class="lh clearfix"></ul>                            </div>                        </div></div>

            <div class="infos">
                <div class="selected">已选择<em class="J-selected-cnt">0</em>个配件</div>
                <div class="p-price">
                    <span>组合价</span>
                    <strong class="J_cal_jp">￥3188.00</strong>
                </div>
                <div class="btn">
                    <a href="//cart.jd.com/reBuyForOrderCenter.action?wids=2600210&amp;nums=1" class="btn-primary J-btn" target="_blank" onclick="log(&quot;gz_item&quot;, &quot;gz_detail&quot;,&quot;02&quot;,&quot;tjpj_ycgm_ljgm&quot;, pageConfig.getAccSelectedSkus(),&quot;main&quot;)"></a>
                </div>
                <i class="equal">=</i>
            </div>
        </div>
    </div>
</div>

<!--详情展示 第二部分-->
<div class="w-second">
    <div class="aside">
        <div class="m m-aside popbox" id="popbox">
            <div class="popbox-inner" data-fixed="pro-detail-hd-fixed">
                <div class="mt">
                    <h3>
                        <a href="//huawei.jd.com" target="_blank" title="${product.dianpu_name}" clstag="shangpin|keycount|product|dianpuname2_华为官方旗舰店">
                            <!--1.8 店铺名-->
                            ${product.dianpu_name}
                        </a>
                    </h3>
                    <div class="im-wrap clearfix">
                        <a class="J-popbox-im im" title="联系供应商" data-code="1" data-name="联系供应商" data-seller="联系供应商" data-domain="chat.jd.com" clstag="shangpin|keycount|product|dongdong2_1"><div data-domain="chat.jd.com" data-code="1" data-seller="华为官方旗舰店" title="联系供应商" class="im gys-im"><i class="sprite-im"></i></div></a>
                    </div>
                    <span class="arrow"></span>
                </div>
                <div class="mc">
                    <div class="pop-score-summary">
                        <div class="btns">
                            <a href="//huawei.jd.com" target="_blank" class="btn-def enter-shop J-enter-shop" clstag="shangpin|keycount|product|jindian2">
                                <i class="sprite-enter"></i>
                                <span>进店逛逛</span>
                            </a>
                            <a href="#none" class="btn-def follow-shop J-follow-shop" data-vid="1000004259" clstag="shangpin|keycount|product|guanzhu2">
                                <i class="sprite-follow"> </i>
                                <span>关注店铺</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="m m-aside" id="seek" clstag="shangpin|keycount|product|fanxiangdaogou_1">
            <div class="mt">
                <h3>关于手机，你可能在找</h3>
            </div>
            <div class="mc">
                <ul class="tag-list">
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e5%ae%89%e5%8d%93%ef%bc%88Android%ef%bc%89&amp;enc=utf-8&amp;cid3=655" target="_blank">安卓（Android）</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%205.5-5.1%e8%8b%b1%e5%af%b8&amp;enc=utf-8&amp;cid3=655" target="_blank">5.5-5.1英寸</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e6%8b%8d%e7%85%a7%e7%a5%9e%e5%99%a8&amp;enc=utf-8&amp;cid3=655" target="_blank">拍照神器</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e5%8f%8c%e5%8d%a1%e5%8f%8c%e5%be%85&amp;enc=utf-8&amp;cid3=655" target="_blank">双卡双待</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%203GB&amp;enc=utf-8&amp;cid3=655" target="_blank">3GB</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e8%81%94%e9%80%9a4G&amp;enc=utf-8&amp;cid3=655" target="_blank">联通4G</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e7%94%b5%e4%bf%a14G&amp;enc=utf-8&amp;cid3=655" target="_blank">电信4G</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e7%a7%bb%e5%8a%a84G%2f%e8%81%94%e9%80%9a4G%2f%e7%94%b5%e4%bf%a14G&amp;enc=utf-8&amp;cid3=655" target="_blank">移动4G/联通4G/电信4G</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e7%a7%bb%e5%8a%a84G&amp;enc=utf-8&amp;cid3=655" target="_blank">移动4G</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%2032GB&amp;enc=utf-8&amp;cid3=655" target="_blank">32GB</a>
                    </li>
                    <li>
                        <a href="//search.jd.com/Search?keyword=%e5%8d%8e%e4%b8%ba%ef%bc%88HUAWEI%ef%bc%89%20%e5%85%ab%e6%a0%b8&amp;enc=utf-8&amp;cid3=655" target="_blank">八核</a>
                    </li>
                </ul>
            </div>
        </div>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <ins class="ELazy-holder ELazy-holder8"></ins>
        <div style="display: block;" class="m m-aside hide" id="view-buy" clstag="shangpin|keycount|product|darenxuangou_1">
            <div class="mt">
                <h3>达人选购</h3>
            </div>
            <div class="mc">
                <ul class="plist">
                    <li class="fore1" data-clk="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTIwNzk0NF8xODAxJnRvPWh0dHA6Ly9pdGVtLmpkLmNvbS8zMTY5MTE4Lmh0bWw&amp;log=Pg8q9L4fiyaVtAm8y6Uwxpyb1RLuDrmVxm4R4vfTHQMegvIrsOHCiRw3vcOasjYTSqFegEMTJEhbvye4mPBEilvWVXN0NQiFLC3fp93aunTORkKDbgYp36wwwLvYIRrbk8fazkUOHE4j59WEe378HYmzc75BzAhH1DmRU2uK_u56ZL_qWFoCcMwvtoGdn1UgXi4iwbYLgve1b2sXHJELXg1gn0a-h07UiUMIuiSBopUD6aG8GyNN6wpLh4w2I6vlw70ljJECHqcFYZFexjmlXzEBVkfKL9O9LZaEHXWK12E_7k2AyaY9vMeHoFUM5o-S&amp;v=404&amp;ru=http%3a%2f%2fmercury.jd.local%2flog.gif%3ft%3drec.000000%26v%3dsrc%3dmix$action%3d8$sku%3d2600210$csku%3d3169118$adposid%3d1801$adsid%3d355ea184-7b49-413c-97eb-2ed70b84079d" data-push="1">
                        <div class="p-img ac">
                            <a target="_blank" title="华为 P9 全网通 4GB+64GB版 金色 移动联通电信4G手机 双卡双待" href="//item.jd.com/3169118.html">
                                <img alt="华为 P9 全网通 4GB+64GB版 金色 移动联通电信4G手机 双卡双待" src="img/product/daren1.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" title="华为 P9 全网通 4GB+64GB版 金色 移动联通电信4G手机 双卡双待" href="//item.jd.com/3169118.html">
                                华为 P9 全网通 4GB+64GB版 金色 移动联通电信4G手机 双卡双待
                            </a>
                        </div>
                        <div class="p-price">
                            <strong class="J-p-3169118">￥3688.00</strong>
                        </div>
                    </li>
                    <li class="fore2" data-clk="//mercury.jd.com/log.gif?t=rec.103001&amp;v=src=rec$action=1$reqsig=3382ce82e3c4c206ee3413893a98fd22741479b9$enb=1$sku=2600210$p=103001$pin=$uuid=1874010941$csku=2600240$index=0$st=0$adcli=$expid=0$im=&amp;rid=4952268588370059920&amp;ver=1&amp;sig=30108ec49e780d1118632963abac374d4805bc7c" data-push="2">
                        <div class="p-img ac">
                            <a target="_blank" title="华为 P9 plus 64GB 琥珀金 移动联通电信4G手机 双卡双待" href="//item.jd.com/2600240.html">
                                <img alt="华为 P9 plus 64GB 琥珀金 移动联通电信4G手机 双卡双待" src="img/product/daren2.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" title="华为 P9 plus 64GB 琥珀金 移动联通电信4G手机 双卡双待" href="//item.jd.com/2600240.html">华为 P9 plus 64GB 琥珀金 移动联通电信4G手机 双卡双待</a>
                        </div>
                        <div class="p-price"><strong class="J-p-2600240">￥3988.00</strong></div>
                    </li>
                    <li class="fore3" data-clk="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTIwNzk0NF8xODAxJnRvPWh0dHA6Ly9pdGVtLmpkLmNvbS8xMDA4MTA1MjgxNy5odG1s&amp;log=Pg8q9L4fiyaVtAm8y6Uwxpyb1RLuDrmVxm4R4vfTHQMegvIrsOHCiRw3vcOasjYTmLYTCQrptzUirUnMjp8UmIV41UTtATJI_6SJOSZn92_assr9O2uV7BkgCGHAhwEEoSzk05HBrgT6VMDidPWjD02wh1DmRkWjyv-5WMRBqSr_PJQPpFHbLRXUqGYzzmfPM_D-M2hv-jwETxciPjiUOMwLxAqNXdjfj0wQ4-1tXXwItSVWexDNkYcI7dTmzQEQQ7976qPaE4jJS9F_Ynri4aVzxmSOdusiPz7ly-NsNDqzCfh5hub93zpbZNXvf74_&amp;v=404&amp;ru=http%3a%2f%2fmercury.jd.local%2flog.gif%3ft%3drec.000000%26v%3dsrc%3dmix$action%3d8$sku%3d2600210$csku%3d10081052817$adposid%3d1801$adsid%3d355ea184-7b49-413c-97eb-2ed70b84079d" data-push="3">
                        <div class="p-img ac">
                            <a target="_blank" title="华为（HUAWEI）P8max  移动联通双4G手机 双卡双待 日晖金 (3GB RAM+32GB ROM)标配" href="//item.jd.com/10081052817.html">
                                <img alt="华为（HUAWEI）P8max  移动联通双4G手机 双卡双待 日晖金 (3GB RAM+32GB ROM)标配" src="img/product/daren3.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" title="华为（HUAWEI）P8max  移动联通双4G手机 双卡双待 日晖金 (3GB RAM+32GB ROM)标配" href="//item.jd.com/10081052817.html">华为（HUAWEI）P8max  移动联通双4G手机 双卡双待 日晖金 (3GB RAM+32GB ROM)标配</a></div>
                        <div class="p-price">
                            <strong class="J-p-10081052817">￥2049.00</strong>
                        </div>
                    </li>
                    <li class="fore4" data-clk="//mercury.jd.com/log.gif?t=rec.103001&amp;v=src=rec$action=1$reqsig=3382ce82e3c4c206ee3413893a98fd22741479b9$enb=1$sku=2600210$p=103001$pin=$uuid=1874010941$csku=2473905$index=2$st=0$adcli=$expid=0$im=&amp;rid=4952268588370059920&amp;ver=1&amp;sig=352d5904cbccd99805889d4409e8c75f75c985c5" data-push="4">
                        <div class="p-img ac">
                            <a target="_blank" title="OPPO R9 4GB+64GB内存版 玫瑰金 全网通4G手机 双卡双待" href="//item.jd.com/2473905.html">
                                <img alt="OPPO R9 4GB+64GB内存版 玫瑰金 全网通4G手机 双卡双待" src="img/product/daren3.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name"><a target="_blank" title="OPPO R9 4GB+64GB内存版 玫瑰金 全网通4G手机 双卡双待" href="//item.jd.com/2473905.html">OPPO R9 4GB+64GB内存版 玫瑰金 全网通4G手机 双卡双待</a></div>
                        <div class="p-price"><strong class="J-p-2473905">￥2499.00</strong></div>
                    </li>
                    <li class="fore5" data-clk="http://ccc.x.jd.com/dsp/nc?ext=Y2xpY2sueC5qZC5jb20vSmRDbGljay8_eHVpZD01MjAwNyZ4c2l0ZWlkPTIwNzk0NF8xODAxJnRvPWh0dHA6Ly9pdGVtLmpkLmNvbS8xMDI3ODIxOTQ5Mi5odG1s&amp;log=Pg8q9L4fiyaVtAm8y6Uwxpyb1RLuDrmVxm4R4vfTHQMegvIrsOHCiRw3vcOasjYTyLLJF7by_64y82LqikJ-GvE0B9z9miRU4pd0Er4rsViv6N6agmRaABXAumfrRdAZZKylh5T0setdVNcGUjziDb8lIYot2Jus8fSwRj1B9NPGyafZ56g6xlIIYLHMfot3wDwuABHtQtCjCHJ1-YY6IY_e7C7X9fQ9BaDLqtIlj4cQVEZdVxKv1aVD1XnJnb6bKcxblRROPi3ocsDaaHSI5iUNAhL9D8882Q-eAuGjlCZW2XjUI-cZ17hN06v9p2BT&amp;v=404&amp;ru=http%3a%2f%2fmercury.jd.local%2flog.gif%3ft%3drec.000000%26v%3dsrc%3dmix$action%3d8$sku%3d2600210$csku%3d10278219492$adposid%3d1801$adsid%3d355ea184-7b49-413c-97eb-2ed70b84079d" data-push="5">
                        <div class="p-img ac">
                            <a target="_blank" title="华为  P9  移动联通电信4G手机  双卡双待 玫瑰金 全网通(4GRAM+64GROM)标配" href="//item.jd.com/10278219492.html">
                                <img alt="华为  P9  移动联通电信4G手机  双卡双待 玫瑰金 全网通(4GRAM+64GROM)标配" src="img/product/daren3.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name"><a target="_blank" title="华为  P9  移动联通电信4G手机  双卡双待 玫瑰金 全网通(4GRAM+64GROM)标配" href="//item.jd.com/10278219492.html">华为  P9  移动联通电信4G手机  双卡双待 玫瑰金 全网通(4GRAM+64GROM)标配</a></div>
                        <div class="p-price"><strong class="J-p-10278219492">￥3688.00</strong></div>
                    </li>
                    <li class="fore6" data-clk="//mercury.jd.com/log.gif?t=rec.103001&amp;v=src=rec$action=1$reqsig=3382ce82e3c4c206ee3413893a98fd22741479b9$enb=1$sku=2600210$p=103001$pin=$uuid=1874010941$csku=2600242$index=4$st=0$adcli=$expid=0$im=&amp;rid=4952268588370059920&amp;ver=1&amp;sig=6bc959a1bfd8043abd6054965baba4cb362bc351" data-push="6">
                        <div class="p-img ac">
                            <a target="_blank" title="华为 G9 青春版 白色 移动联通电信4G手机 双卡双待" href="//item.jd.com/2600242.html">
                                <img alt="华为 G9 青春版 白色 移动联通电信4G手机 双卡双待" src="img/product/daren3.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name"><a target="_blank" title="华为 G9 青春版 白色 移动联通电信4G手机 双卡双待" href="//item.jd.com/2600242.html">华为 G9 青春版 白色 移动联通电信4G手机 双卡双待</a></div>
                        <div class="p-price"><strong class="J-p-2600242">￥1699.00</strong></div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="m m-aside" id="view-view" clstag="shangpin|keycount|product|seemore_1">
            <div class="mt">
                <h3>看了又看</h3>
            </div>
            <div class="mc">
                <ul class="plist">
                    <li class="fore1" data-clk="//mercury.jd.com/log.gif?t=rec.105000&amp;v=src=rec$action=1$reqsig=45e71a2ccef05c5c102d22ee2973d744d9bbd44$enb=1$sku=2600210$p=105000$pin=$uuid=1874010941$csku=10266797631$index=0$st=0$adcli=$expid=0$im=&amp;rid=2808726413692572166&amp;ver=1&amp;sig=55fd8ba11c5e40c6b0ec45caba06829ee76f3673" data-push="1">
                        <div class="p-img ac">
                            <a target="_blank" title="华为P9 手机 金色 全网通(4GB+64GB)标配" href="//item.jd.com/10266797631.html">
                                <img alt="华为P9 手机 金色 全网通(4GB+64GB)标配" src="img/product/look1.jpg" height="180" width="180">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" title="华为P9 手机 金色 全网通(4GB+64GB)标配" href="//item.jd.com/10266797631.html">
                                华为P9 手机 金色 全网通(4GB+64GB)标配
                            </a>
                        </div>
                        <div class="p-price">
                            <strong class="J-p-10266797631">￥3688.00</strong>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <div class="detail">
        <div class="ETab" id="detail">
            <div class="tab-main large" data-fixed="pro-detail-hd-fixed">
                <ul>
                    <li id="detail_li_1"  data-tab="trigger" data-anchor="#detail" clstag="shangpin|keycount|product|shangpinjieshao_1">
                        商品介绍
                    </li>
                    <li id="detail_li_2" data-tab="trigger" data-anchor="#detail" clstag="shangpin|keycount|product|pcanshutab">
                        规格与包装
                    </li>
                    <li id="detail_li_3" data-tab="trigger" data-anchor="#detail" clstag="shangpin|keycount|product|psaleservice">
                        售后保障
                    </li>
                    <li id="detail_li_4" data-tab="trigger" data-offset="38" data-anchor="#comment" clstag="shangpin|keycount|product|shangpinpingjia_1">
                        商品评价
                        (16976)
                    </li>
                    <li id="detail_li_5" data-tab="trigger" data-offset="38" data-anchor="#club" clstag="shangpin|keycount|product|shequ">
                        手机社区
                        <sup>
                            new<b>◤</b>
                        </sup>

                    </li>
                </ul>
                <div class="extra">
                    <div class="item addcart-mini">
                        <div data-role="drop" class="J-addcart-mini EDropdown">
                            <div class="inner">
                                <div class="head" data-drop="head">
                                    <a id="InitCartUrl-mini" class="btn-primary" href="//cart.jd.com/gate.action?pid=2600210&amp;pcount=1&amp;ptype=1" clstag="shangpin|keycount|product|gouwuchexuanfu_1">

                                    </a>
                                </div>
                                <div class="content hide" data-drop="content">
                                    <div class="mini-product-info">
                                        <div class="p-img fl">
                                            <img src="//img10.360buyimg.com/n4/jfs/t1918/169/2366995781/85503/38fffc90/57057f7eN936fd6c0.jpg" data-img="1" height="100" width="100">
                                        </div>
                                        <div class="p-info lh">
                                            <div class="p-name">华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待</div>
                                            <div class="p-price">
                                                <strong class="J-p-2600210">￥3188.00</strong> <span>X <span class="J-buy-num"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item nav-qrcode">
                        <div data-role="drop" class="J-nav-qrcode EDropdown" data-url="http://cd.jd.com/qrcode?skuId=2600210&amp;location=3&amp;isWeChatStock=2">
                            <div class="inner">
                                <div class="head" data-drop="head">
                                    <span class="icon-qr"></span>
                                    <span class="text">扫一扫下单</span>
                                    <span class="arrow arr-close"></span>
                                </div>
                                <div class="content ac hide" data-drop="content"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-con" id="tab-con">
                <div class="detail_li_1" data-tab="item" class="hide" style="display: block;">
                    <div class="p-parameter">
                        <ul class="parameter1 p-parameter-list">
                            <li class="fore0">
                                <i class="i-phone"></i>
                                <div class="detail">
                                    <p title="5.2英寸">屏幕尺寸：5.2英寸</p>
                                    <p title="1920×1080(FHD,1080P)">分辨率：1920×1080(FHD,1080P)</p>
                                </div>
                            </li>
                            <li class="fore1">
                                <i class="i-camera"></i>
                                <div class="detail">
                                    <p title="双1200万像素">后置摄像头：双1200万像素</p>
                                    <p title="800万像素">前置摄像头：800万像素</p>
                                </div>
                            </li>
                            <li class="fore2">
                                <i class="i-cpu"></i>
                                <div class="detail">
                                    <p title="八核">核&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数：八核</p>
                                    <p title="4*Cortex A72 2.5GHz + 4*Cortex A53 1.8GHz + 微智核I5">频&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;率：4*Cortex A72 2.5GHz + 4*Cortex A53 1.8GHz + 微智核I5</p>
                                </div>
                            </li>
                            <li class="fore3">
                                <i class="i-network"></i>
                                <div class="detail">
                                    <p title="4G：移动/联通/电信">4G：移动/联通/电信</p>
                                    <p title="3G：移动(TD-SCDMA)/联通(WCDMA)/电信(CDMA2000)">3G：移动(TD-SCDMA)/联通(WCDMA)/电信(CDMA2000)</p>
                                    <p title="2G：移动/联通(GSM)/电信(CDMA)">2G：移动/联通(GSM)/电信(CDMA)</p>
                                </div>
                            </li>
                        </ul>
                        <ul id="parameter-brand" class="p-parameter-list">
                            <li title="华为（HUAWEI）">品牌： <a href="//list.jd.com/list.html?cat=9987,653,655&amp;ev=exbrand_8557" clstag="shangpin|keycount|product|pinpai_1" target="_blank">华为（HUAWEI）</a>
                                <a href="#none" class="follow-brand btn-def" clstag="shangpin|keycount|product|guanzhupinpai"><b>♥</b>关注</a>
                            </li>
                        </ul>
                        <ul class="parameter2 p-parameter-list">
                            <li title="华为P9">商品名称：华为P9</li>
                            <li title="2600210">商品编号：2600210</li>
                            <li title="0.52kg">商品毛重：0.52kg</li>
                            <li title="中国大陆">商品产地：中国大陆</li>
                            <li title="安卓（Android）">系统：安卓（Android）</li>
                            <li title="3GB">运行内存：3GB</li>
                            <li title="双卡双待，拍照神器">热点：双卡双待，拍照神器</li>
                            <li title="1000-1600万">像素：1000-1600万</li>
                            <li title="32GB">机身内存：32GB</li>
                            <li title="金色">机身颜色：金色</li>
                        </ul>
                        <p class="more-par">
                            <a href="#product-detail" class="J-more-param">
                                更多参数
                                <s class="txt-arr">&gt;&gt;</s>
                            </a>
                        </p>
                    </div>
                    <div id="quality-life" class="quality-life" style="display:none" clstag="shangpin|keycount|product|pinzhishenghuo">
                        <div class="q-logo">
                            <img src="//img20.360buyimg.com/da/jfs/t2077/314/2192172483/11044/f861504a/56ca6792N64e5eafc.png" alt="品质生活">
                        </div>
                        <ul class="quality-icon">
                            <li class="J-ql-iframe ql-ico-1" data-type="1" data-text="质量承诺" style="display:none" data-title="质量承诺" clstag="shangpin|keycount|product|zhijianchengnuo">
                                <a href="#none"><i></i><span>质量承诺</span></a>
                            </li>
                            <li class="ql-ico-5" data-type="5" data-text="耐久性标签" style="display:none" clstag="shangpin|keycount|product|naijiuxingbiaoqian">
                                <a href="#none"><i></i><span>耐久性标签</span></a>
                            </li>
                            <li class="ql-ico-3" data-type="3" data-text="吊牌" style="display:none" clstag="shangpin|keycount|product|diaopai">
                                <a href="#none"><i></i><span>吊牌</span></a>
                            </li>
                            <li class="ql-ico-4" data-type="4" data-text="质检报告" style="display:none" clstag="shangpin|keycount|product|zhijianbaogao">
                                <a href="#none"><i></i><span>质检报告</span></a>
                            </li>
                            <li class="ql-ico-2" data-type="2" data-text="3C证书" style="display:none" clstag="shangpin|keycount|product|3czhengshu">
                                <a href="#none"><i></i><span>3C证书</span></a>
                            </li>
                            <li class="ql-ico-10" data-type="10" data-text="商家资质" style="display:none" clstag="shangpin|keycount|product|shangjiazizhi">
                                <a href="#none"><i></i><span>商家资质</span></a>
                            </li>
                        </ul>
                    </div>
                    <div id="J-detail-banner">
                        <a id="p-cat-insert" target="_blank" title="" href="//c-nfa.jd.com/adclick?keyStr=6PQwtwh0f06syGHwQVvRO2qQjwLJ5GHB8CWaVmO7akxE4PBdL2U9aYjtXf0gd37ks791zJuQs2q4I2lpGNOzQXTATnk9jBVFDZYzHmV599qbHQ36d6y3t8yoVvSI+An19VEKOHcOEXc2lnu6+dkNENvTfOZeuv98oVU2wNtaF3R6o+nilMCgFuE5hWYmLeKZAkuOIdHLRtkW/q4CIdzM/gKe2acHG0Ajuj9L8JXxidE+hmSpgLz9xmR1xEiObDPEY2cXhMASnNvmSUyLnxgFsxMv49nQdfWafuMVCtVmz8qXOlcppL6VE6XAjxQTKJJ8WOo1bdnPYgppNB+nDWfC8A==&amp;cv=2.0&amp;url=//sale.jd.com/act/yuteUJZbmQV.html">
                            <img alt="" src="img/product/display1.gif" width="990">
                        </a>
                    </div>                                                                        <div class="detail-content clearfix" data-name="z-have-detail-nav">
                    <div class="detail-content-wrap">
                        <div class="detail-correction">
                            <b></b>如果您发现商品信息不准确，
                            <a href="//club.360buy.com/jdvote/skucheck.aspx?skuid=2600210&amp;cid1=9987&amp;cid2=653&amp;cid3=655" target="_blank" clstag="shangpin|keycount|product|jiucuo_1">欢迎纠错</a>
                        </div>

                        <div class="detail-content-item">
                            <div id="activity_header" clstag="">
                                <div align="center">
                                    <a href="//huishou.jd.com" target="_blank">
                                        <img src="img/product/display2.jpg" class="" alt="" usemap="#Map" border="0">
                                    </a>
                                </div>
                                <div style="text-align: center;">
                                    <!--<a href="//sale.jd.com/act/UujsP8TXlxgyt.html" target="_blank">
                                			<img src="//misc.360buyimg.com/lib/img/e/blank.gif" class="ELazy-loading" data-lazyload="//img30.360buyimg.com/jgsq-productsoa/jfs/t2692/363/2201923013/121741/a125609c/575d335eN465442ba.jpg" alt="">
                                		</a>-->
                                </div>
                            </div>
                            <div id="J-detail-content">
                                <table align="center" width="750">
                                    <tbody><tr>
                                        <!--<td>
                                				<img src="//misc.360buyimg.com/lib/img/e/blank.gif" class="ELazy-loading" data-lazyload="//img30.360buyimg.com/jgsq-productsoa/jfs/t2896/362/2356174785/38877/a763b0ad/57625e11N4169403b.jpg" usemap="#Mapuyr" alt="" border="0" height="150" width="750">
                                			</td>-->
                                    </tr>
                                    </tbody>
                                </table>
                                <map name="Mapuyr">
                                    <area shape="rect" coords="5,3,748,147" href="//sale.jd.com/act/dDActkZ0pCXQ.html" target="_blank">
                                </map>
                                <div class="content_tpl">
                                    <div class="formwork">
                                        <div class="formwork_img">
                                            <a href="//group.jd.com/thread/20000121/21019948/20000338.htm" target="_blank">
                                                <!--<img src="//misc.360buyimg.com/lib/img/e/blank.gif" class="ELazy-loading" data-lazyload="//img30.360buyimg.com/jgsq-productsoa/jfs/t2875/347/1836161036/203091/58e773d5/574cf099Nbd1d7c0b.png" alt=""></a><br></div><div class="formwork_img">
                                						<img src="//misc.360buyimg.com/lib/img/e/blank.gif" class="ELazy-loading" data-lazyload="//img30.360buyimg.com/jgsq-productsoa/jfs/t2854/275/2291519742/789456/6f3827c4/575f9883N7787bda7.jpg" alt="">
                                						<br>-->
                                        </div>
                                    </div>
                                </div>
                                <br>
                            </div><!-- #J-detail-content -->
                            <div id="activity_footer" clstag=""></div>
                        </div>
                    </div>
                    <div id="J-detail-nav" class="detail-content-nav">
                        <ul id="J-detail-content-tab" class="detail-content-tab"></ul>
                    </div>
                </div>
                    <div class="clb"></div>
                </div>
                <div class="detail_li_2" data-tab="item" class="hide" style="display: none;">
                    <div class="detail-correction">
                        <b></b>如果您发现商品信息不准确，
                        <a href="//club.jd.com/jdvote/skucheck.aspx?skuid=2600210&amp;cid1=9987&amp;cid2=653&amp;cid3=655" target="_blank" clstag="shangpin|keycount|product|jiucuo_1">欢迎纠错
                        </a>
                    </div>
                    <div class="Ptable">
                        <div class="Ptable-item">
                            <h3>主体</h3>
                            <dl>
                                <dt>品牌</dt><dd>华为（HUAWEI）</dd>
                                <dt>型号</dt><dd>EVA-AL00</dd>
                                <dt>颜色</dt><dd>金色</dd>
                                <dt>上市年份</dt><dd>2016年</dd>
                                <dt>上市月份</dt><dd>4月</dd>
                                <dt>输入方式</dt><dd>触控</dd>
                                <dt>智能机</dt><dd>是</dd>
                                <dt>操作系统</dt><dd>安卓（Android）</dd>
                                <dt>操作系统版本</dt><dd>Android 6.0</dd>
                                <dt>CPU品牌</dt><dd>海思</dd>
                                <dt>CPU型号</dt><dd>麒麟955(HUAWEI Kirin 955)</dd>
                                <dt>CPU频率</dt><dd>4*Cortex A72 2.5GHz + 4*Cortex A53 1.8GHz + 微智核I5</dd>
                                <dt>CPU核数</dt><dd>八核</dd>
                                <dt>GPU</dt><dd>Mali T880</dd>
                                <dt>运营商标志或内容</dt><dd>无</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>网络</h3>
                            <dl>
                                <dt>4G网络制式</dt><dd>移动4G/联通4G/电信4G</dd>
                                <dt>3G网络制式</dt><dd>移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G(CDMA2000)</dd>
                                <dt>2G网络制式</dt><dd>移动2G/联通2G(GSM)/电信2G(CDMA)</dd>
                                <dt>网络频率</dt><dd>支持移动/联通/电信 4G+/4G/3G/2G</dd>
                                <dt>双卡机类型</dt><dd>双卡双待双通</dd>
                                <dt>其它</dt><dd>不支持电信卡+电信卡</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>存储</h3>
                            <dl>
                                <dt>机身内存</dt><dd>32GB ROM</dd>
                                <dt>运行内存</dt><dd>3GB RAM</dd>
                                <dt>储存卡类型</dt><dd>MicroSD(TF)</dd>
                                <dt>最大存储扩展</dt><dd>128GB</dd>
                                <dt>可用空间</dt><dd>（备注：可使用的内存容量小于此值，因为手机软件占用的空间）</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>显示</h3>
                            <dl>
                                <dt>屏幕尺寸</dt><dd>5.2英寸</dd>
                                <dt>触摸屏</dt><dd>电容屏，多点触控</dd>
                                <dt>分辨率</dt><dd>1920×1080(FHD,1080P)</dd>
                                <dt>屏幕色彩</dt><dd>1670万色</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>感应器</h3>
                            <dl>
                                <dt>GPS模块</dt><dd>支持</dd>
                                <dt>重力感应</dt><dd>支持</dd>
                                <dt>光线感应</dt><dd>支持</dd>
                                <dt>陀螺仪</dt><dd>支持</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>摄像功能</h3>
                            <dl>
                                <dt>后置摄像头</dt><dd>双1200万像素</dd>
                                <dt>前置摄像头</dt><dd>800万像素</dd>
                                <dt>传感器类型</dt><dd>CMOS</dd>
                                <dt>闪光灯</dt><dd>支持</dd>
                                <dt>变焦模式</dt><dd>数码变焦</dd>
                                <dt>自动对焦</dt><dd>支持</dd>
                                <dt>照片分辨率</dt><dd>最大支持3968×2976像素照片拍摄</dd>
                                <dt>其他性能</dt><dd>1200万双摄像头，F2.2光圈，莱卡认证镜头，备注：不同拍照模式的照片像素会有差异</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>娱乐功能</h3>
                            <dl>
                                <dt>音乐播放</dt><dd>支持</dd>
                                <dt>视频播放</dt><dd>支持</dd>
                                <dt>录音</dt><dd>支持</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>传输功能</h3>
                            <dl>
                                <dt>Wi-Fi</dt><dd>支持</dd>
                                <dt>蓝牙</dt><dd>支持</dd>
                            </dl>
                        </div>
                        <div class="Ptable-item">
                            <h3>其他</h3>
                            <dl>
                                <dt>SIM卡尺寸</dt><dd>Nano SIM卡+Nano SIM卡（和SD卡共槽位）</dd>
                                <dt>电池类型</dt><dd>聚合物电池</dd>
                                <dt>电池容量（mAh）</dt><dd>3000mAh（典型值)</dd>
                                <dt>电池更换</dt><dd>不支持</dd>
                                <dt>耳机接口</dt><dd>3.5mm</dd>
                                <dt>机身尺寸（mm）</dt><dd>145mm * 70.9mm * 6.95mm (长*宽*高)</dd>
                                <dt>机身重量（g）</dt><dd>约144g（含电池）</dd>
                                <dt>其他</dt><dd>Nano SIM卡；卡槽1（内卡槽）、卡槽2（外卡槽）可任意切换为主卡、副卡。卡槽2（外卡槽）支持Nano SIM和microSD二选一</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="package-list">
                        <h3>包装清单</h3>
                        <p>手机(电池(内置) x 1、中式充电器 x 1、数据线(Type-C头) x 1、半入耳式线控耳机 x 1、点纹透明保护壳 x 1、快速指南  x 1、华为手机三包凭证 x 1、取卡针 x 1、金卡会员卡 x 1</p>
                    </div>
                </div>
                <div class="detail_li_3"  data-tab="item" class="hide" style="display: none;">
                    <!--售后保障-->
                    <div class="m m-content guarantee" id="guarantee">
                        <div class="mt">
                            <h3>售后保障</h3>
                        </div>
                        <div class="mc">
                            <div class="item-detail item-detail-copyright">
                                <div class="serve-agree-bd">
                                    <dl>
                                        <dt>
                                            <i class="goods"></i>
                                            <strong>厂家服务</strong>
                                        </dt>
                                        <dd>
                                            本产品全国联保，享受三包服务，质保期为：一年质保<br>
                                            如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br>
                                            (注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。)
                                            您可以查询本品牌在各地售后服务中心的联系方式，
                                            <a target="_blank" href="http://www.huawei.com/cn/">请点击这儿查询......</a><br><br>
                                            品牌官方网站：
                                            <a target="_blank" href="http://www.huawei.com/cn/">http://www.huawei.com/cn/</a><br>
                                            售后服务电话：400-830-8300
                                        </dd>

                                        <dt>
                                            <i class="goods"></i>
                                            <strong>京东承诺</strong>
                                        </dt>
                                        <dd>
                                            京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br>
                                            注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                                        </dd>

                                        <dt>
                                            <i class="goods"></i><strong>正品行货</strong>
                                        </dt>
                                        <dd>
                                            京东商城向您保证所售商品均为正品行货，京东自营商品开具机打发票或电子发票。</dd>
                                        <dt>
                                            <i class="unprofor"></i><strong>全国联保</strong></dt>
                                        <dd>
                                            凭质保证书及京东商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由京东联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。京东商城还为您提供具有竞争力的商品价格和<a href="//help.jd.com/help/question-892.html" target="_blank">运费政策</a>，请您放心购买！
                                            <br><br>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                                        </dd>
                                        <dt>
                                            <i class="no-worries"></i>
                                            <strong>无忧退换货</strong>
                                        </dt>
                                        <dd class="no-worries-text">
                                            客户购买京东自营商品7日内（含7日，自客户收到商品之日起计算），在保证商品完好的前提下，可无理由退货。（部分商品除外，详情请见各商品细则）
                                        </dd>
                                    </dl>
                                </div>

                                <div id="state">
                                    <strong>权利声明：</strong><br>京东上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是京东重要的经营资源，未经许可，禁止非法转载使用。
                                    <p><b>注：</b>本站商品信息均来自于合作方，其真实性、准确性和合法性由信息拥有者（合作方）负责。本站不提供任何保证，并不承担任何法律责任。</p>
                                    <br>
                                    <strong>价格说明：</strong><br><p></p>
                                    <p><b>京东价：</b>京东价为商品的销售价，是您最终决定是否购买商品的依据。</p>
                                    <p><b>划线价：</b>商品展示的划横线价格为参考价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在京东平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>
                                    <p><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>
                                    <p><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="detail_li_4" data-tab="item" class="hide" style="display: none;">
                    <!--商品评价-->
                    <p>商品评价</p>
                </div>
                <div class="detail_li_5" data-tab="item" class="hide" style="display: none;">
                    <!--手机社区-->
                    <p>手机社区</p>
                </div>
            </div>
        </div>


    </div>

    <!--详情部分结束-->

    <!--尾部开始-->
    <div class="foot">
        <div class="foot-first"></div>
        <div class="foot-second"></div>
    </div>
    <!--尾部结束-->


    <script src="js/jquery-2.1.4.js"></script>
    <script src="js/bootstrap.js"></script>

    <script type="text/javascript">
        (function() {
            var $ddi = $("#categorys-dd-inner"),
                $ddid = $ddi.find("div"),
                $ddr = $("#category-dorpdown-layer"),
                $ddri = $ddr.find(".item-sub"),
                index = 0,
                $ddrr = $ddr.find("#category-item-" + index),
                id = 0,
                $dt = $("#category-dt"),
                $dd_inner = $(".dd .dd-inner"),
                $xialakuang = $(".xialakuang"),
                $head = $("#head");


            $ddi.addClass("add-category-none");

            $dt.hover(function(){

                $ddi.removeClass("add-category-none");
                $ddi.addClass("add-category-block");
                //鼠标进入左侧栏的一项
                $ddid.mouseenter(function() {
                    $ddrr.css("display", "none"),
                        $ddrr.removeClass("hover"),
                        $(this).addClass("hover"),
                        index = $(this).data("index"),
                        $ddrr = $ddr.find("#category-item-" + index),
                        $ddrr.css("display", "block"),
                        $ddrr.addClass("hover");
                });
                //鼠标离开左侧栏的一项
                $ddid.mouseleave(function() {
                    index = $(this).data("index");
                    $(this).removeClass("hover");

                });

                $ddi.mouseleave(function(){
                    $ddi.removeClass("add-category-block");
                    $ddi.addClass("add-category-none");
                })
            });


            $xialakuang.css("display","none");
            $head.hover(function(){
                $xialakuang.css("display","block");
            },function(){
                $xialakuang.css("display","none");
            });






            /*小图前后翻 实现代码*/
            var page = 1;
            var i = 5; //每版放4个图片

            var $v_show = $("#spec-list"); //寻找到“视频内容展示区域”
            var $v_content = $("#spec_animate"); //寻找到“视频内容展示区域”外围的DIV元素  spec_animate
            var v_width = $v_content.width() ;
            var len = $v_show.find("li").length;
            var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数

            //向后 按钮
            $("#spec-backward").click(function(){    //绑定click事件
                if( !$v_show.is(":animated") ){    //判断“视频内容展示区域”是否正在处于动画
                    if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
                        $v_show.animate({ left : '0px'}, "slow"); //通过改变left值，跳转到第一个版面
                        page = 1;
                    }else{
                        $v_show.animate({ left : '-='+v_width }, "slow");  //通过改变left值，达到每次换一个版面
                        page++;
                    }
                }

            });

            /*向前按钮*/
            $("#spec-forward").click(function(){
                if( !$v_show.is(":animated") ){    //判断“视频内容展示区域”是否正在处于动画
                    if( page == 1 ){  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
                        $v_show.animate({ left : '-='+v_width*(page_count-1) }, "slow");
                        page = page_count;
                    }else{
                        $v_show.animate({ left : '+='+v_width }, "slow");
                        page--;
                    }
                }

            });



            /*大图片 悬浮时轮换*/
            var $big_picture = $("#spec-n1");
            <!--1.8 产品大图-->
            $big_picture.css({"background-image":"url(img/productImage/${product.detail_large_img})",
                    'background-repeat':'no-repeat',
                    'background-size':'100% 100%'
            })
            $(".tel img").hover(function(){
                var id = this.getAttribute("id");
                $big_picture.css({"background-image":"url("+$(this).attr('src')+")",
                    'background-repeat':'no-repeat',
                    'background-size':'100% 100%'
                });
            })


            /*商品详情部分 商品介绍 这一块 切换*/
            var $datail_li = $("#detail ul li");

            //一开始 商品介绍 四个字 显示
            $("#detail_li_1").addClass("add-detail-current");

            //一开始 全部 显示
            //$("#tab-con .detail_li_1").removeClass("hide");
            $("#tab-con .detail_li_1").css("display","block");
            $("#tab-con .detail_li_2").css("display","block");
            $("#tab-con .detail_li_3").css("display","block");
            $("#tab-con .detail_li_4").css("display","block");
            $("#tab-con .detail_li_5").css("display","block");

            $datail_li.click(function(e){
                if(e.target==$("#detail_li_2")[0]){
                    $("#detail_li_2").addClass("add-detail-current");
                    $("#detail ul *").not("#detail_li_2").each(function() {
                        $(this).removeClass("add-detail-current");
                    });

                    //下面的具体内容切换
                    //$("#tab-con .detail_li_2").removeClass("hide");
                    $("#tab-con .detail_li_2").css("display","block");
                    $("#tab-con .detail_li_1").css("display","none");
                    $("#tab-con .detail_li_3").css("display","block");
                    $("#tab-con .detail_li_4").css("display","block");
                    $("#tab-con .detail_li_5").css("display","block");

                }else if(e.target==$("#detail_li_3")[0]){
                    $("#detail_li_3").addClass("add-detail-current");
                    $("#detail ul *").not("#detail_li_3").each(function() {
                        $(this).removeClass("add-detail-current");
                    });

                    //下面的具体内容切换
                    $("#tab-con .detail_li_3").css("display","block");
                    $("#tab-con .detail_li_4").css("display","block");
                    $("#tab-con .detail_li_5").css("display","block");
                    $("#tab-con .detail_li_1").css("display","none");
                    $("#tab-con .detail_li_2").css("display","none");

                }else if(e.target==$("#detail_li_4")[0]){
                    $("#detail_li_4").addClass("add-detail-current");
                    $("#detail ul *").not("#detail_li_4").each(function() {
                        $(this).removeClass("add-detail-current");
                    });

                    //下面的具体内容切换
                    $("#tab-con .detail_li_4").css("display","block");
                    $("#tab-con .detail_li_5").css("display","block");
                    $("#tab-con .detail_li_1").css("display","none");
                    $("#tab-con .detail_li_2").css("display","none");
                    $("#tab-con .detail_li_3").css("display","none");

                }else if(e.target==$("#detail_li_5")[0]){
                    $("#detail_li_5").addClass("add-detail-current");
                    $("#detail ul *").not("#detail_li_5").each(function() {
                        $(this).removeClass("add-detail-current");
                    });

                    //下面的具体内容切换
                    $("#tab-con .detail_li_5").css("display","block");
                    $("#tab-con .detail_li_1").css("display","none");
                    $("#tab-con .detail_li_2").css("display","none");
                    $("#tab-con .detail_li_3").css("display","none");
                    $("#tab-con .detail_li_4").css("display","none");

                }else{
                    $("#detail_li_1").addClass("add-detail-current");
                    $("#detail ul *").not("#detail_li_1").each(function() {
                        $(this).removeClass("add-detail-current");
                    });

                    //下面的具体内容切换
                    $("#tab-con .detail_li_1").css("display","block");
                    $("#tab-con .detail_li_2").css("display","block");
                    $("#tab-con .detail_li_3").css("display","block");
                    $("#tab-con .detail_li_4").css("display","block");
                    $("#tab-con .detail_li_5").css("display","block");
                }
            })




        })();



    </script>

</body>

</html>