<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <base href="<%=baseurl%>">
    <title>京东后台管理页面</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<div class="main-wrapper">
    <div class="header">
        <div class="header-left">
            <a href="JDDispatcherServlet?target=/index.jsp" class="logo">
                <img style="border-radius: 25px" src="img/jdhead.jpg" width="35" height="35" alt="">
                <span>京东后台管理系统</span>
            </a>
        </div>
        <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
        <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
        <ul class="nav user-menu float-right">
            <li class="nav-item dropdown d-none d-sm-block">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"><i class="fa fa-bell-o"></i> <span class="badge badge-pill bg-danger float-right">3</span></a>
                <div class="dropdown-menu notifications">
                    <div class="topnav-dropdown-header">
                        <span>Notifications</span>
                    </div>
                    <div class="drop-scroll">
                        <ul class="notification-list">
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media">
											<span class="avatar">
												<img alt="John Doe" src="img/user.jpg" class="img-fluid">
											</span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">John Doe</span> added new task <span class="noti-title">Patient appointment booking</span></p>
                                            <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media">
                                        <span class="avatar">V</span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">Tarah Shropshire</span> changed the task name <span class="noti-title">Appointment booking with payment gateway</span></p>
                                            <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media">
                                        <span class="avatar">L</span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">Misty Tison</span> added <span class="noti-title">Domenic Houston</span> and <span class="noti-title">Claire Mapes</span> to project <span class="noti-title">Doctor available module</span></p>
                                            <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media">
                                        <span class="avatar">G</span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">Rolland Webber</span> completed task <span class="noti-title">Patient and Doctor video conferencing</span></p>
                                            <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media">
                                        <span class="avatar">V</span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">Bernardo Galaviz</span> added new task <span class="noti-title">Private chat module</span></p>
                                            <p class="noti-time"><span class="notification-time">2 days ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="activities.html">View all Notifications</a>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown d-none d-sm-block">
                <a href="javascript:void(0);" id="open_msg_box" class="hasnotifications nav-link"><i class="fa fa-comment-o"></i> <span class="badge badge-pill bg-danger float-right">8</span></a>
            </li>
            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img">
							<img class="rounded-circle" src="https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3818670604,1923994441&fm=26&gp=0.jpg" width="24" alt="Admin">
							<span class="status online"></span>
						</span>
                    <span>${backuser.username}</span>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="profile.html">我的简介</a>
                    <a class="dropdown-item" href="edit-profile.html">更改个人信息</a>
                    <a class="dropdown-item" href="settings.html">设置</a>
                    <a class="dropdown-item" href="login?action=LoginOut">退出登录</a>
                </div>
            </li>
        </ul>
        <div class="dropdown mobile-user-menu float-right">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.html">我的简介</a>
                <a class="dropdown-item" href="edit-profile.html">更改个人信息</a>
                <a class="dropdown-item" href="settings.html">设置</a>
                <a class="dropdown-item" href="login.jsp">退出登录</a>
            </div>
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <%--<li class="menu-title">欢迎您!</li>--%>
                    <li class="active">
                        <a href="go_backend?target=backend/main.jsp" target="mainIFrame"><i class="fa fa-desktop"></i> <span>主页</span></a>
                    </li>
                    <li>
                        <a href="javascript:0;"><i class="fa fa-user-o"></i> <span>用户管理</span><span class="menu-arrow"></a>
                        <ul style="display: none;">
                            <li><a href="user/getPageByQuery.action?target=/backend/user/usersActiveMain&requestPage=1" target="mainIFrame">用户激活状态</a></li>
                            <li><a href="user/getPageByQuery.action?target=/backend/user/usersMain&requestPage=1" target="mainIFrame">用户解锁</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="page/doctors.html"><i class="fa fa-sitemap"></i> <span>商品种类管理</span><span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="go_backend?target=backend/category/addCategory" target="mainIFrame">添加商品种类</a></li>
                            <%--<li><a href="JDDispatcherServlet?target=admin/category/deleteById.jsp" target="mainIFrame">删除商品种类</a></li>--%>
                            <li><a href="category/getPageByQuery?requestPage=1&clevel=0&target=backend/category/categoryMain" target="mainIFrame">管理商品种类</a></li>
                            <li><a href="go_backend?target=backend/product/addProductAttribute" target="mainIFrame">添加商品属性</a></li>
                            <li><a href="attribute/getAttribute" target="mainIFrame">管理商品属性</a></li>
                            <li><a href="go_backend?target=backend/product/addProperties" target="mainIFrame">添加商品属性选项</a></li>
                            <li><a href="properties_select/getPropertiesvalues" target="mainIFrame">管理商品属性选项</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:0;"><i class="fa fa-calendar"></i> <span>商品管理</span><span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="go_backend?target=backend/product/addProduct" target="mainIFrame">添加商品</a></li>
                            <li><a href="product/goManger?target=backend/product/productMain" target="mainIFrame">管理商品</a></li>
                            <li><a href="product/goManger?target=backend/product/productMainUpDown" target="mainIFrame">上下架商品</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="go_backend?target=backend/product/salesVolume" target="mainIFrame"><i class="fa fa-sort-amount-asc"></i> <span>商品销量排行榜</span></a>
                    </li>
                        <li>
                            <a href="javascript:0;"><i class="fa fa-reorder"></i> <span>订单管理</span><span class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li><a href="order/find?requestPage=1" target="mainIFrame">管理订单</a></li>
                            </ul>
                        </li>
                    <li>
                        <a href="go_backend?target=frontpage/user/welcome" ><i class="fa fa-home"></i> <span>去京东首页</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="page-wrapper">
            <div  style="height: 700px;"  >
                <iframe class="row"   style="margin-left: 10px"  src="go_backend?target=backend/main"  name="mainIFrame" width="100%" height="100%" scrolling="no"   frameborder="0">
                </iframe>
            </div>
    </div>
</div>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/app.js"></script>
    <script src="js/bootstrap.js" type="text/javascript" ></script>
</body>

</html>
