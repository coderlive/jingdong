<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.vo.Orders" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>s
<head>
    <base href="<%=basePath%>">

    <title>添加一级商品种类</title>

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
            top: 183px;
            left: 280px;
		}

		.myFormLabel {
			font-size: 18px;
			font-weight: bold;
		}

        .addCategoryBtn {
            position: absolute;
            right: 52px;
            margin-top: 20px;
        }

        .breadcrumb a {
            color: #193449 !important;
            font-weight: bold;
        }
    </style>


</head>

<body>


<div class="centerDiv">
    <%
        Orders order = (Orders)request.getAttribute("order");
        String searchCondition = request.getParameter("searchCondition");
        String requestPage = request.getParameter("requestPage");
    %>
	<div class="myFormDiv">
        <form action="order/updateOrder" method="post">
            <input type="hidden" name="requestPage" value="<%=requestPage%>"/>
            <!--0.8 搜索功能 加入隐藏域searchCondition-->
            <input type="hidden" name="searchCondition" value="<%=searchCondition%>"/>
            <input type="hidden" name="oid" value="<%=order.getOid()%>"/>
            <div class="inputDiv"><label class="myFormLabel">订单编号</label><input type="text" class="jdInput"name="orders_no" value="<%=order.getOrders_no()%>"/></div>
            <div class="inputDiv"><label class="myFormLabel">订单时间</label><input type="text" class="jdInput"name="order_time" value="<%=order.getOrder_time()%>"/></div>
            <div class="inputDiv"><label class="myFormLabel">订单地址</label><input type="text" class="jdInput"name="received_address" value="<%=order.getReceived_address()%>"/></div>
            <div class="inputDiv"><label class="myFormLabel">订单总价</label><input type="text" class="jdInput"name="all_price" value="<%=order.getAll_price()%>"/></div>
            <div class="inputDiv"><label class="myFormLabel">订单状态</label><input type="text" class="jdInput"name="status" value="<%=order.getStatus()%>"/></div>
            <div class="inputDiv"><label class="myFormLabel">用户编号</label><input type="text" class="jdInput"name="userid" value="<%=order.getUserid()%>"/></div>
            <input type="submit" class="btn btn-success addCategoryBtn" value="修改订单" />
        </form>
	</div>

</div>


<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
