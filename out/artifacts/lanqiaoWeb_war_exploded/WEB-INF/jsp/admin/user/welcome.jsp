<%@ page language="java" import="java.util.*,vo.*,service.inner.*,service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>京东(JD.COM)-正品低价、品质保障、配送及时、轻松购物！<br>jd.com</title>
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <link rel="stylesheet" href="css/index.css">
</head>
<script src="js/index.js"></script>
<body>
    <!-- 顶部的菜单条 -->
<div id="main">
    <div class="top_title">
        <div class="poit">
            <div class="row_icon">
                <span class="iconfont icon-dingwei"></span>
                <span class="poit_text">广西</span>
                <div class="point_content">
                    <div class="content">
                        <div class="row row_point">
                            <div class="col">
                                <div>北京</div>
                                <div>山西</div>
                                <div>内蒙古</div>
                                <div>福建</div>
                                <div>江西</div>
                                <div>西藏</div>
                                <div>新疆</div>
                            </div>
                            <div class="col">
                                <div>上海</div>
                                <div>河南</div>
                                <div>江苏</div>
                                <div>湖北</div>
                                <div>四川</div>
                                <div>陕西</div>
                                <div>港澳</div>
                            </div>
                            <div class="col">
                                <div>天津</div>
                                <div>辽宁</div>
                                <div>山东</div>
                                <div>湖南</div>
                                <div>海南</div>
                                <div>甘肃</div>
                                <div>台湾</div>
                            </div>
                            <div class="col">
                                <div>重庆</div>
                                <div>吉林</div>
                                <div>安徽</div>
                                <div>广东</div>
                                <div>贵州</div>
                                <div>青海</div>
                                <div>钓鱼岛</div>
                            </div>
                            <div class="col">
                                <div>河北</div>
                                <div>黑龙江</div>
                                <div>浙江</div>
                                <div class="default">广西</div>
                                <div>云南</div>
                                <div>宁夏</div>
                                <div>海外</div>
                            </div>
                        </div>
                        <div class="row row_title">
                            <div>地区专享版本</div>
                        </div>
                        <div class="row row_middle">
                            <div class="col">
                                <div>中国港澳</div>
                                <div>京东全球</div>
                            </div>
                            <div class="col">
                                <div>中国台湾</div>
                            </div>
                        </div>
                        <div class="row row_title">
                            <div>Available Sites</div>
                        </div>
                        <div class="row row_bottom">
                            <div class="col">
                                <div><span class="iconfont icon-quanqiu"></span>Global Site</div>
                                <div><span class="iconfont icon-china"></span>Situs Indonesia</div>
                                <div><span class="iconfont icon-nanfeiguoqi"></span>เว็บไซต์ประเทศไทย</div>
                            </div>
                            <div class="col">
                                <div><span class="iconfont icon-ribenguoqi"></span>Сайт России</div>
                                <div><span class="iconfont icon-world-flag_-ALA--AlandIslands"></span>Sitio de Espana</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="linewrap">
            <div class="login">
                <span class="please">
                    您好,
                    <c:if test="${frontuser!=null}">${frontuser.username}</c:if>
                    <c:if test="${frontuser==null}"><a style="text-decoration: none;color: #d81b2a;" href="JDDispatcherServlet?target=admin/user/frontLogin.jsp">请登录</a></c:if>
                </span>
                <a href="JDDispatcherServlet?target=admin/user/register.jsp" style="text-decoration:none" class="register"> 免费注册</a>
            </div>
            <ul class="nav">
                <div class="nav-item">
                    <li class="spacer"></li>
                    <a href="OrderServlet?action=queryMyOrder">我的订单</a>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item ">
                    <div class="nav_hover">
                        <a href="#">我的京东
                            <span class="iconfont icon-jiantou9"></span>
                            <ul class="myjingdong">
                                <div class="myjingdong-top">
                                    <div class="myjingdong-top-left">
                                        <li>待处理订单</li>
                                        <li>返修退换货</li>
                                        <li>降价商品</li>
                                    </div>
                                    <div class="myjingdong-top-right">
                                        <li>消息</li>
                                        <li>我的问答</li>
                                        <li>我的关注</li>
                                    </div>
                                </div>
                                <div class="myjingdong-bottom">
                                    <div class="myjingdong-top-left">
                                        <li>我的京豆</li>
                                        <li>我的优惠卷</li>
                                    </div>
                                    <div class="myjingdong-top-right">
                                        <li>我的白条</li>
                                        <li>我的理财</li>
                                    </div>
                                </div>
                            </ul>
                        </a>
                    </div>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item">
                    <a class="member" href="#">京东会员</a>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item">
                    <div class="nav_hover">
                        <a class="" style="color: #d81b2a;" href="#">
                            企业采购
                            <span class="iconfont icon-jiantou9"></span>
                            <ul class="Enepro ">
                                <div class="Eneprowrap">
                                    <div class="protopwrap">
                                        <a>企业购</a>
                                        <a>商用场景馆</a>
                                    </div>
                                    <div class="protopwrap">
                                        <a>&nbsp;&nbsp;&nbsp;工业品</a>
                                        <a>礼品卡</a>
                                    </div>
                                    <div class="protopwrap">
                                        <a>&nbsp;&nbsp;&nbsp;丰客多商城</a>
                                    </div>
                                </div>
                            </ul>
                        </a></div>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item">
                    <div class="cus_server nav_hover">
                        <a href="#">客户服务
                            <span class="iconfont icon-jiantou9"></span>
                        </a>
                        <div class="services">
                            <div class="flex_services">
                                <div class="title">
                                    <span>客户</span>
                                </div>
                                <div class="content">
                                    <div class="content_left">
                                        <span>帮助中心</span>
                                        <span>在线客服</span>
                                        <span>电话客服</span>
                                        <span>金融资讯</span>
                                        <span>企业客服</span>
                                    </div>
                                    <div class="content_right">
                                        <span>售后服务</span>
                                        <span>意见建议</span>
                                        <span>客服邮箱</span>
                                        <span>全球售客服</span>
                                    </div>
    
                                </div>
                                <div class="title">
                                    <span>商户</span>
                                </div>
                                <div class="content">
                                    <div class="content_left">
                                        <span>合作招商</span>
                                        <span>商家后台</span>
                                        <span>商家帮助</span>
                                    </div>
                                    <div class="content_right">
                                        <span>成长中心</span>
    
                                        <span>京麦工作台</span>
    
                                        <span>规则平台</span>
                                    </div>
    
                                </div>
                            </div>
                        </div>
                    </div>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item">
                    <div class="nav_hover">
                        <a class="" href="#">网站导航
                            <span class="iconfont icon-jiantou9"></span>
                        </a>
                        <div class="web_nav">
                            <div class="flex_content">
                                <div class="content line_border">
                                    <div class="content_title">特色主题</div>
                                    <div class="row">
                                        <div class="col_one">
                                            <div class="col">新品首发</div>
                                            <div class="col">京东会员</div>
                                            <div class="col">装机大师</div>
                                            <div class="col">秒杀</div>
                                            <div class="col">陪伴计划</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">京东金融</div>
                                            <div class="col">京东预售</div>
                                            <div class="col">0元评测</div>
                                            <div class="col">内购</div>
                                            <div class="col">出海招商</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">全球售</div>
                                            <div class="col">台湾售</div>
                                            <div class="col">港澳售</div>
                                            <div class="col">印尼站</div>
                                            <div class="col">拍拍二手</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">国际站</div>
                                            <div class="col">俄语站</div>
                                            <div class="col">优惠卷</div>
                                            <div class="col">京东金融科技</div>
                                            <div class="col">买什么</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content line_border">
                                    <div class="content_title ">行业频道</div>
                                    <div class="row">
                                        <div class="col_one">
                                            <div class="col">手机</div>
                                            <div class="col">电脑办公</div>
                                            <div class="col">京东服饰</div>
                                            <div class="col">母婴</div>
                                            <div class="col">整车</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">智能数码</div>
                                            <div class="col">家用电器</div>
                                            <div class="col">京东生鲜</div>
                                            <div class="col">食品</div>
                                            <div class="col">图书</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">玩3C</div>
                                            <div class="col">京鱼座智能</div>
                                            <div class="col">家装城</div>
                                            <div class="col">农资频道</div>
                                            <div class="col">劳动防护</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content line_border">
                                    <div class="content_title">生活服务</div>
                                    <div class="row">
                                        <div class="col_one">
                                            <div class="col">京东众筹</div>
                                            <div class="col">京东小金库</div>
                                            <div class="col">水电煤</div>
                                            <div class="col">机票酒店</div>
                                            <div class="col">游戏</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">白条</div>
                                            <div class="col">理财</div>
                                            <div class="col">彩票</div>
                                            <div class="col">电影票</div>
                                            <div class="col">拍拍回收</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">京东金融App</div>
                                            <div class="col">花费</div>
                                            <div class="col">旅行</div>
                                            <div class="col">京东到家</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="content_title">更多精选</div>
                                    <div class="row">
                                        <div class="col_one">
                                            <div class="col">合作招商</div>
                                            <div class="col">企业采购</div>
                                            <div class="col">校园加盟</div>
                                            <div class="col">知识产权维护</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">京东通讯</div>
                                            <div class="col">服务市场</div>
                                            <div class="col">京东社区</div>
                                        </div>
                                        <div class="col_one">
                                            <div class="col">京东E卡</div>
                                            <div class="col">办公生活馆</div>
                                            <div class="col">游戏社区</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <li class="spacer"></li>
                </div>
                <div class="nav-item">
                    <div class="phone nav_hover ">
                        <a href="#">手机京东</a>
                        <img
                            src="https://img12.360buyimg.com/img/jfs/t1/67481/15/565/28110/5cec9234E71c47244/dc4cf353fd96922e.png.webp">
                        <div class="saoma">
                            <div class="content">
                                <div class="left">
                                    <img
                                        src="https://img12.360buyimg.com/img/jfs/t1/67481/15/565/28110/5cec9234E71c47244/dc4cf353fd96922e.png.webp">
                                </div>
                                <div class="right">
                                    <div class="title">手机京东</div>
                                    <div class="red_text">新人专享大礼包</div>
                                    <div class="icon">
                                        <span class="icon1 iconfont icon-iphone"></span>
                                        <span class="icon2 iconfont icon-anzhuo"></span>
                                        <span class="iconfont icon-huafei"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                <div class="left">
                                    <img
                                        src="https://img10.360buyimg.com/img/jfs/t1/133427/32/6189/44062/5f2a5467Efff804d1/7cbc252ed5993190.png.webp">
                                </div>
                                <div class="right">
                                    <div class="title">关注京东</div>
                                    <div class="title">JD.COM</div>
                                    <div class="red_text">
                                        扫一扫关注参与宠粉大抽奖，抽小米耳机
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                <div class="left">
                                    <img
                                        src="https://img14.360buyimg.com/img/jfs/t1/36947/5/10895/15408/5cec924bE6c038530/5cf21582b416c186.jpg.webp">
                                </div>
                                <div class="right">
                                    <div class="title">京东金融客户端</div>
                                    <div class="red_text">新人专享大礼包</div>
                                    <div class="icon">
                                        <span class="icon1 iconfont icon-iphone"></span>
                                        <span class="icon2 iconfont icon-anzhuo"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="content">
                                <div class="left">
                                    <img
                                        src="https://img13.360buyimg.com/img/jfs/t1/93019/8/17752/28300/5e8c23b8E4c6c7c13/9c45c518ad785873.png.webp">
                                </div>
                                <div class="right">
                                    <div class="title">京东健康客户端</div>
                                    <div class="icon">
                                        <span class="icon1 iconfont icon-iphone"></span>
                                        <span class="icon2 iconfont icon-anzhuo"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
        </div>
    </div>
    <!-- banner的图片样式 -->
    <div class="top_background">
        <div class="top">
            <div class="image">
                <div class="top_right">
                    <div class="search">
                        <input placeholder="洗衣机">
                        <span class="iconfont icon-weibiaoti1 "></span>
                        <span class="iconfont icon-sousuo "></span>
                    </div>
                    <div class="mycart">
                        <span class="iconfont  icon-shuzi-"></span>
                        <span class="iconfont icon-icon-"></span>
                        <a href="ShoppingCartServlet?action=queryShoppingCart" style="text-decoration: none;" class="cart_text">我的购物车</a>
                    </div>
                    <div class="search_bottom">
                        <span>辣妈七夕节</span>
                        <span>珠宝5折</span>
                        <span>iQOO5</span>
                        <span>美妆护肤</span>
                        <span>0元限量</span>
                        <span>电脑数码</span>
                        <span>图书钜惠</span>
                        <span>特价冰洗</span>
                        <span>有机</span>
                    </div>
                </div>
                <div class="top_nav">
                    <div class="flex_nav">
                        <span>秒杀</span>
                        <span>优惠券</span>
                        <span>PLUS会员</span>
                        <span>品牌闪购</span>
                        <span>拍卖</span>
                        <span>京东家电</span>
                        <span>京东超市</span>
                        <span>京东生鲜</span>
                        <span>京东国际</span>
                        <span>京东金融</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="center">
            <ul id="leftmenu" class="leftmenu"><!--一级菜单-->
                <%--<li><a href="#">家用电器</a></li>--%>
                <%--<li><a href="#">手机/运营商数码</a></li>--%>
                <%--<li><a href="#">电脑/办公</a></li>--%>
                <%--<li><a href="#">家具/家具/家装/厨具</a></li>--%>
                <%--<li><a href="#">男装/女装/童装/内衣</a></li>--%>
                <%--<li><a href="#">美妆/个护清洁/宠物</a></li>--%>
                <%--<li><a href="#">女鞋/箱包/钟表/珠宝</a></li>--%>
                <%--<li><a href="#">男鞋/运动/户外</a></li>--%>
                <%--<li><a href="#">房产/汽车/汽车用品</a></li>--%>
                <%--<li><a href="#">母婴</a></li>--%>
                <%--<li><a href="#">玩具乐器</a></li>--%>
                <%--<li><a href="#">食品/酒类/生鲜/特产</a></li>--%>
                <%--<li><a href="#">艺术/礼品鲜花/农资绿植</a></li>--%>
                <%--<li><a href="#">医药保健/计生情趣</a></li>--%>
                <%--<li><a href="#">图书/文娱/教育/电子书</a></li>--%>
                <%--<li><a href="#">机票/酒店/旅游/生活</a></li>--%>
                <%--<li><a href="#">理财/众筹/白条/保险</a></li>--%>
                <%--<li><a href="#">安装/维修/清洗/二手</a></li>--%>
                <%--<li><a href="#">工业品</a></li>--%>
                <div class="menulist">
                    <div class="flex_div">
                        <div id="left_menu" class="left_menu">
                            <div class="title">
                                <div>家电馆<span class="iconfont icon-youjiantou1"></span></div>
                                <div>家电专卖店<span class="iconfont icon-youjiantou1"></span></div>
                                <div>家电服务<span class="iconfont icon-youjiantou1"></span></div>
                                <div>企业采购<span class="iconfont icon-youjiantou1"></span></div>
                                <div>商用电器<span class="iconfont icon-youjiantou1"></span></div>
                                <div>以旧换新<span class="iconfont icon-youjiantou1"></span></div>
                            </div>
                            <%--<div  class="content">--%>
                                <%--<div class="first_word">--%>
                                    <%--<span>电视</span><span class="iconfont icon-youjiantou1"></span>--%>
                                <%--</div>--%>
                                <%--<div class="next">--%>
                                    <%--<div class="last_word">--%>
                                        <%--<div class="word"><a style="color: #666;text-decoration: none;" href="page\goods_list\商品列表页面.html">超薄电视</a> </div>--%>
                                        <%--<div class="word">全面屏电视 </div>--%>
                                        <%--<div class="word">智能电视 </div>--%>
                                        <%--<div class="word">教育电视 </div>--%>
                                        <%--<div class="word">OLED电视 </div>--%>
                                        <%--<div class="word">智慧屏 </div>--%>
                                        <%--<div class="word">4K超清电视 </div>--%>
                                        <%--<div class="word">55英寸 </div>--%>
                                        <%--<div class="word">65英寸 </div>--%>
                                        <%--<div class="word">电视配件 </div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                        <div class="right_menu">
                            <div class="right_top">
                                <img src="https://img12.360buyimg.com/vclist/s166x70_jfs/t1/59149/30/6380/3749/5d438e05Eaf28a961/15d67b12d4cf885d.jpg.webp">
                                <img src="https://img14.360buyimg.com/vclist/s166x70_jfs/t1/90641/24/3606/1171/5de0e340Eaad1e3e0/5b9cad64436c05ff.jpg.webp">
                                <img src="https://img14.360buyimg.com/vclist/s166x70_jfs/t1/65433/38/11892/6801/5d91c3f9Ed3503256/099e6109911be678.jpg.webp">
                                <img src="https://img11.360buyimg.com/vclist/s166x70_jfs/t3211/96/3882705424/5364/76e60d4a/57f9fa89N6ddb14fc.jpg.webp">
                                <img src="https://img13.360buyimg.com/vclist/s166x70_jfs/t2587/271/1840897889/3013/d15dee81/574c0755Nc8f19944.jpg.webp">
                                <img src="https://img12.360buyimg.com/vclist/s166x70_jfs/t1/18168/12/13678/6403/5ca17568E9e98402d/823e24e3a2acd047.jpg.webp">
                                <img src="https://img13.360buyimg.com/vclist/s166x70_jfs/t1/92745/8/17173/3678/5e83669dE75a80107/ca6ea1c6b558aa07.jpg.webp">
                                <img src="https://img12.360buyimg.com/vclist/s166x70_jfs/t1/20167/31/8667/2542/5c7899aeE5a38be51/890312111d77e347.jpg.webp">
                            </div>
                            <div class="right_bottom">
                                <img src="https://img10.360buyimg.com/vclist/s336x268_jfs/t1/140591/39/6082/9834/5f3f2515E0e9252a1/fd331a59fb79ab80.jpg.webp">
                                <img src="https://img14.360buyimg.com/vclist/s336x268_jfs/t1/28834/20/1203/14780/5c106c45E801c0162/331a9c8fdb4a4e34.jpg.webp">
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
            <div id="banner">
                <!-- 这里面的都是轮播图的东西 -->
                <div id="up_img" class=" iconfont icon-youjiantou1"></div>
                <div id="next_img" class=" iconfont icon-youjiantou1"></div>
                <div id="hover_a">
                    <a hover='0' class="iconfont icon-yuandian"></a>
                    <a hover='1' class="iconfont icon-yuandian"></a>
                    <a hover='2' class="iconfont icon-yuandian"></a>
                    <a hover='3' class="iconfont icon-yuandian"></a>
                    <a hover='4' class="iconfont icon-yuandian"></a>
                    <a hover='5' class="iconfont icon-yuandian"></a>
                    <a hover='6' class="iconfont icon-yuandian"></a>
                    <a hover='7' class="iconfont icon-yuandian"></a>
                </div>
            </div>
            <div id="banner_menu">
                <div class="flex_div">
                    <div class="img img0"></div>
                    <div class="img img1"></div>
                    <div class="img img2"></div>
                    <div id="up_menu" class=" iconfont icon-youjiantou1"></div>
                    <div id="down_menu" class=" iconfont icon-youjiantou1"></div>
                </div>
            </div>
            <div id="banner_info">
                <div class="flex_info">
                    <div class="info_top">
                        <div class="text_login">
                            <img class='icon'
                                src="data:image/png;base64,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">
                            <div>
                                <span>Hi~欢迎逛京东！</span>
                                <span><a href="#">登录</a>|<a href="#">注册</a></span>
                            </div>
                        </div>
                        <div class="btn">
                            <div class="new">新人福利</div>
                            <div class="member">PLUS会员</div>
                        </div>
                    </div>
                    <div class="info_center">
                        <div class="info_title">
                            <span>京东快报</span>
                            <span>更多<span class="iconfont icon-youjiantou1"></span></span>
                        </div>
                        <div class="info_content">
                            <div>
                                <span class="red_text">热议</span>
                                <span>积善书法装饰画,艺...</span>
                            </div>
                            <div>
                                <span class="red_text">最新</span>
                                <span>什么是宝宝,"转奶"...</span>
                            </div>
                            <div>
                                <span class="red_text">热评</span>
                                <span>360°无死角吸尘,...</span>
                            </div>
                            <div>
                                <span class="red_text">HOT</span>
                                <span>传承百年的高端家电...</span>
                            </div>
                        </div>
                    </div>
                    <div id="info_bottom">
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/30057/19/14881/720/5cbf064aE187b8361/eed6f6cbf1de3aaa.png">
                            <span>花费</span>
                        </div>
                        <div class="jipiao">
                            <div><img src="https://m.360buyimg.com/babel/jfs/t1/36478/38/5384/2901/5cbf065aEb0c60a12/afb4399323fe3b76.png">
                            <span>机票</span>
                        </div>
                            <div class="jipiao_re">热</div>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/31069/34/14642/979/5cbf0665Ec7dc8223/5fee386254dd2ebc.png">
                            <span>酒店</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/32403/22/14829/3699/5cbf0674E04723693/caa83ce9b881cd24.png">
                            <span>游戏</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/71890/14/9897/3048/5d7739ddE93eb94f8/f1f6dc5c207329f9.png">
                            <span>加油卡</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/45761/32/10307/1581/5d7739e2Ece4b6671/0004c1b85fbf7bde.png">
                            <span>火车票</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/51584/31/10221/1685/5d7739e7E1adb25cd/1d0957d7f2ae01a2.png">
                            <span>众筹</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/52683/35/10394/3447/5d7739edE270aa7b3/d4d1151b09b5553b.png">
                            <span>理财</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/56296/3/10260/1443/5d7739f3E233abc53/e6976f3cb30c9a8a.png">
                            <span>白条</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/60778/37/9838/3066/5d7739faEd3b7dbb9/dd4d9ef7ce8fc169.png">
                            <span>电影票</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/40738/20/14562/826/5d773a01E09eb8121/d6f3909618c6307a.png">
                            <span>企业购</span>
                        </div>
                        <div>
                            <img src="https://m.360buyimg.com/babel/jfs/t1/57014/6/10297/815/5d773a07Ec7a61fc9/97917a2daa34be0f.png">
                            <span>礼品卡</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/network.js"></script>
    <script>
        $(function()
        {
            function sortRule(a,b) {//这个是用来数组排序的数组函数
                return a.cparent- b.cparent;
            }
                //下面的函数是封装的promise用来发送ajax请求的,获取一级菜单的数据
                new network("CategoryServlet",{"action":"getLevelCategory","cparent":-1}).then(function (result) {
                    var htmltext='';
                    for (var i=0;i<result.length;i++)
                    {
                        htmltext+='<li cid="'+result[i].cid+'"><a class="one_a" href="#" >'+result[i].cname+'</a></li>'
                    }
                    $('#leftmenu').append($(htmltext));
                    //这里只是把电视的种类给渲染出来，其他种类的就不渲染出来了
                    var content_html=``;
                    $('#leftmenu li').mouseenter(function () {//当一级菜单的标签滑动的时候会根据一级菜单来读取二级菜单的项目
                        content_html=``;
                        var cid=$(this).attr("cid");
                        var cname=$(this).html();
                         new network("CategoryServlet",{"action":"getLevelCategory","cparent":cid,"clevel":2})//用来获取二级菜单的数据
                             .then(function (result1) {
                                 var arr=[];
                                 for (var j=0;j<result1.length;j++)
                                 {
                                     arr[j]=result1[j].cid;
                                 }
                             new network("CategoryServlet",{"action":"selectLevelByGroup","cparentArr":JSON.stringify(arr)}).then(function (result2) {
                                 var is_first=true;//用来获取三级菜单的数据,用sql查询语句select * from categorys in (二级菜单.cid1,二级菜单.cid2,二级菜单.cid3)来查询，这样的效率会快很多
                                 result2.sort(sortRule);//用来排序二级菜单来获取的东西
                                 for (var i=0,j=0;i<result1.length&&j<result2.length;j++)
                                 {
                                     if (result1[i].cid!=result2[j].cparent)
                                     {
                                         content_html+=`</div></div> </div>`;
                                         is_first=true;
                                         i++;
                                     }
                                     if (is_first)
                                     {
                                         content_html+=`<div  class="content">
                                                        <div class="first_word">
                                                            <span>`+result1[i].cname+`</span><span class="iconfont icon-youjiantou1"></span>
                                                        </div>
                                                        <div class="next">
                                                            <div class="last_word">`;
                                         is_first=false;
                                     }
                                         content_html+=`<div class="word"><a style="color: #666;text-decoration: none;"  href="ProductServlet?action=getPageByQuery&target=/admin/product/Productlist&searchCondition=上架&requestPage=1&perPageRecordCount=8&cid=`+result2[j].cid+`">`+result2[j].cname+`</a></div>`;
                                 }
                                 // document.querySelector('#left_menu').innerHTML=content_html;
                                 // // console.log(document.querySelector('#left_menu').innerHTML);
                                 $('#left_menu .content').remove();
                                 $('#left_menu').append(content_html);
                             });
                         });
                    })
                });
        });
    </script>
</html>