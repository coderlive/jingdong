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

    <title>添加二级商品种类</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
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
            <li><a href="#">添加商品</a></li>
        </ul>
    </div>
    <div class="myFormDiv">
        <form action="product/add" method="post">
            <div class="inputDiv"><label class="myFormLabel">商品名称</label><input type="text" class="jdInput"name="pname" placeholder="请输入商品名称"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品价格</label><input type="text" class="jdInput"name="price" placeholder="请输入商品价格"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品数量</label><input type="text" class="jdInput"name="product_sum" placeholder="请输入商品数量"/></div>
            <div class="inputDiv"><label class="myFormLabel">店铺名称</label><input type="text" class="jdInput"name="dianpu_name" placeholder="请输入店铺名称"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品描述</label><input type="text" class="jdInput"name="pdesc" placeholder="请输入商品描述"/></div>
            <div class="inputDiv">
                <label class="myFormLabel" for="category1">一级种类</label>
                <select class="selectCategory" name="category1" id="category1">
                </select>
            </div>
            <div class="inputDiv">
                <label class="myFormLabel" for="category2">二级种类</label>
                <select class="selectCategory" name="category2" id="category2"></select>
            </div>
            <div class="inputDiv">
                <label class="myFormLabel" for="cid">三级种类</label>
                <select class="selectCategory" name="cid" id="cid"></select>
            </div>

            <input type="submit" class="btn btn-success addCategoryBtn" value="添加商品" />
        </form>
    </div>

</div>


<script src="css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="js/network.js"></script>
<script type="text/javascript">
    $(function() {
        theupdateSelect(-1,'category1').then(function () {
            var cid=$('#category1').children('option')[0].value;
            return theupdateSelect(cid,'category2');
        }).then(function () {
            var cid=$('#category2').children('option')[0].value;
            return theupdateSelect(cid,'cid');
        }).then(function () {//当数据更新完后才加载这个东西
            $("#category1").change(function () {//当第一个选项框更新内容的时候更新他
                var category1Id = this.options[this.selectedIndex].value;
                $('#category2').replaceWith('<select class="selectCategory" name="category2" id="category2"></select>');//默认把第二个选项的地方清空
                theupdateSelect(category1Id,'category2').then(function () {
                    $("#category2").change(function () {//当第二个选项框内容更新的时候更新第三个选项框
                        var category2Id = this.options[this.selectedIndex].value;
                        theupdateSelect(category2Id,'cid');
                    })
                    $('#category2').trigger('change');
                })

            });
        });

        function theupdateSelect(category1Id,select) {
           return new network("category/getLevelCategory",{"cparent":category1Id}).then(function (cates) {
                $('#'+select).replaceWith('<select class="selectCategory" name="'+select+'" id="'+select+'"></select>');
               var cate1 = $('#'+select);
               if (cates.length==0)
               {
                   cate1.replaceWith('<select class="selectCategory" name="'+select+'" id="'+select+'"><option value="'+category1Id+'" >没有种类</option></select>');
               }else{
                   var str = "";
                   for (var i = 0; i < cates.length; i++) {
                       str += "<option value='" + cates[i].cid + "'>" + cates[i].cname + "</option>";
                   }
                   cate1.append($(str));
               }
            });
        }
    });
</script>
</body>
</html>
