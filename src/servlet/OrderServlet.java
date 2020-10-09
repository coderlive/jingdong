package servlet;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import page.PageInfo;
import service.impl.OrderDetailServiceImpl;
import service.impl.OrderServiceImpl;
import service.impl.UserServiceImpl;
import service.inner.OrderDetailService;
import service.inner.OrderService;
import service.inner.UserService;
import util.AlipayConfig;
import vo.OrderDetail;
import vo.Orders;
import vo.Products;
import vo.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private OrderService os=new OrderServiceImpl();
    private OrderDetailService ods=new OrderDetailServiceImpl();
    private UserService us = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("您执行了"+action+"操作");
        if (action.equals("addOrder")) {
            addOrder(request, response);
        }else if (action.equals("queryMyOrder")){
            queryMyOrder(request,response);
        }else if (action.equals("find")){
            find(request,response);
        }else if(action.equals("getPageByQuery")){
            getPageByQuery(request,response);
        }else if(action.equals("delete")){
            delete(request,response);
        }else  if (action.equals("getOneForUpdate")){
            getOneForUpdate(request,response);
        }else if (action.equals("updateOrder")){
            updateOrder(request,response);
        }else if(action.equals("byone")){
            byone(request,response);
        }else if(action.equals("deleteOrderByOrders_no")){
            deleteOrderByOrders_no(request,response);
        }

    }

    private void addOrder(HttpServletRequest request, HttpServletResponse response) {//添加订单
        Gson g=new Gson();
        String subject=request.getParameter("subject");
        String total_amount=request.getParameter("total_amount");
        String  pidlist=request.getParameter("pids");//将要购买的订单的编号
        String []pids=g.fromJson(pidlist,String[].class);
        HttpSession session=request.getSession();
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");//这个是购物车的内容
        ArrayList<Products> config_list=new ArrayList<>();//存储要购买的商品
        Users u= (Users) session.getAttribute("frontuser");
        if (pids==null||list==null||u==null)
        {
            System.out.println("三者有一个为空");
            return;
        }
        for (String pid:pids)
        {
            for (Products p:list)
            {
                if (Integer.parseInt(pid)==p.getPid())
                {
                    config_list.add(p);
                }
            }
        }
//        String order_no=request.getParameter("out_trade_no");
        String order_no=Long.toString(AlipayConfig.getNumber(18));
        SimpleDateFormat smf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String start_time=smf.format(new Date());
        Orders o=new Orders();
        o.setAll_price(Integer.parseInt(total_amount));
        o.setOrder_time(start_time);
        o.setOrders_no(order_no);
        o.setStatus(0);//表示还没有付款，先添加进去
//        o.setOrder_no("11111");
        o.setReceived_address(u.getAddress());
        o.setUserid(u.getUserid());
        try {
            os.addOrder(o);
//            Integer oid=os.selectIdByOrderNo("11111");//查出订单的id，然后就开始插入订单明细表了
            Integer oid=os.selectIdByOrderNo(order_no);//查出订单的id，然后就开始插入订单明细表了
            for (Products p:config_list)
            {
                OrderDetail od=new OrderDetail();
                od.setPid(p.getPid());
                od.setOrder_sum(p.getShoppingCartSum());
                od.setOid(oid);
                ods.addOrderDetail(od);
            }
//            session.setAttribute("productsList",list);
            session.setAttribute("pids",pids);
            request.getRequestDispatcher("ZhiFuBaoServlet?action=toPay&out_trade_no="+order_no+"&total_amount="+total_amount+"&subject="+subject).forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    protected void byone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orders_no = request.getParameter("orders_no");
        if(orders_no==null||orders_no.equals("")){
            queryMyOrder(request,response);
            return;
        }

        try {
            System.out.println("1");
            List<Orders> list = os.selectOneOrderbyNo(orders_no);
            String userid = list.get(0).getUserid().toString();
            System.out.println("1.0");
            Users users = us.getOneById(userid);
            System.out.println("1.1");
            request.setAttribute("list",list);
            request.setAttribute("users",users);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/product/myOrder.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        //一.填充数据
        Orders order = new Orders();

        Map<String, String[]> ordermap = request.getParameterMap();
        try {
            BeanUtils.populate(order,ordermap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(order);

        //二.调用业务逻辑
        try {
            int a = os.updateOrder(order);
            System.out.println(a);
            request.setAttribute("msg", "修改一级商品种类成功");
            //0.8 搜索功能
            this.getPageByQuery(request,response);
        } catch (Exception e) {
            request.setAttribute("msg", "修改一级商品种类失败");
            e.printStackTrace();
            target = "/WEB-INF/msg.jsp";
            //三.转发视图
            request.getRequestDispatcher(target).forward(request,response);
        }
    }
    protected void getOneForUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        try {
            Orders order = os.selectOneOrder(oid);
            request.setAttribute("order",order);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/jsp/admin/product/updateOrder.jsp").forward(request,response);
    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oid = request.getParameter("oid");
        try {
            int a = os.deleteOrder(oid);
            find(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        //1.填充数据
        String requestPage = request.getParameter("requestPage");
        if(requestPage==null){
            requestPage = "1";
        }
        String searchCondition = request.getParameter("searchCondition");
        System.out.println(searchCondition);
        if (!searchCondition.matches("[0-9]+"))
        {
            find(request,response);
        }
        Orders orders = new Orders();
        if(searchCondition!=null&&!searchCondition.trim().equals("")){
            orders.setOrders_no(searchCondition);
            if(searchCondition.length()<=10) {
                orders.setUserid(Integer.parseInt(searchCondition));
            }
        }
        try {

            PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
            //根据查询条件  查询一共多少条记录
            int totalRecordCount = os.getTotalRecordCount(orders);
            System.out.println(totalRecordCount);
            pageInfo.setTotalRecordCount(totalRecordCount);

            //2.调用业务逻辑
            List<Orders> list = os.getPageByQuery(orders, pageInfo);
            request.setAttribute("list", list);
            request.setAttribute("searchCondition", searchCondition);
            request.setAttribute("pageInfo", pageInfo);
            target = "/WEB-INF/jsp/admin/product/orderMain.jsp";
        } catch (Exception e) {
            request.setAttribute("msg", e.getMessage());
            e.printStackTrace();
            target = "/WEB-INF/msg.jsp";
        }
        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);
    }
    protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        //一.填充数据
        String requestPage = request.getParameter("requestPage");
        //二.调用业务逻辑
        if (requestPage==null||requestPage.equals("")){
            requestPage="1";
        }
        //第1步:
        PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
        try {
            int totalRecordCount = os.getTotalRecordCount();
            pageInfo.setTotalRecordCount(totalRecordCount);
            List<Orders> list = os.getAllByPage(pageInfo);
            request.setAttribute("list", list);
            request.setAttribute("pageInfo", pageInfo);
            target = "/WEB-INF/jsp/admin/product/orderMain.jsp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher(target).forward(request, response);
    }
    protected void queryMyOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String userid = "41";
        String userid = ((Users)request.getSession().getAttribute("frontuser")).getUserid().toString();
        UserService userService = new UserServiceImpl();
        try {
            Users users = us.getOneById(userid);
            List<Orders> list = os.selectOrdersByUserid(userid);
            System.out.println(list);
            request.setAttribute("list",list);
            request.setAttribute("users",users);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/product/myOrder.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    private void deleteOrderByOrders_no(HttpServletRequest request, HttpServletResponse response) {//添加订单

        String orders_no = request.getParameter("orders_no");
        System.out.println(orders_no);
        try {
            os.deleteOrderByOrders_no(orders_no);
            queryMyOrder(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
