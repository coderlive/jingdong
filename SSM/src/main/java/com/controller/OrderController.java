package com.controller;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.inner.CategoryService;
import com.service.inner.OrderDetailService;
import com.service.inner.OrderService;
import com.service.inner.UserService;
import com.util.AlipayConfig;
import com.vo.OrderDetail;
import com.vo.Orders;
import com.vo.Products;
import com.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;
    @RequestMapping("/addOrder")
    private void addOrder(String subject, Integer total_amount, @RequestParam("pids") String pidlist, HttpSession session, HttpServletRequest request, HttpServletResponse response)
    {
        Gson g=new Gson();
        String [] pids=g.fromJson(pidlist,String[].class);
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");//这个是购物车的内容
        ArrayList<Products> config_list=new ArrayList<>();//存储要购买的商品
        Users u= (Users) session.getAttribute("frontuser");
//        Users u= (Users) session.getAttribute("backuser");//暂时先用这个测试
        if (pids==null||list==null||u==null)//要登录，而且购物车有东西，然后有要买的东西
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
        o.setAll_price(total_amount);
        o.setOrder_time(start_time);
        o.setOrders_no(order_no);
        o.setStatus(0);//表示还没有付款，先添加进去
//        o.setOrder_no("11111");
        o.setReceived_address(u.getAddress());
        o.setUserid(u.getUserid());
        try {
            orderService.addOrder(o);
//            Integer oid=os.selectIdByOrderNo("11111");//查出订单的id，然后就开始插入订单明细表了
            Integer oid=orderService.selectIdByOrderNo(order_no);//查出订单的id，然后就开始插入订单明细表了
            for (Products p:config_list)
            {
                OrderDetail od=new OrderDetail();
                od.setPid(p.getPid());
                od.setP(p);
                od.setOrder_sum(p.getShoppingCartSum());
                od.setOid(oid);
                orderDetailService.addOrderDetail(od);
            }
//            session.setAttribute("productsList",list);
            session.setAttribute("pids",pids);
            request.getRequestDispatcher("/zhifubao/toPay?out_trade_no="+order_no+"&total_amount="+total_amount+"&subject="+subject).forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/queryMyOrder")
    public String queryMyOrder(HttpSession session,HttpServletRequest request)
    {
            Users users = (Users) session.getAttribute("frontuser");
            List<Orders> list = orderService.selectOrdersByUserid(users.getUserid());
            request.setAttribute("list",list);
            request.setAttribute("users",users);
        return "frontpage/order/myOrder";
    }
    @RequestMapping("/deleteOrderByOrders_no")//删除订单
    public String deleteOrderByOrders_no(String orders_no,HttpSession session,HttpServletRequest request)
    {
        orderService.deleteOrderByOrders_no(orders_no);
        return queryMyOrder(session,request);
    }
    @RequestMapping("/find")
    public String find(@RequestParam(defaultValue = "1")Integer requestPage, Model m)
    {
        PageInfo pageInfo=new PageInfo(requestPage);
        int totalRecordCount = orderService.getTotalRecordCount();
        pageInfo.setTotalRecordCount(totalRecordCount);
        List<Orders> list = orderService.getAllByPage();
        m.addAttribute("list", list);
        m.addAttribute("pageInfo", pageInfo);
        return "backend/order/orderMain";
    }
    @RequestMapping("/deleteById")
    public String deleteById(@RequestParam(defaultValue = "1")Integer requestPage, Model m,Orders o)
    {
        orderService.deleteById(o);
        return find(requestPage,m);
    }
    @RequestMapping("/getOneForUpdate")
    public String getOneForUpdate(Model m,String searchCondition,@RequestParam(defaultValue = "1")Integer requestPage,Orders o)
    {
         o=orderService.selectOrderById(o);
         m.addAttribute("order",o);
        return "backend/order/updateOrder";
    }
    @RequestMapping("/updateOrder")
    public String updateOrder(Orders orders,Model m)
    {
        orderService.update(orders);
        return find(1,m);
    }
}
