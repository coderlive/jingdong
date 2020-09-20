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

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="main-wrapper">
    <div class="header">
        <div class="header-left">
            <a href="JDDispatcherServlet?target=/index.jsp" class="logo">
                <img src="http://img.duoziwang.com/2018/16/04172136909052.jpg" width="35" height="35" alt="">
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
                    <span>Admin</span>
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
                        <a href="jsp/main.jsp" target="mainIFrame"><i class="fa fa-dashboard"></i> <span>主页</span></a>
                    </li>
                    <li class="submenu">
                        <a href="page/doctors.html"><i class="fa fa-certificate"></i> <span>一级商品管理</span><span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="JDDispatcherServlet?target=admin/category/addCategory.jsp" target="mainIFrame">添加一级商品</a></li>
                            <li><a href="JDDispatcherServlet?target=admin/category/deleteById.jsp" target="mainIFrame">删除一级商品</a></li>
                            <%--<li><a href="JDDispatcherServlet?target=admin/category/modifyCate.jsp" target="mainIFrame">修改商品</a></li>--%>
                            <li><a href="CategoryServlet?action=selectAll&requestPage=1" target="mainIFrame">查询一级商品</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="page/patients.html"><i class="fa fa-wheelchair"></i> <span>Patients</span></a>
                    </li>
                    <li>
                        <a href="page/appointments.html"><i class="fa fa-calendar"></i> <span>Appointments</span></a>
                    </li>
                    <li>
                        <a href="page/schedule.html"><i class="fa fa-calendar-check-o"></i> <span>Doctor Schedule</span></a>
                    </li>
                    <li>
                        <a href="page/departments.html"><i class="fa fa-hospital-o"></i> <span>Departments</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-user"></i> <span> Employees </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/employees.html">Employees List</a></li>
                            <li><a href="page/leaves.html">Leaves</a></li>
                            <li><a href="page/holidays.html">Holidays</a></li>
                            <li><a href="page/attendance.html">Attendance</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-money"></i> <span> Accounts </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/invoices.html">Invoices</a></li>
                            <li><a href="page/payments.html">Payments</a></li>
                            <li><a href="page/expenses.html">Expenses</a></li>
                            <li><a href="page/taxes.html">Taxes</a></li>
                            <li><a href="page/provident-fund.html">Provident Fund</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-book"></i> <span> Payroll </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/salary.html"> Employee Salary </a></li>
                            <li><a href="page/salary-view.html"> Payslip </a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="page/chat.html"><i class="fa fa-comments"></i> <span>Chat</span> <span class="badge badge-pill bg-primary float-right">5</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-video-camera camera"></i> <span> Calls</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/voice-call.html">Voice Call</a></li>
                            <li><a href="page/video-call.html">Video Call</a></li>
                            <li><a href="page/incoming-call.html">Incoming Call</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-envelope"></i> <span> Email</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/compose.html">Compose Mail</a></li>
                            <li><a href="page/inbox.html">Inbox</a></li>
                            <li><a href="page/mail-view.html">Mail View</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-commenting-o"></i> <span> Blog</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/blog.html">Blog</a></li>
                            <li><a href="page/blog-details.html">Blog View</a></li>
                            <li><a href="page/add-blog.html">Add Blog</a></li>
                            <li><a href="page/edit-blog.html">Edit Blog</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="...html"><i class="fa fa-cube"></i> <span>..</span></a>
                    </li>
                    <li>
                        <a href="page/activities.html"><i class="fa fa-bell-o"></i> <span>Activities</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-flag-o"></i> <span> Reports </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/expense-reports.html"> Expense Report </a></li>
                            <li><a href="page/invoice-reports.html"> Invoice Report </a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="page/settings.html"><i class="fa fa-cog"></i> <span>Settings</span></a>
                    </li>
                    <li class="menu-title">UI Elements</li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-laptop"></i> <span> Components</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/uikit.html">UI Kit</a></li>
                            <li><a href="page/typography.html">Typography</a></li>
                            <li><a href="page/tabs.html">Tabs</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-edit"></i> <span> Forms</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/form-basic-inputs.html">Basic Inputs</a></li>
                            <li><a href="page/form-input-groups.html">Input Groups</a></li>
                            <li><a href="page/form-horizontal.html">Horizontal Form</a></li>
                            <li><a href="page/form-vertical.html">Vertical Form</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-table"></i> <span> Tables</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/tables-basic.html">Basic Tables</a></li>
                            <li><a href="page/tables-datatables.html">Data Table</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="calendar.html"><i class="fa fa-calendar"></i> <span>Calendar</span></a>
                    </li>
                    <li class="menu-title">Extras</li>
                    <li class="submenu">
                        <a href="#"><i class="fa fa-columns"></i> <span>Pages</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="page/login.html"> Login </a></li>
                            <li><a href="page/register.html"> Register </a></li>
                            <li><a href="page/forgot-password.html"> Forgot Password </a></li>
                            <li><a href="page/change-password2.html"> Change Password </a></li>
                            <li><a href="page/lock-screen.html"> Lock Screen </a></li>
                            <li><a href="page/profile.html"> Profile </a></li>
                            <li><a href="page/gallery.html"> Gallery </a></li>
                            <li><a href="page/error-404.html">404 Error </a></li>
                            <li><a href="page/error-500.html">500 Error </a></li>
                            <li><a href="page/blank-page.html"> Blank Page </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="javascript:void(0);"><i class="fa fa-share-alt"></i> <span>Multi Level</span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li class="submenu">
                                <a href="javascript:void(0);"><span>Level 1</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                    <li class="submenu">
                                        <a href="javascript:void(0);"> <span> Level 2</span> <span class="menu-arrow"></span></a>
                                        <ul style="display: none;">
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><span>Level 1</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="page-wrapper">
            <div  style="height: 700px;"  >
                <iframe class="row"   style="margin-left: 10px"  src="jsp/main.jsp"  name="mainIFrame" width="100%" height="100%" scrolling="no"   frameborder="0">
                </iframe>
            </div>
    </div>
</div>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/Chart.bundle.js"></script>
    <script src="js/chart.js"></script>
    <script src="js/app.js"></script>
    <script src="js/bootstrap.js" type="text/javascript" ></script>
</body>

</html>
