<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ page import="page.PageInfo" %>
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
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<style type="text/css">
			body {
				background-color:#F9F9F9;
			}
			a:link {
				text-decoration: none;
			}
			tr.tableHead {
				background-color:#DCC16E;
				color: #ffffff;
			}
			tr.tableHead>th {
				text-align: center;
			}
			/*鼠标悬停的 当前行高亮*/
			/*table>tbody>tr:hover {
				background-color:#BAD0EF !important;
			}*/
			div.categoryTableDiv {
				width:1060px;
				margin:0px auto;
			}
			#categoryTable {
				position:relative;
				top:20px;
			}
			.breadcrumb a {
				color: #193449 !important;
				font-weight: bold;
			}
			.pageDiv{
				margin-top: 40px;
			}
			#requestPage{
				background: #FFFFFF;
				color: #007BFF;
				outline: #dee2e6;
				-webkit-appearance: none;
				-moz-appearance: none;
				appearance: none;
				padding: 0 30px;
				padding: 0.5rem 0.75rem;
				margin-left: -1px;
				border: 1px solid #dee2e6;
			}
			#selectPage option{
				text-align: center;
			}
			.pagination{
				display: flex;
				justify-content: space-around;
			}
		</style>
	</head>

	<body >
		<div class="text-center categoryTableDiv">
			<nav aria-label="breadcrumb" style="margin-top: 40px;">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">首页</a></li>
					<li class="breadcrumb-item"><a href="#">商品</a></li>
					<li class="breadcrumb-item active" aria-current="page">管理一级商品种类</li>
				</ol>
			</nav>
			<table id="categoryTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="15%">商品种类编号</th>
						<th width="15%">商品种类名称</th>
						<th width="50%">商品种类描述</th>
						<th width="10%">操作</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="category">
							<input type="hidden" name="cid" value="${category.cid}">
							<input type="hidden" name="cname" value="${category.cname}">
							<input type="hidden" name="cdesc" value="${category.cdesc}">
							<input type="hidden" name="cparent" value="${category.cparent}">
							<input type="hidden" name="clevel" value="${category.clevel}">
							<input type="hidden" name="cicon" value="${category.cicon}">
							<tr>
								<td>${category.cid}</td>
								<td>${category.cname}</td>
								<td>${category.cdesc}</td>
								<td>
									<a  href="JDDispatcherServlet?target=admin/category/modifyCate.jsp?cid=${category.cid}&cname=${category.cname}
									&cdesc=${category.cdesc}&requestPage=${pageInfo.currentPage}&cicon=${category.cicon}&clevel=${category.clevel}&cparent=${category.cparent}"
										class="btn btn-success btn-xs">修改</a>
								</td>
								<td>
									<button  onclick="deleteCate(${category.cid})"   class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<div  class="pageDiv">
				<form id="categoryForm" action="CategoryServlet" method="post">
					<input type="hidden" name="action" value="selectAll"/>
					  <ul class="pagination">
						<li id="first" class="page-item"><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=1">首页</a></li>
						<li id="previous" class="page-item"><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=${pageInfo.previousPage}">上一页</a></li>
							  <c:forEach  varStatus="status" begin="${pageInfo.currArea*5+1}" end="${(pageInfo.currArea+1)*5}">
								<c:if test="${status.index<=pageInfo.totalPageCount}"	>
									<li class="page-item <c:if test="${status.index==pageInfo.currentPage}">active</c:if> "><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=${status.index}">${status.index}</a></li>
								</c:if>
							</c:forEach>
							  <c:if test="${(pageInfo.currArea+1)*5<=pageInfo.totalPageCount}">
								  <li class="page-item"><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=${pageInfo.currentPage+5<=pageInfo.totalPageCount?pageInfo.currentPage+5:pageInfo.totalPageCount}">...</a></li>
							  </c:if>
						<li id="next" class="page-item"><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=${pageInfo.nextPage}">下一页</a></li>
						<li id="last" class="page-item"><a class="page-link" href="CategoryServlet?action=selectAll&requestPage=${pageInfo.totalPageCount}">尾页</a></li>
						  <li class="page-item"><span class="page-link">共${pageInfo.totalRecordCount}条记录</span> </li>
						  <li class="page-item"><span class="page-link">共${pageInfo.totalPageCount}页</span></li>
						  <li class="page-item"><span class="page-link">每页${pageInfo.perPageRecordCount}条</span></li>
						  <li class="page-item"><span class="page-link">跳到第</span></li>
						  <select id="requestPage"  id="requestPage" name="requestPage">
							  <c:forEach  varStatus="status" begin="1" end="${pageInfo.totalPageCount}">
								  <c:if test="${status.index==pageInfo.currentPage}">
									  <option class='page-link' selected='selected'>${ status.index}</option>
								  </c:if>
								  <c:if test="${status.index!=pageInfo.currentPage}">
									  <option class='page-link'>${ status.index}</option>
								  </c:if>
							  </c:forEach>
						  </select>
						  <li class="page-item"><span class="page-link">页</span></li>
				</form>
				</ul>
			</div>
		</div>
		<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/bootstrap.js" type="text/javascript" ></script>
		<script type="text/javascript">
			$(function(){
				//对id为categoryTable表格进行隔行换色
				$("#categoryTable>tbody>tr:even").css("background-color","#fff");
                //给跳到第几页下拉列表框绑定事件
                $("#requestPage").change(function () {

                    //提交请求
                    $("#categoryForm").submit();
                });
                //第一页时 "首页"和上一页不能用
                var currentPage = ${pageInfo.currentPage};
                var totalPageCount = ${pageInfo.totalPageCount};
                if (currentPage == 1) {
                    $("#first").addClass("disabled");
                    $("#previous").addClass("disabled");
                } else if (currentPage == totalPageCount) {
                    //最后一页时 "下一页"和"尾页"不能能用
                    $("#next").addClass("disabled");
                    $("#last").addClass("disabled");
                }

			});
			function deleteCate(cid) {
                var is_delte=confirm("是否确认删除");
                if (is_delte)
                {
                    window.location.assign('CategoryServlet?action=deleteById&cid='+cid+'&requestPage='+${pageInfo.currentPage})
                }
            }
		</script>
	</body>

</html>