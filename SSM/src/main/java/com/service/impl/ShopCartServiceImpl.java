package com.service.impl;

import com.dao.ProductMapper;
import com.service.inner.ShopCartService;
import com.vo.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;

@Service
public class ShopCartServiceImpl implements ShopCartService {
    @Autowired
    private ProductMapper productMapper;
    @Override
    public String addToCart(HttpSession session, Integer pid, Integer modify) {
        try {
            //通过商品编号获取商品信息并加入购物车
            String sql="select * from products where pid="+pid;
            Products p =productMapper.selectBySql(sql);
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
        return "frontpage/cart/addToShoppingCart";
    }
}
