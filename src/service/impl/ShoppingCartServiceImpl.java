package service.impl;

import dao.impl.ProductDaoImpl;
import dao.inner.ProductDao;
import service.inner.ShoppingCartService;
import vo.Products;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;

public class ShoppingCartServiceImpl implements ShoppingCartService {
    private ProductDao pd=new ProductDaoImpl();
    @Override
    public void addToCart(HttpSession session, String pid, int modify) {
        try {
            //通过商品编号获取商品信息并加入购物车
            Products p =pd.getOneById(Integer.parseInt(pid),Products.class);
            ArrayList<Products> list= (ArrayList<Products>) session.getAttribute("productsList");
            if (list==null)
            {
                list=new ArrayList<>();
                p.setShoppingCartSum(modify);
                list.add(p);
                session.setAttribute("productsList",list);
            }else{
                boolean flag=true;
                //在购物车里面找有没有这个商品的信息，有的话就+1，没有的话就添加进去
                Iterator iters=list.iterator();
                while (iters.hasNext())
                {
                    Products pts= (Products) iters.next();
                    if (pts.getPid().equals(p.getPid()))
                    {
                        pts.setShoppingCartSum(pts.getShoppingCartSum()+modify);
                        flag=false;
                    }
                }
                if (flag)//如果购物车里面没有就设置为这个数量
                {
                    p.setShoppingCartSum(modify);//首先初始化为1,购物车的第一个数量为1
                    list.add(p);
                }
                session.setAttribute("productsList",list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
