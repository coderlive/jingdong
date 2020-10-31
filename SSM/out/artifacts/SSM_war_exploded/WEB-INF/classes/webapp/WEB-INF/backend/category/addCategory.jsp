<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加一级商品种类</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
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
    </style>
</head>
<body>
<div class="centerDiv">
	<div class="myFormDiv">
        <form action="category/addCategory" method="post">
            <input id="cparent" type="hidden" name="cparent" value="-1">
            <input id="clevel" type="hidden" name="clevel" value="1">
            <div style="margin-top: 20px" class="inputDiv"><label class="myFormLabel">商品种类名称</label><input type="text" class="jdInput"name="cname" placeholder="请输入商品种类名称"/></div>
            <div class="inputDiv"><label class="myFormLabel">商品种类描述</label><input type="text" class="jdInput"name="cdesc" placeholder="请输入商品种类描述"/></div>
            <div class="btn-group">
                <button id="one_default" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    一级种类
                </button>
                <div id="one_list" class="dropdown-menu"></div>
            </div>
            <div class="btn-group">
                <button id="two_default" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    二级种类
                </button>
                <div id="two_list" class="dropdown-menu">
                    <div class="dropdown-item">二级种类</div>
                </div>
            </div>
            <input style="margin-top: 0px" type="submit" class="btn btn-success addCategoryBtn" value="添加商品种类" />
        </form>
	</div>
</div>
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js" type="text/javascript" ></script>
    <script>
        $(function () {
            new Promise(function(resolve, reject) {
                // 异步处理
                // 处理结束后、调用resolve 或 reject
                $.post("category/getLevelCategory.action",{"cparent":-1},function(data){
                    //使用dom技术动态的产生 二级商品种类下拉列表框
                    resolve(data);
                },"json");
            }).then(function (one) {
                // var one=JSON.parse(result);//把一级菜单渲染下去，
                $('#one_list').append('<div class="dropdown-item" value="0">'+'不选择'+'</div>');//这里暂时不写cid
                for (var i=0;i<one.length;i++) {
                    $('#one_list').append('<div class="dropdown-item" value="' + one[i].cid + '">' + one[i].cname + '</div>');
                }
                    $('#one_list .dropdown-item').click(function () {//添加一级菜单点击事件，把二级菜单给渲染出来
                        $('#one_default').text($(this).text());//设置选项框内容
                        $('#one_default').attr('cparent',$(this).attr("value"));
                        if ($(this).text()=='不选择')
                        {
                            $('#cparent').val(-1);
                            $('#clevel').val(1);
                        }else{
                            $('#clevel').val(2);
                            $('#cparent').val($(this).attr('value'));//设置父亲节点
                        }
                        var cparent=$(this).attr('value');
                       return new Promise(function(resolve, reject) {
                           $.post("category/getLevelCategory.action",{"cparent":cparent},function(data){
                               //使用dom技术动态的产生 二级商品种类下拉列表框
                               resolve(data);
                           },"json");
                    }).then(function (two) {
                       // console.log(two);
                       var two_list=$('#two_list');
                       two_list.html('');
                       if (two.length==0)
                       {
                           $('#two_default').text('无二级种类');
                           two_list.html('<div class="dropdown-item" value="'+1+'">'+'无二级种类'+'</div>');
                           // $('#clevel').val(2);
                       }
                       else{
                           $('#two_default').text('二级种类');
                           two_list.append('<div class="dropdown-item" value="0">'+'不选择'+'</div>');//这里暂时不写cid
                           for (var i=0;i<two.length;i++)
                               two_list.append('<div class="dropdown-item" value="'+two[i].cid+'">'+two[i].cname+'</div>');
                       }
                       $('#two_list .dropdown-item').click(function () {
                           $('#two_default').text($(this).text());//设置选项框内容
                           if ($(this).text()=='无二级种类')
                               return;
                           if ($(this).text()=='不选择')
                           {
                             $('#cparent').val($('#one_default').attr('cparent'));
                             console.log($('#one_default').attr('cparent'))
                               $('#clevel').val(2);
                           }else{
                               $('#cparent').val($(this).attr('value'));
                               $('#clevel').val(3);//设置添加的为三级菜单
                           }
                       })
                   });
                })
            })
        });
    </script>
</body>
</html>
