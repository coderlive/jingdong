<%@ page language="java" import="java.util.*,com.vo.*,com.page.PageInfo,com.service.impl.ProductServiceImpl"
         pageEncoding="UTF-8" %>
<%@ page import="com.service.impl.CategoryServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
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

        /*1.3 管理商品(商品名称内容过长处理)*/
        #productTable {
            table-layout: fixed;
        }

        #productTable td {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
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

        #pageInfoDiv {
            position: absolute;
            right: 0px;
        }

        #requestPage {
            width: 40px;

        }

        .mySpan {
            vertical-align: middle;
        }

        .mySpan > span {
            font-size: 12px;
            color: #333;
            padding: 0px 4px;

        }

        #jdCategorySearch {
            width: 500px;
            margin: 0px auto;
            postion: relative;
            top: -50px;
        }

        .breadcrumb a {
            color: #193449 !important;
            font-weight: bold;
        }

        #categoryDiv {
            position: relative;
            /*background-color: yellowgreen;*/
            top: 150px;
        }

        div.pageDiv {
            position: absolute;
            right: 50px;
        }
    </style>
</head>

<body>
<div>
    <ul class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">商品管理</a></li>
        <li><a href="#">管理商品</a></li>
    </ul>
</div>
<div id="categoryDiv">
    <form id="categoryForm" action="product/goManger?target=/backend/product/productMain" method="post">

        <div id="jdCategorySearch" class="input-group">
            <input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}'
                   class="form-control"/>

            <span class="input-group-btn">
					<input type="submit" value="搜索" class="btn btn-default"/>
				</span>
        </div>
    </form>

    <div class="text-center categoryTableDiv">

        <table id="productTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr class="tableHead">
                <th width="10%">商品编号</th>
                <th width="20%">*商品名称</th>
                <th width="10%">商品价格</th>
                <th width="10%">商品数量</th>
                <th width="15%">*店铺名称</th>
                <th width="15%">*所属种类</th>
                <th width="10%">操作</th>
                <th width="10%">操作</th>
                <th width="10%">操作</th>
            </tr>
            </thead>
            <tbody>

            <%
                List<Products> list = (List<Products>) request.getAttribute("list");
                Iterator<Products> it = list.iterator();
                while (it.hasNext()) {
                    Products product = it.next();
            %>
            <tr>
                <td><%=product.getPid() %>
                </td>
                <td title="<%=product.getPname() %>" alt="<%=product.getPname() %>"><%=product.getPname() %>
                </td>
                <td><%=product.getPrice() %>
                </td>
                <td><%=product.getProduct_sum() %>
                </td>
                <td><%=product.getDianpu_name() %>
                </td>
                <td><%=product.getCname() %>
                </td>
                <td>
                    <button onclick="getOneForUpdate(<%=product.getPid() %>)" class="btn btn-success btn-xs">修改</button>
                </td>
                <td>
                    <button onclick="deleteProductById(<%=product.getPid() %>)" class="btn btn-danger btn-xs">删除
                    </button>
                </td>
                <td>
                    <button onclick="getOneForUpload(<%=product.getPid() %>)" class="btn btn-success btn-xs">上传图片</button>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>


    <div class="pageDiv">
        <form id="productForm2" action="product/goManger?target=/backend/product/productMain" method="post">
            <a id="first" class="btn btn-default btn-sm"
               href='product/goManger?target=/backend/product/productMain&searchCondition=${searchCondition}&requestPage=1'>首页</a>


            <a id="previous" class="btn btn-default btn-sm"
               href='product/goManger?target=/backend/product/productMain&searchCondition=${searchCondition}&requestPage=${pageInfo.previousPage}'>
                上一页</a>
            <a id="next" class="btn btn-default btn-sm"
               href='product/goManger?target=/backend/product/productMain&searchCondition=${searchCondition}&requestPage=${pageInfo.nextPage}'>
                下一页</a>


            <a id="last" class="btn btn-default btn-sm"
               href='product/goManger?target=/backend/product/productMain&searchCondition=${requestScope.searchCondition}&requestPage=${pageInfo.totalPageCount}'>尾页</a>

            <span class="mySpan">

                    <span>当前第${pageInfo.currentPage}页</span>

                    <span>共${pageInfo.totalRecordCount}条记录 </span>

                    <span>共${pageInfo.totalPageCount}页</span>

                    <span>每页${pageInfo.perPageRecordCount}条</span>

                    <span>跳到第 </span>
                    <input type="hidden" name="searchCondition" value="${searchCondition}"/>
                    <select id="requestPage" name="requestPage">
                        <c:forEach var="item" varStatus="status" begin="1" end="${pageInfo.totalPageCount}">
                            <c:if test="${status.index==pageInfo.currentPage}">
                                <option selected='selected'> ${status.index} </option>
                            </c:if>
                            <c:if test="${status.index!=pageInfo.currentPage}">
                                <option> ${status.index} </option>
                            </c:if>
                        </c:forEach>
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
    function trim(txt) {
        var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");
        return afterTrimTxt;
    }
    $(function () {
        //对id为categoryTable表格进行隔行换色
        $("#productTable>tbody>tr:even").css("background-color", "#fff");
        //给跳到第几页下拉列表框绑定事件
        $("#requestPage").change(function () {
            //提交请求
            $("#productForm2").submit();
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
    function deleteProductById(pid) {
        $.confirm({
            title: ' ',
            content: '您确认删除吗?',
            confirm: function () {
                //发请求
                location.assign("product/delete?target=/backend/product/productMain&searchCondition=${searchCondition}&requestPage=${pageInfo.currentPage}&pid=" +pid);
            },
            cancel: function () {

            }
        });
    }

    function getOneForUpdate(pid) {//这个是查询出该商品并且跳到修改的页面
        location.assign("product/getOneForUpdate?searchCondition=${searchCondition}&requestPage=${pageInfo.currentPage}&pid=" + pid);
    }
    function getOneForUpload(pid){//这个是上传的函数，用来获取上床
        location.assign("product/SelectOneForUpload?searchCondition=${searchCondition}&requestPage=${pageInfo.currentPage}&pid=" + pid);
    }


</script>

<%
    String msg = (String) request.getAttribute("msg");
    String msgDetail = (String) request.getAttribute("msgDetail");
    if (msg != null) {
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