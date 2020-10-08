package servlet;

import com.google.gson.Gson;
import service.impl.OrderDetailServiceImpl;
import service.impl.OrderServiceImpl;
import service.inner.OrderDetailService;
import service.inner.OrderService;
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
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private OrderService os=new OrderServiceImpl();
    private OrderDetailService ods=new OrderDetailServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("您执行了"+action+"操作");
        if (action.equals("addOrder")) {
            addOrder(request, response);
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
        Users u= (Users) session.getAttribute("backuser");
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
