package com.service.inner;


import com.vo.Orders;

import java.util.List;

public interface OrderService {

    void addOrder(Orders o);

    Integer selectIdByOrderNo(String order_no);

    void UpdateOrderByOrderNo(String out_trade_no, Integer i);

    List<Orders> selectOrdersByUserid(Integer userid);

    Integer deleteOrderByOrders_no(String orders_no);

    int getTotalRecordCount();

    List<Orders> getAllByPage();

    void deleteById(Orders o);

    Orders selectOrderById(Orders o);

    void update(Orders orders);
}
