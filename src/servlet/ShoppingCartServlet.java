package servlet;

import org.apache.catalina.Session;
import service.impl.ProductServiceImpl;
import service.impl.ShoppingCartServiceImpl;
import service.inner.ProductService;
import service.inner.ShoppingCartService;
import vo.Products;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(value="/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    private ShoppingCartService sc=new ShoppingCartServiceImpl();
    private ProductService ps=new ProductServiceImpl();
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("addToCart".equals(action)) {
            addToCart(request, response);
        } else if ("queryShoppingCart".equals(action)) {
            queryShoppingCart(request, response);
        }else if("changeCartCount".equals(action))
        {
            changeCartCount(request, response);
        }else if ("buyShop".equals(action))//购买商品
        {
            buyShop(request,response);
        }else if("deleteCartById".equals(action))
        {
            deleteCartById(request,response);
        }
    }

    private void deleteCartById(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("pid");
        Integer pid=Integer.parseInt(id);
        HttpSession session=request.getSession();
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");//购物车
        Iterator it=list.iterator();
        while (it.hasNext())
        {
            Products p= (Products) it.next();
            if (p.equals(pid))
            {
                it.remove();
            }
        }
        try {
            queryShoppingCart(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void buyShop(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        String []pids= (String[]) session.getAttribute("pids");//已经打算购买的商品
        ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");//购物车
        String no_id=request.getParameter("out_trade_no");//获取订单编号

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
        ps.updateProductByOid(no_id,1);//根据商品编号修改订单的状态值
        session.setAttribute("pids",null);
        session.setAttribute("productsList",list);
        request.setAttribute("out_trade_no",no_id);
        try {
            request.getRequestDispatcher("WEB-INF/jsp/admin/order/orderResult.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void changeCartCount(HttpServletRequest request, HttpServletResponse response) {
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

    public void addToCart(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String pid=request.getParameter("pid");
        HttpSession session=request.getSession();
        sc.addToCart(session,pid);//添加商品到购物车
        request.getRequestDispatcher("/WEB-INF/jsp/admin/product/addToShoppingCart.jsp").forward(request,response);
    }

    public void queryShoppingCart(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException {
            HttpSession session=request.getSession();
            ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");
            if (list!=null&&list.size()!=0)
            {
                request.setAttribute("list",list);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/admin/product/shoppingCart.jsp").forward(request,response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doGet(request, response);
    }

}
