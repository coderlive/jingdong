package com.controller;

import com.service.inner.OrderService;
import com.service.inner.ProductService;
import com.service.inner.ShopCartService;
import com.vo.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;

@Controller
@RequestMapping("/shopcart")
public class ShopController {
    @Autowired
    private ShopCartService shopCartService;
    @Autowired
    private OrderService orderService;
    @RequestMapping("/addToCart")
    public String addToCart(HttpSession session,Integer pid,Integer modify)
    {
        return shopCartService.addToCart(session,pid,modify);
    }
    @RequestMapping("queryShoppingCart")
    public String queryShoppingCart(HttpServletRequest request,HttpSession session)
    {
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");
        if (list!=null&&list.size()!=0)
        {
            request.setAttribute("list",list);
        }
        return "frontpage/cart/shoppingCart";
    }
    @RequestMapping("/buyShop")
    public String buyShop(String out_trade_no,HttpSession session,HttpServletRequest request)
    {
        String []pids= (String[]) session.getAttribute("pids");//已经打算购买的商品
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");//购物车
        Iterator iterator=list.iterator();//用来删除已经购买过的商品
        while (iterator.hasNext())
        {
            Products p= (Products) iterator.next();
            for (String pid : pids) {
                if (Integer.parseInt(pid) == p.getPid()) {
                    iterator.remove();
                }
            }
        }
        orderService.UpdateOrderByOrderNo(out_trade_no,1);//根据商品编号修改订单的状态值
        session.setAttribute("pids",null);
//        session.setAttribute("productsList",list);
        request.setAttribute("out_trade_no",out_trade_no);
        return "frontpage/order/orderResult";
    }
    @RequestMapping("/changeCartCount")
    public void changeCartCount(HttpServletRequest request, HttpServletResponse response)
    {
        Integer pid=Integer.parseInt(request.getParameter("pid"));
        Integer count=Integer.parseInt(request.getParameter("count"));
        HttpSession session=request.getSession();
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");
        if (list!=null&&pid!=null)
        {
//            ListIterator<Products> iterator=list.listIterator();
            for (Products p:list)
                if (p.getPid().equals(pid))//如果相等的话
                {
                    if (count == 0) {//如果数量为0的话就直接删除了
                        list.remove(p);
                    } else {
                        p.setShoppingCartSum(count);//如果数量不为0的话更新购物车
                    }
                }
        }
        session.setAttribute("productsList",list);
    }
}
