<%@ page language="java"
         import="java.util.*,com.vo.Products,com.page.PageInfo"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>平板电视 大 家 电</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/list.css" />
    <script src="jquery-3.1.0.js"></script>
  </head>
  <body>
  <%
    PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
  %>
    <div class="top_title">
      <div class="poit2">
        <span class="iconfont icon-shouye"></span>
        <span class="poit_text">京东首页</span>
      </div>
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
                  <div>
                    <div class="icon"></div>
                    <span class="iconfont"></span>Global Site
                  </div>
                  <div>
                    <div class="icon2"></div>
                    <span class="iconfont"></span>Situs Indonesia
                  </div>
                  <div>
                    <div class="icon3"></div>
                    <span class="iconfont"></span>เว็บไซต์ประเทศไทย
                  </div>
                </div>
                <div class="col">
                  <div>
                    <div class="icon4"></div>
                    <span class="iconfont"></span>Сайт России
                  </div>
                  <div>
                    <div class="icon5"></div>
                    <span class="iconfont"></span>Sitio de Espana
                  </div>
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
        </div>
        <a href="go_backend?target=frontpage/user/register" class="register"> 免费注册</a>
        <ul class="nav">
          <div class="nav-item">
            <li class="spacer"></li>
            <a href="order/queryMyOrder">我的订单</a>
            <li class="spacer"></li>
          </div>
          <div class="nav-item">
            <div class="nav_hover">
              <a href="#"
                >我的京东
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
              <a class="" style="color: #d81b2a" href="#">
                企业采购
                <span class="iconfont icon-jiantou9"></span>
                <ul class="Enepro">
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
              </a>
            </div>
            <li class="spacer"></li>
          </div>
          <div class="nav-item">
            <div class="cus_server nav_hover">
              <a href="#"
                >客户服务
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
              <a class="" href="#"
                >网站导航
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
                    <div class="content_title">行业频道</div>
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
            <div class="phone nav_hover">
              <a href="#">手机京东</a>
              <div class="saoma">
                <div class="content">
                  <div class="left">
                    <img
                      src="https://img12.360buyimg.com/img/jfs/t1/67481/15/565/28110/5cec9234E71c47244/dc4cf353fd96922e.png.webp"
                    />
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
                      src="https://img10.360buyimg.com/img/jfs/t1/133427/32/6189/44062/5f2a5467Efff804d1/7cbc252ed5993190.png.webp"
                    />
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
                      src="https://img14.360buyimg.com/img/jfs/t1/36947/5/10895/15408/5cec924bE6c038530/5cf21582b416c186.jpg.webp"
                    />
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
                      src="https://img13.360buyimg.com/img/jfs/t1/93019/8/17752/28300/5e8c23b8E4c6c7c13/9c45c518ad785873.png.webp"
                    />
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
    <div id="middle">
      <div class="login_img">
        <img src="img/logo.png" width="124px" />
        <div class="top_right">
          <%--<div class="search">--%>

            <%--<span class="iconfont"></span>--%>
            <%--<span class="iconfont sousuo">--%>
                <%--搜索</span>--%>

          <%--</div>--%>
            <div class="search">
                <form id="categoryForm" action="product/getPageByQuery" method="get">
                    <div class="form">
                        <input type="hidden" name="perPageRecordCount" value="8">
                        <input type="hidden" name="target" value="frontpage/product/Productlist">
                        <input type="hidden" name="requestPage" value="${requestPage}">
                        <input type="hidden" name="orderCondition" value="${orderConditionObj.orderCondition}">
                        <input type="hidden" name="ascOrDesc" value="${orderConditionObj.ascOrDesc}">
                        <input type="text" class="text" id="searchCondition"
                               name="searchCondition" value="${searchCondition=='上架'||searchCondition=='下架'?'':searchCondition}"/>
                        <input type="hidden" name="cid" value="${product.cid}">
                        <button type="submit" class="sousuo">
                            <i></i> 搜索
                        </button>

                    </div>
                </form>
            </div>
          <div class="mycart">
            <span class="iconfont icon-shuzi-"></span>
            <span class="iconfont icon-icon-"></span>
            <span class="cart_text">
                <a href="shopcart/queryShoppingCart">我的购物车</a>
            </span>

            <div class="cart_null">
              <div class="cart_null_text">购物车中还没有商品，赶紧选购</div>
            </div>
          </div>
          <div class="search_bottom">
            <span>平板电视</span> <span>|</span> <span>电视机</span
            ><span>|</span> <span>平板电视65寸</span><span>|</span>
            <span>冰箱</span><span>|</span> <span>平板电视 55寸</span
            ><span>|</span> <span>平板电视75寸</span><span>|</span>
            <span>海信电视</span><span>|</span> <span>洗衣机</span
            ><span>|</span>
          </div>
        </div>
      </div>
    </div>
    <div id="middle_menu">
      <div class="menu_all_product">
        <span>全部商品分类</span>
      </div>
      <div class="top_nav">
        <div class="flex_nav">
          <span>京东时尚</span>
          <span>美妆馆</span>
          <span>超市</span>
          <span>生鲜</span>
          <span>京东国际</span>
          <span>闪购</span>
          <span>拍卖</span>
          <span>金融</span>
        </div>
      </div>
    </div>
    <div class="fengexian"></div>
    <div id="product_details">
      <div class="re_hot">
        <div class="re_hot_title">
          热卖推荐
          <div class="xw">
            <a href="">
              <img
                src="https://img12.360buyimg.com/n4/jfs/t1/126025/22/13751/119739/5f7190ffE8c81889d/aa7ae73878730400.jpg"
                width="90"
                height="90"
                data-img="1"
                class="err_product"
              />
            </a>
            <a href="" class="p_name"
              >希沃seewo55英寸会议平板电视4k超高清智能触屏</a
            >
            <div class="p_price">
              <strong>￥4599.00</strong>
            </div>
            <div class="p_btn">
              <a href="" class="btn-default">立即抢购</a>
            </div>
          </div>
          <div class="hx">
            <a href="">
              <img
                src="https://img12.360buyimg.com/n4/jfs/t1/136428/40/9548/95039/5f5b34b0Eb1e9432c/eee5ddc24737c088.jpg"
                width="90"
                height="90"
                data-img="1"
                class="err_product"
              />
            </a>
            <a href="" class="p_name"
              >海信 VIDAA 43V1F-R 43英寸 全高清 海信电视 全</a
            >
            <div class="p_price">
              <strong>￥1199.00</strong>
            </div>
            <div class="p_btn">
              <a href="" class="btn-default">立即抢购</a>
            </div>
          </div>
          <div class="aoc">
            <a href="">
              <img
                src="https://img12.360buyimg.com/n4/jfs/t1/139532/35/7955/120736/5f587fc0Ebffb7dfd/0d4734db1e922b3d.jpg"
                width="90"
                height="90"
                data-img="1"
                class="err_product"
              />
            </a>
            <a href="" class="p_name">AOC 游戏电视 55G2X 55英寸 4K超高清 HDR</a>
            <div class="p_price">
              <strong>￥3099.00</strong>
            </div>
            <div class="p_btn">
              <a href="" class="btn-default">立即抢购</a>
            </div>
          </div>
          <div class="jav">
            <a href="">
              <img
                src="https://img12.360buyimg.com/n4/jfs/t1/127694/12/13850/65913/5f71b83cE15f0c387/54bb5bdfe2c51b59.jpg"
                width="90"
                height="90"
                data-img="1"
                class="err_product"
              />
            </a>
            <a href="" class="p_name"
              >JAV会议平板电视机一体机75英寸智慧屏大屏幕交</a
            >
            <div class="p_price">
              <strong>￥13699.00</strong>
            </div>
            <div class="p_btn">
              <a href="" class="btn-default">立即抢购</a>
            </div>
          </div>
        </div>
      </div>
      <div class="household">
        <a href="" class="household_text">家用电器</a>
        <i>></i>
        <div class="box1">
          <span class="box1_text">大家电</span>
          <div class="box1_content">
            <div class="row row_point">
              <div class="col">
                <div>厨卫大电</div>
                <div>生活电器</div>
                <div>家电服务</div>
              </div>
              <div class="col">
                <div>大 家 电</div>
                <div>个护健康</div>
                <div>家电配件</div>
              </div>
              <div class="col">
                <div>厨房小电</div>
                <div>商用电器</div>
                <div>视听影音</div>
              </div>
            </div>
          </div>
        </div>
        <i>></i>
        <div class="box2">
          <span class="box2_text">平板电视</span>
          <div class="box2_content">
            <div class="row row_point">
              <div class="col">
                <div>平板电视</div>
                <div>冰箱</div>
                <div>酒柜</div>
                <div>烘干机</div>
              </div>
              <div class="col">
                <div>空调</div>
                <div>洗衣机</div>
                <div>移动空调</div>
              </div>
              <div class="col">
                <div>中央空调</div>
                <div>冷柜/冰吧</div>
                <div>洗烘套餐</div>
              </div>
            </div>
          </div>
        </div>
        <i>></i>
        <div class="box3">
          <div>电视类型：</div>
          <div class="chaobo">超薄</div>
          <i></i>
        </div>
      </div>
      <div class="pinpai">
        <div class="pinpai_left">
          <div class="pinpai_left_text">品牌：</div>
        </div>
        <div class="pinpai_right">
          <div class="xiaomi">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t1/116429/35/16248/2817/5f485fa4E326bdf8f/b7d19a346c4e45de.jpg"
              class="lg_product"
            />
          </div>
          <div class="chuangwei">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/53478/21/9148/4976/5d68e51dE84132ea9/4dc268e67891cceb.png"
              class="lg_product"
            />
          </div>
          <div class="his">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t19360/352/2305554545/5388/7fed869c/5aefeb9bN1c82297b.jpg"
              class="lg_product"
            />
          </div>
          <div class="tcl">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/63000/25/8406/2925/5d662e3dEcc56c740/a83f0c21f8055aa0.jpg"
              class="lg_product"
            />
          </div>
          <div class="sony">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t1/175/26/11602/2671/5bce70a1Ecd95c076/4d7f4f80f80c5a1c.jpg"
              class="lg_product"
            />
          </div>
          <div class="konka">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/39450/35/11890/1756/5d8b1ba9E5c839db8/735009863988f8b0.jpg"
              class="lg_product"
            />
          </div>
          <div class="haier">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t1/115581/36/16383/5762/5f485d44E0e17ef4b/abbba3781121c2ff.jpg"
              class="lg_product"
            />
          </div>
          <div class="ch">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t17380/273/1313127713/1697/2349a521/5ac43b77N3610f12d.jpg"
              class="lg_product"
            />
          </div>
          <div class="huawei">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t1/132808/6/8420/2045/5f486e43E8ff5f3a1/62b97e5188766c42.png"
              class="lg_product"
            />
          </div>
          <div class="ss">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/1534/38/9873/3556/5bc93df2E73c40121/74dc92d16e483509.jpg"
              class="lg_product"
            />
          </div>
          <div class="flp">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t1/5932/28/11176/6002/5bce822bE4be57b0c/162d6a5b24eb2ab7.jpg"
              class="lg_product"
            />
          </div>
          <div class="coocqq">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1849/48/2195708324/3504/f65c0be6/56c28cc9N5415458b.jpg"
              class="lg_product"
            />
          </div>
          <div class="sharp">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t2458/315/2153417538/12751/2ff4e617/56b15fe9Naae1551d.jpg"
              class="lg_product"
            />
          </div>
          <div class="songxia">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/10606/35/12354/6325/5c78e9ebEf1a1bc4d/94d33301e1fc0753.jpg"
              class="lg_product"
            />
          </div>
          <div class="maxhub">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t5905/118/7093411839/1419/2d141222/5979ac31N812aa53a.jpg"
              class="lg_product"
            />
          </div>
          <div class="vidaa">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/28728/20/11312/6662/5c8f5b37Eafb5c6d9/3fe0776c7ce64195.jpg"
              class="lg_product"
            />
          </div>
          <div class="lg">
            <img
              src="https://img30.360buyimg.com/popshop/jfs/t2830/42/1246856630/3519/736447b0/5739678aN679faf0d.jpg"
              class="lg_product"
            />
          </div>
          <div class="letv">
            <img
              src="https://img20.360buyimg.com/popshop/jfs/t1/15988/25/5631/4251/5c402bc9Eb02ec6e4/e4c0a1ce16bd0d95.jpg"
              class="lg_product"
            />
          </div>
        </div>
        <div class="pinpai_right_btn1">
          <div>更多</div>
          <i></i>
        </div>
        <div class="pinpai_right_btn2">
          <div>多选</div>
          <i></i>
        </div>
      </div>
      <div class="chicun">
        <div class="chicun_left">
          <div class="chicun_left_text">屏幕尺寸：</div>
        </div>
        <div class="chicun_right">
          <div class="chicun_right_text">
            <div>78英寸及以上</div>
            <div>70-75英寸</div>
            <div>65英寸</div>
            <div>58-60英寸</div>
            <div>55英寸</div>
            <div>48-50英寸</div>
            <div>39-45英寸</div>
            <div>32英寸及以下</div>
          </div>
        </div>
        <div class="chicun_right_btn1">
          <div>更多</div>
          <i></i>
        </div>
      </div>
      <div class="nengxiao">
        <div class="nengxiao_left">
          <div class="nengxiao_left_text">能效等级：</div>
        </div>
        <div class="nengxiao_right">
          <div class="nengxiao_right_text">
            <div>一级能效</div>
            <div>二级能效</div>
            <div>三级能效</div>
            <div>无能效等级</div>
          </div>
        </div>
      </div>
      <div class="fenbianlv">
        <div class="fenbianlv_left">
          <div class="fenbianlv_left_text">分辨率：</div>
        </div>
        <div class="fenbianlv_right">
          <div class="fenbianlv_right_text">
            <div>8K超高清（7680×4320）</div>
            <div>4k超高清（3840×2160）</div>
            <div>全高清（1920×1080）</div>
            <div>高清（1366×768）</div>
            <div>1024×600</div>
          </div>
        </div>
        <div class="fenbianlv_right_btn1">
          <div>更多</div>
          <i></i>
        </div>
      </div>
      <div class="gaoji">
        <div class="gaoji_left">
          <div class="gaoji_left_text">高级选项：</div>
        </div>
        <div class="gaoji_right">
          <div class="gaoji_right_box1">
            <span class="gaoji_right_box1_text">品牌类型</span>
            <div class="gaoji_right_box1_content">
              <div class="row row_point">
                <div class="col">
                  <div>合资品牌</div>
                </div>
                <div class="col">
                  <div>国产品牌</div>
                </div>
                <div class="col">
                  <div>互联网品牌</div>
                </div>
                <div class="col">
                  <div>商业显示品牌</div>
                </div>
              </div>
            </div>
          </div>
          <div class="gaoji_right_box2">
            <span class="gaoji_right_box2_text">观看距离</span>
            <div class="gaoji_right_box2_content">
              <div class="row row_point">
                <div class="col">
                  <div>3.5m以上（70英寸以上）</div>
                </div>
                <div class="col">
                  <div>3m-3.5m（56-65英寸）</div>
                </div>
                <div class="col">
                  <div>2.5m-3m（46-55英寸）</div>
                </div>
                <div class="col">
                  <div>2m-2.5m（33-45英寸）</div>
                </div>
                <div class="col">
                  <div>2m以下（≤32英寸）</div>
                </div>
              </div>
            </div>
          </div>
          <div class="gaoji_right_box3">
            <span class="gaoji_right_box3_text">用户优选</span>
            <div class="gaoji_right_box3_content">
              <div class="row row_point">
                <div class="col">
                  <div>京品电视</div>
                </div>
                <div class="col">
                  <div>新品电视</div>
                </div>
              </div>
            </div>
          </div>
          <div class="gaoji_right_box4">
            <span class="gaoji_right_box4_text">产品渠道</span>
            <div class="gaoji_right_box4_content">
              <div class="row row_point">
                <div class="col">
                  <div>线下同款</div>
                </div>
                <div class="col">
                  <div>线上专供</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="product_list">
        <div class="advert">
          <div class="advert_title">
            <span>商品精选</span>
          </div>
          <div class="jva">
            <div class="jva_img">
              <a href="">
                <img
                  src="https://img13.360buyimg.com/cms/s190x190_jfs/t1/149399/4/9158/77769/5f6ae515Ec52c2ebc/42dc51bdb5716d4f.jpg"
                />
              </a>
            </div>
            <a class="p_name">JAV会议平板电视机多媒体教学一体机55英寸</a>
            <div class="p_price">￥3699.00</div>
            <div class="p_review">已有<a href="">1200+</a>人评价</div>
          </div>
          <div class="aoc">
            <div class="aoc_img">
              <a href="">
                <img
                  src="https://img13.360buyimg.com/cms/s190x190_jfs/t1/116136/9/17396/112311/5f587f72E34fc94d0/de047a62097496df.jpg"
                />
              </a>
            </div>
            <a class="p_name">AOC 游戏电视 65G2X 65英寸 4K超高清 HDR</a>
            <div class="p_price">￥3999.00</div>
            <div class="p_review">已有<a href="">90+</a>人评价</div>
          </div>
          <div class="vih">
            <div class="vih_img">
              <a href="">
                <img
                  src="https://img13.360buyimg.com/cms/s190x190_jfs/t1/139950/15/9113/232725/5f6c63b9E26bf1f21/673a60c1f472b13b.jpg"
                />
              </a>
            </div>
            <a class="p_name">VIH 100 110 120 130 英寸液晶电视平板彩电</a>
            <i class="goods_icons" title="购买本商品送赠品">赠品</i>
            <div class="p_price">￥129999.00</div>
            <div class="p_review">已有<a href="">20+</a>人评价</div>
          </div>
          <div class="vih2">
            <div class="vih2_img">
              <a href="">
                <img
                  src="https://img13.360buyimg.com/cms/s190x190_jfs/t1/132457/8/9870/139518/5f5f3ee8Efdbb7eed/7f0014d8d2e5aaa2.jpg"
                />
              </a>
            </div>
            <a class="p_name">ViH 领小米音箱智能语音4K网络平板液晶电视</a>
            <i class="goods_icons" title="购买本商品送赠品">赠品</i>
            <div class="p_price">￥13398.00</div>
            <div class="p_review">已有<a href="">10+</a>人评价</div>
          </div>
        </div>
        <div class="p_details">
          <div class="zonghe_title">
            <div class="box1">
              <span class="box1_text f-sort">
                <a id="price" class="up"
                   href="javascript:void(0)">
                  <span>价格</span>
                  <b class="orderArrow"></b>
                </a>
              </span>
            </div>
            <div class="box2">
              <span class="box2_text f-sort">
                <a id="xiao_liang" class="down">
                  <span>销量</span>
                  <b class="orderArrow"></b>
                </a>
              </span>
            </div>
            <div class="box3">
              <span class="box3_text f-sort">
                <a id="pingjia_sum" class="down">
                  <span>评论数</span>
                  <b class="orderArrow"></b>
                </a>
              </span>
            </div>
            <div class="box4" style="visibility: hidden">
              <span class="box4_text">

                  <span>评论数</span>

                </a>
              </span>
            </div>
            <div class="box5" style="visibility: hidden">
              <span class="box5_text">

                  <span>评论数</span>

                </a>
              </span>
            </div>
            <div class="price_extent">
              <input type="text" placeholder="￥" class="area" />
              -
              <input type="text" placeholder="￥" class="area" />
              <div class="p_extent">
                <div class="cp">
                  <input type="text" placeholder="￥" class="area" />
                  -
                  <input type="text" placeholder="￥" class="area" />
                  <div class="cp_text">清空</div>
                  <div class="cp_btn">
                    <button>确定</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="count_text">共8100+ 件商品</div>
            <div class="page_text"><b><%=pageInfo.getCurrentPage()%></b>
              <em>/</em> <i><%=pageInfo.getTotalPageCount()%></i></div>
            <div class="btn_left">
              <div class="zuo" ><a href="ProductServlet?action=getPageByQuery&target=/admin/product/Productlist&target=/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>">＜</a></div>
            </div>
            <div div class="btn_right">
              <div class="you" ><a href="ProductServlet?action=getPageByQuery&target=/admin/product/Productlist&target=/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>">＞</a></div>
            </div>
          </div>
          <div class="peisong_title">
            <div class="peisong_text">配送至</div>
            <div class="box">
              <span class="box_text">广西河池市宜州区</span>
              <div class="box_content">
                <div class="row row_point">
                  <div class="col">
                    <div>北山镇</div>
                    <div>德胜镇</div>
                    <div>洛东镇</div>
                    <div>三岔镇</div>
                  </div>
                  <div class="col">
                    <div>北牙瑶族乡</div>
                    <div>福龙瑶族乡</div>
                    <div>洛西镇</div>
                    <div>同德乡</div>
                  </div>
                  <div class="col">
                    <div>屏南乡</div>
                    <div>怀远镇</div>
                    <div>龙头乡</div>
                    <div>祥贝乡</div>
                  </div>
                  <div class="col">
                    <div>石别镇</div>
                    <div>刘三姐镇</div>
                    <div>庆远镇</div>
                    <div>安马乡</div>
                  </div>
                </div>
              </div>
            </div>
            <div class="ckbox">
              <input type="checkbox" ><span class="ckbox_text">京东物流</span></input>
            </div>
            <div class="ckbox2">
              <input type="checkbox" ><span class="ckbox2_text">货到付款</span></input>
            </div>
            <div class="ckbox3">
              <input type="checkbox" ><span class="ckbox3_text">仅显示有货</span></input>
            </div>
            <div class="ckbox4">
              <input type="checkbox" ><span class="ckbox4_text">京东国际</span></input>
            </div>
            <div class="ckbox5">
              <input type="checkbox" ><span class="ckbox5_text">新品</span></input>
            </div>
            <div class="ckbox6">
              <input type="checkbox" ><span class="ckbox6_text">PLUS专享</span></input>
            </div>
          </div>

          <div class="clearfix">
    <c:forEach var="p" items="${list}">
            <div class="p_one">
              <div class="p_img">
                <a href="product/selectOne?pid=${p.pid}&target=frontpage/product/productDetail">
                  <img width="220" height="220px" src="img/productImage/${p.product_list_large_image}" />
                </a>
              </div>
              <div class="p_price">￥${p.price}</div>
              <div class="p_name">
                <a target="_blank" title="【咨询客服有惊喜】32吋小巨人网络智能款|精细画质，震撼音效|易学在线教育|防蓝光，健康学习|海量影视资源|丰富接口，连接多种设备！另有32吋全面屏新品上市" href="">
								<em>${p.pname}</em>
              </a>
            </div>
            <div class="p_desc">${p.pdesc}</div>
              <div class="p_commit">
                <div class="pj">${p.pingjia_sum}万+条评价</div>

              </div>
              <div class="dianpu">
                <a target="_blank" href="" title="KKTV电视京东自营旗舰店">${p.dianpu_name}</a>
              </div>
              <div class="p_icons">
                <i class="goods_icons" title="京东自营，品质保证">自营</i>
                <i class="goods_icons2" title="品质服务，放心购物">放心购</i>
              </div>
              <div class="p_operate">
                <a href="" class="p_o_btn">
                  <i><div class="p_o_text">对比</div></i>
                </a>
                <a href="" class="p_o_btn2">
                  <i></i>
                  <div class="p_o_text2">关注</div>
                </a>
                <a href="" class="p_o_btn3">
                  <i></i>
                  <div class="p_o_text3">加入购物车</div>
                </a>
              </div>
            </div>
    </c:forEach>
          </div>

          <div class="page">
            <div class="p-wrap">
									<span class="p-num">
									<a id="previous" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=pageInfo.getPreviousPage()%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}" class="pn-prev">
										<i><</i>
										<em>上一页</em>
									</a>

									<%
                                      int totalPageCount = pageInfo.getTotalPageCount();
                                      int currentPage = pageInfo.getCurrentPage();
                                      if(totalPageCount<=10){
                                        //全部打印出来
                                        for(int i=1;i<=totalPageCount;i++){
                                    %>
												<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=i%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=i%></a>
									<%
                                      }


                                    }else{
                                      //当前页的样式为 class="curr"
                                      //打印一部分

                                      if(currentPage<=5){
                                        //从1开始打印 打印到 当前页数 + 2页
                                        for(int i=1;i<=currentPage+2;i++){
                                    %>
													<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=i%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=i%></a>
									<%
                                      }
                                    %>
                                      <!--  打印..-->
												<b class="pn-break">...</b>
                                      <!-- 打印最后一页(即总共的页数) -->
												<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=totalPageCount%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=totalPageCount%></a>
									<%
                                    }else if(currentPage<totalPageCount-3){//当前页<总页数-3   8
                                    %>
                                      <!--始终打印10个
                                      先打印1  和 ..  -->
												<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=1&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}">1</a>
												<b class="pn-break">...</b>
									<%
                                      //从当前页-3 开始打印  打印到当前页+2
                                      for(int i=currentPage-3;i<=currentPage+2;i++){
                                    %>
													<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=i%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=i%></a>
									<%
                                      }
                                    %>
                                      <!--  打印 ..  和最后一页-->
												<b class="pn-break">...</b>
												<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=totalPageCount%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=totalPageCount%></a>
									<%
                                    }else {//8

                                    %>
                                      <!-- 先 打印 1 和 .. -->
												<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=1&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}">1</a>
												<b class="pn-break">...</b>
									<%
                                      //再打印 当前页-3 到剩下的
                                      for(int i=currentPage-3;i<=totalPageCount;i++){
                                    %>
													<a pageNum="pageNum" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&cid=${product.cid}&requestPage=<%=i%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}"><%=i%></a>
									<%
                                          }
                                        }



                                      }

                                    %>

									<a id="next" href="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>&ascOrDesc=${orderConditionObj.ascOrDesc}&orderCondition=${orderConditionObj.orderCondition}" class="pn-prev">
										<em>下一页</em>
										<i>></i>
									</a>
								</span>



              <span class="p-skip">
									<form id="productForm2" action="product/getPageByQuery?target=frontpage/product/Productlist&perPageRecordCount=8&cid=${product.cid}&searchCondition=${searchCondition}&cid=${product.cid}&ascOrDesc=${orderConditionObj.ascOrDesc}" method="post">
									<em>共<b><%=totalPageCount%></b>页&nbsp;&nbsp;到第</em>
										<input type="hidden" name="totalPageCount" value="<%=totalPageCount%>"/>
									<input class="input-txt" type="text" name="requestPage" id="requestPage" value="<%=pageInfo.getCurrentPage()%>" /><em>页</em>
									<a id="submitProductForm2Link" href="javascript:void(0)" class="btn btn-default">确定</a>
									</form>
								</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            var $dl = $("#settleup-2014>div.dorpdown-layer");
            $("#settleup-2014>div.cw-icon").hover(function () {
                $(this).css("background-color", "#FFF")
                $dl.show();
            }, function () {
                $(this).css("background-color", "#F9F9F9")
                $dl.hide();
            });

            var $plistItem = $("#plist .ps-main li");
            var $plistMIObj = $("#plist ul li .p-img a img");
            $plistItem.mouseover(function () {
                $(this).siblings().find("a").removeClass("plsm_curr");
                $(this).find("a").addClass("plsm_curr");
                $plistMIObj.get(0).src = $(this).find("img").get(0).src;

            });

            var $pgpObj = $("#plist  .gl-item .p-focus");

            var $plggObj = $("#plist .gl-item .gl-i-wrap").hover(
                function () {

                    $(this).find(".p-focus").css("visibility", "visible")
                        .fadeIn(200);
                },
                function () {
                    $(this).find(".p-focus").css("visibility", "hidden")
                        .fadeOut(100);
                    //$pgpObj.fadeOut(100);
                });


            //给排序按钮绑定mouseover事件
            $(".filter .f-sort a").mouseover(function () {
                if ($(this).attr("class").indexOf("cur")!=-1) {//不是当前使用的条件 才回悬浮变红
                    $(this).find(":nth-child(2)").css("background-image", "url(img/product/arrow/redDown.png)");
                }


                $(this).siblings(":not([class*='cur'])").find(":nth-child(2)").css("background-image", "url(img/product/arrow/grayDown.png)");


            });


            //京东1.7 修改排序的状态图标
            var orderCondition = "${orderConditionObj.orderCondition}";//price

            var ascOrDesc = "${orderConditionObj.ascOrDesc}";


            var currentA = ".f-sort>a[id='" + orderCondition + "']";
            $(currentA).addClass("cur");//给指定排序的a标签加高亮样式(红色)

            if ("asc" == ascOrDesc) {//如果是升序

                $(currentA).find("b").attr("class", "orderArrow curUp");//添加升序样式


            } else {

                $(currentA).find("b").attr("class", "orderArrow curDown");//添加升序样式


            }


            var lastAscOrDesc = "${orderConditionObj.ascOrDesc}";//asc
            //给价格超链接绑定事件   第一次点击降序 第二次点击升序  第三次降序 第四次 升序  依次类推
            $("#price").click(function () {

                if (lastAscOrDesc == "asc") {//先降序

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=desc&cid=${product.cid}";

                    location.assign(target);
                } else if (lastAscOrDesc == "desc") {

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=price&ascOrDesc=asc&cid=${product.cid}";

                    location.assign(target);
                }

            });
            //销量
            $("#xiao_liang").click(function () {

                if (lastAscOrDesc == "asc") {//先降序

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=xiao_liang&ascOrDesc=desc&cid=${product.cid}";

                    location.assign(target);
                } else if (lastAscOrDesc == "desc") {

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=xiao_liang&ascOrDesc=asc&cid=${product.cid}";

                    location.assign(target);
                }

            });
            //评价
            $("#pingjia_sum").click(function () {

                if (lastAscOrDesc == "asc") {//先降序

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjia_sum&ascOrDesc=desc&cid=${product.cid}";

                    location.assign(target);
                } else if (lastAscOrDesc == "desc") {

                    var target = "product/getPageByQuery?perPageRecordCount=8&target=frontpage/product/Productlist&searchCondition=${requestScope.searchCondition}&requestPage=1&orderCondition=pingjia_sum&ascOrDesc=asc&cid=${product.cid}";

                    location.assign(target);
                }



            });


        })

        function showAll() {
            var e = document.getElementById("all-cat");
            e.style.display = 'block';
        }

        function hidenAll() {
            var e = document.getElementById("all-cat");
            e.style.display = 'none';
        }

        //当前页的数字  变红色
        var $pageA = $("div.page a[pageNum]");

        $pageA.each(function () {

            if ($(this).text() ==
                <%=pageInfo.getCurrentPage()%>
            ) {
                $(this).addClass("curr");
            }

        });

        //给submitProductForm2A超链接绑定事件
        $("#submitProductForm2Link").click(function () {

            //点击这个超链接 提交表单
            $("#productForm2").submit();
        });

        //第一页时 "首页"和上一页不能用

        var currentPage =
            <%=pageInfo.getCurrentPage()%>
        ;
        var totalPageCount =
            <%=pageInfo.getTotalPageCount()%>
        ;
        if (currentPage == 1) {
            $("#fp-prevLink").addClass("disabled");
            $("#previous").addClass("disabled");
        } else if (currentPage == totalPageCount) {
            //最后一页时 "下一页"和"尾页"不能能用
            $("#fp-nextLink").addClass("disabled");
            $("#next").addClass("disabled");
        }
    </script>
  </body>
</html>
