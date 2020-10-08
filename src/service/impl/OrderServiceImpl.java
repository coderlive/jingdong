package service.impl;

import dao.impl.OrderDaoImpl;
import dao.inner.OrderDao;
import service.inner.OrderService;
import vo.Orders;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao od=new OrderDaoImpl();
    @Override
    public void addOrder(Orders o) throws Exception {
        od.add(o);
    }

    @Override
    public Integer selectIdByOrderNo(String str) throws Exception {
        String sql="select * from orders where orders_no="+str;
        List<Orders> list=od.getPageByQuery(sql,Orders.class);
        if (list.size()!=0)
        {
            return list.get(0).getOid();
        }
        return null;
    }
}
