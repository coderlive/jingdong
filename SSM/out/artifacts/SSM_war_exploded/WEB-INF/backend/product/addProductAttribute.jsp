<%@ page language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>添加商品属性</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">

    <link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>

    <style type="text/css">

        body {
            background-color: #F9F9F9;
        }

        div.centerDiv {
            height: 100%;
            /*background-color: yellow;*/

        }

        label {
            margin-right: 50px;
            font: 16px/100% Arial, Verdana, "宋体";
        }

        /*bootstrap 按钮样式*/
        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-success {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .inputDiv {
            margin-bottom: 15px;
        }
        .jdInput {
            padding-left: 10px;
        }

        .myFormDiv {
            width: 400px;
            /*background-color: blue;*/
            position: relative;
            top: 100px;
            left: 280px;
        }

        .myFormLabel {
            font-size: 18px;
            font-weight: bold;
        }

        .addCategoryBtn {
            position: absolute;
            right: 89px;
            margin-top: 20px;
        }

        .breadcrumb a {
            color: #193449 !important;
            font-weight: bold;
        }

        .selectCategory {
            width: 186px;
            height: 23px;
            padding-left: 10px;
            position: relative;
            right: 3px;
        }
    </style>


</head>

<body>


<div class="centerDiv">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">商品管理</a></li>
            <li><a href="#">添加商品属性</a></li>
        </ul>
    </div>
    <div class="myFormDiv">
        <form action="attribute/addAttribute" method="post">
            <div class="inputDiv"><label class="myFormLabel">商品类型id</label><input type="text" class="jdInput"name="cid" placeholder="请输入商品类型id"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品属性1</label><input type="text" class="jdInput"name="attributes" placeholder="请输入商品属性1"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品属性2</label><input type="text" class="jdInput"name="attributes" placeholder="请输入商品属性2"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品属性3</label><input type="text" class="jdInput"name="attributes" placeholder="请输入商品属性3"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品属性4</label><input type="text" class="jdInput"name="attributes" placeholder="请输入店铺属性4"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品属性5</label><input type="text" class="jdInput"name="attributes" placeholder="请输入商品属性5"/></div>

            <input type="submit" class="btn btn-success addCategoryBtn" value="添加商品属性" />
        </form>
    </div>

</div>


<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="js/network.js"></script>

</body>
</html>
