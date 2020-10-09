<%@ page language="java" import="java.util.*" import="vo.Orders,page.PageInfo"
         contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>第一个Bootstrap程序</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="css/jQueryConfirm/jquery-confirm.css"/>
    <style type="text/css">
        body {
            background-color: #F9F9F9;
        }

        a:link {
            text-decoration: none;
        }


        tr.tableHead {
            background-color: #DCC16E;
            color: #ffffff;
        }

        tr.tableHead > th {
            text-align: center;
        }

        /*鼠标悬停的 当前行高亮*/
        /*table>tbody>tr:hover {
            background-color:#BAD0EF !important;
        }*/

        div.categoryTableDiv {
            width: 1060px;
            margin: 0px auto;
        }

        #categoryTable {
            position: relative;

        }

        .breadcrumb a {
            color: #193449 !important;
            font-weight: bold;
        }

		#categoryDiv {
			position:relative;
			/*background-color: yellowgreen;*/
			top: 150px;
		}

		div.pageDiv {
			position:absolute;
			right:50px;

		}

		/*一级商品种类搜索框*/
		#jdCategorySearch {
			width:500px;
			margin:0px auto;
			postion: relative;
			top: -50px;
		}
    </style>
</head>

<body>
<%
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<div>
    <ul class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">订单管理</a></li>
    </ul>
</div>


<div id="categoryDiv">
	<!--0.8 搜索功能 加入搜索框-->
	<form id="categoryForm2" action="OrderServlet?action=getPageByQuery" method="post">

		<div id="jdCategorySearch" class="input-group">
			<input type="search" id="searchCondition" name="searchCondition" placeholder="订单编号/用户编号" value='${requestScope.searchCondition}' class="form-control"/>

			<span class="input-group-btn">
				<input type="submit"  value="搜索" class="btn btn-default"/>
			</span>
		</div>

	</form>
	<div class="text-center categoryTableDiv">

		<table id="categoryTable" class="table table-striped table-bordered table-hover">
			<thead>
			<tr class="tableHead">
				<th width="10%">订单编号</th>
				<th width="20%">订单生成时间</th>
				<th width="20%">订单生成地址</th>
				<th width="20%">订单总价</th>
				<th width="10%">订单状态</th>
				<th width="10%">用户编号</th>
				<th width="5%">操作</th>
				<th width="5%">操作</th>
			</tr>
			</thead>

			<tbody>

			<c:forEach items="${list}" var="orders">
				<tr>
					<td>${orders.orders_no}</td>
					<td>${orders.order_time}</td>
					<td>${orders.received_address}</td>
					<td>${orders.all_price}</td>
					<td><c:choose>
						<c:when test="${orders.status==0}">
							未付款
						</c:when>
						<c:when test="${orders.status==1}">
							已付款
						</c:when>
						<c:when test="${orders.status==2}">
							未收货
						</c:when>
						<c:otherwise>
							未评价
						</c:otherwise>
						</c:choose></td>
					<td>${orders.userid}</td>
					<td>
						<button onclick="getOneForUpdate(${orders.oid})" class="btn btn-success btn-xs">修改</button>
					</td>
					<td>
						<button onclick="deleteCategoryById(${orders.oid})" class="btn btn-danger btn-xs">删除</button>
					</td>
				</tr>
			</c:forEach>

			</tbody>

		</table>


	</div>

	<!--0.8 上一页 下一页时 都要请求getPageByQuery方法 并把查询条件传过去-->
	<div class="pageDiv">

		<form id="categoryForm" action="OrderServlet" method="post">
			<input type="hidden" name="action" value="getPageByQuery"/>
			<input type="hidden" name="searchCondition" value='${requestScope.searchCondition}'/>
			<a id="first" class="btn btn-default btn-sm" href="OrderServlet?action=getPageByQuery&searchCondition=${requestScope.searchCondition}&requestPage=1">首页</a>


			<a id="previous" class="btn btn-default btn-sm"
			   href="OrderServlet?action=getPageByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>"> 上一页</a>
			<a id="next" class="btn btn-default btn-sm"
			   href="OrderServlet?action=getPageByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>"> 下一页</a>


			<a id="last" class="btn btn-default btn-sm"
			   href="OrderServlet?action=getPageByQuery&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>">尾页</a>

			<span class="mySpan">
    <span>当前第<%=pageInfo.getCurrentPage()%>页</span>

   <span>共<%=pageInfo.getTotalRecordCount()%>条记录 </span>

    <span>共<%=pageInfo.getTotalPageCount()%>页</span>

    <span>每页<%=pageInfo.getPerPageRecordCount()%>条</span>


    <span>跳到第 </span>
    	<select id="requestPage" name="requestPage">
    		<%
				int TotalPageCount = pageInfo.getTotalPageCount();

				int currentPage = pageInfo.getCurrentPage();
				for (int i = 1; i <= TotalPageCount; i++) {

					if (currentPage == i) {
						out.println("<option selected='selected'>" + i + "</option>");
					} else {
						out.println("<option>" + i + "</option>");
					}

				}
			%>

    	</select>

    <span>页 </span>
   </span>

		</form>

	</div>
</div>



<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="css/jQueryConfirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

    $(function () {
        //对id为categoryTable表格进行隔行换色
        $("#categoryTable>tbody>tr:even").css("background-color", "#fff");

        //给跳到第几页下拉列表框绑定事件
        $("#requestPage").change(function () {

            //提交请求
            $("#categoryForm").submit();
        });

        //第一页时 "首页"和上一页不能用

        var currentPage = <%=pageInfo.getCurrentPage()%>;
        var totalPageCount = <%=pageInfo.getTotalPageCount()%>;
        if (currentPage == 1) {
            $("#first").addClass("disabled");
            $("#previous").addClass("disabled");
        } else if (currentPage == totalPageCount) {
            //最后一页时 "下一页"和"尾页"不能能用
            $("#next").addClass("disabled");
            $("#last").addClass("disabled");
        }

    });

    function deleteCategoryById(id) {
        $.confirm({
            title: '',
            content: '您确认删除吗?',
            confirm: function () {

                location.assign("OrderServlet?action=byone&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&oid=" + id);
            },
            cancel: function () {

            },

        });
    }

    function getOneForUpdate(id) {

        location.assign("OrderServlet?action=getOneForUpdate&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&oid=" + id);
    }
</script>

<%--0.9 添加二级商品种类 加入删除、修改后的提示信息--%>
<%
	String msgTitle = (String)request.getAttribute("msg");
	String msgContent = (String)request.getAttribute("msgDetail");
	if(msgTitle!=null){

%>
<script type="text/javascript">

	$.alert({
		title: '${msg}',
		content: '${msgDetail}',
		animation: 'rotate',
		closeAnimation: 'right',
		opacity: 0.5
	});


</script>
<%
	}
%>
</body>

</html>