package service.inner;

import page.PageInfo;
import vo.Orders;

import java.util.List;

public interface OrderService {
    void addOrder(Orders o) throws Exception;

    Integer selectIdByOrderNo(String str) throws Exception;

    List<Orders> selectOrdersByUserid(String userid) throws Exception;

    int getTotalRecordCount() throws Exception;

    public List<Orders> getAllByPage(PageInfo pageInfo) throws Exception;

    public int getTotalRecordCount(Orders orders) throws Exception;

    public List<Orders> getPageByQuery(Orders orders,PageInfo pageInfo) throws Exception;

    int deleteOrder(String oid) throws  Exception;

    int updateOrder(Orders orders) throws  Exception;

    Orders selectOneOrder(String oid) throws Exception;

    List<Orders> selectOneOrderbyNo(String orders_no) throws  Exception;

    int deleteOrderByOrders_no(String Orders_no) throws Exception;
}
