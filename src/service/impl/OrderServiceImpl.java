package service.impl;

import dao.impl.DaoImpl;
import dao.impl.OrderDaoImpl;
import dao.inner.Dao;
import dao.inner.OrderDao;
import page.PageInfo;
import service.inner.OrderService;
import vo.OrderDetail;
import vo.Orders;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao od=new OrderDaoImpl();
    @Override
    public void addOrder(Orders o) throws Exception {
        od.add(o);
    }
    @Override
    public int deleteOrderByOrders_no(String  orders_no) throws Exception {
        String sql = "select * from orders where  orders_no = "+ orders_no;
        Dao dao = new DaoImpl();
        Dao dao1 = new DaoImpl();
        List<Orders> list = dao.getPageByQuery(sql,Orders.class);
        Orders orders = list.get(0);
        String ss = "select * from orderdetail where oid = "+orders.getOid();
        List<OrderDetail> list1 = dao1.getPageByQuery(ss,OrderDetail.class);
        System.out.println(list1);
        for(OrderDetail od:list1){
            dao.delete(od);
        }
        return od.delete(orders);
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
    @Override
    public List<Orders> selectOrdersByUserid(String userid) throws Exception {
        String sql = "select * from orders where userid ="+userid;
        return od.getPageByQuery(sql,Orders.class);
    }

    @Override
    public int getTotalRecordCount() throws Exception {

        String sql = "select count(*) from orders";
        return od.getTotalRecordCount(sql);

    }

    @Override
    public List<Orders> getAllByPage(PageInfo pageInfo) throws Exception {
        List<Orders> list = null;
        int perPageRecordCount = 5;

        String sql = "select * from (select c.*,rownum r from Orders c) where r>=" + pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
        System.out.println(sql);

        list = od.getPageByQuery(sql, Orders.class);
        return list;
    }

    @Override
    public int getTotalRecordCount(Orders orders) throws Exception {
        int totalRecordCount = -1;

        //String sql = "select count(*) from category where 1=1 and cname='商品种类名称' or cdesc like '%111%'";
        StringBuffer sb = new StringBuffer("select count(*) from orders where 1=1");
        String userid;
        if(orders.getUserid()==null){
            userid = null;
        }else {
            userid = orders.getUserid().toString();
        }
        String orders_no = orders.getOrders_no();
        if (orders_no != null && !orders_no.trim().equals("")) {
            sb.append(" and orders_no =");
            sb.append(orders_no);
            sb.append("");
        }
        if (userid != null && !userid.trim().equals("")) {
            sb.append(" or userid='");
            sb.append(userid);
            sb.append("'");
        }
        String sql = sb.toString();
        System.out.println(sql);

        totalRecordCount = od.getTotalRecordCount(sql);
        return totalRecordCount;
    }

    @Override
    public List<Orders> getPageByQuery(Orders orders, PageInfo pageInfo) throws Exception {
        List<Orders> list = null;

        // String sql = "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%商品种类描述%') where r>=21 and r<=25";
        StringBuffer sb = new StringBuffer(
                "select * from (select c.*,rownum r from orders c where 1=1");
        String userid;
        if(orders.getUserid()==null){
            userid = null;
        }else {
            userid = orders.getUserid().toString();
        }
        String orders_no = orders.getOrders_no();
        if (orders_no != null && !orders_no.trim().equals("")) {
            sb.append(" and orders_no ='");
            sb.append(orders_no);
            sb.append("'");
        }
        if (userid != null && !userid.trim().equals("")) {
            sb.append(" or userid='");
            sb.append(userid);
            sb.append("'");
        }
        sb.append(") where r>=");
        sb.append(pageInfo.getBegin());
        sb.append(" and r<=");
        sb.append(pageInfo.getEnd());

        String sql = sb.toString();
        System.out.println(sql);
        list = od.getPageByQuery(sql,Orders.class);
        return list;
    }

    @Override
    public int deleteOrder(String oid) throws Exception {

        Orders orders = od.getOneById(Integer.parseInt(oid),Orders.class);
        String sql = "select * from orderdetail where oid = "+orders.getOid();
        Dao dao = new DaoImpl();
        List<OrderDetail> list = dao.getPageByQuery(sql,OrderDetail.class);
        for(OrderDetail od:list){
            dao.delete(od);
        }
        return od.delete(orders);
    }

    @Override
    public int updateOrder(Orders orders) throws Exception {

        return od.update(orders);
    }
    @Override
    public Orders selectOneOrder(String oid) throws Exception {
        Orders orders = od.getOneById(Integer.parseInt(oid),Orders.class);
        return orders;
    }

    @Override
    public List<Orders> selectOneOrderbyNo(String orders_no) throws Exception {
        String sql = "select * from orders where orders_no ="+orders_no;
        System.out.println("0");
        List<Orders> list = od.getPageByQuery(sql,Orders.class);
        return list;
    }
}
