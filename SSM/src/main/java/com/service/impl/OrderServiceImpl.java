package com.service.impl;


import com.dao.OrderDetailMapper;
import com.dao.OrderMapper;
import com.service.inner.OrderService;
import com.vo.OrderDetail;
import com.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Override
    public void addOrder(Orders o) {
        orderMapper.insertSelective(o);
    }

    @Override
    public Integer selectIdByOrderNo(String order_no) {
        Orders o=new Orders();
        o.setOrders_no(order_no);
        o=orderMapper.selectOne(o);
        return o.getOid();
    }

    @Override
    public void UpdateOrderByOrderNo(String out_trade_no, Integer i) {
        Orders o=new Orders();
        o.setStatus(i);
        Example example=new Example(Orders.class);
        Example.Criteria c=example.createCriteria();
        c.andEqualTo("orders_no",out_trade_no);
        orderMapper.updateByExampleSelective(o,example);
    }

    @Override
    public List<Orders> selectOrdersByUserid(Integer userid) {
        return orderMapper.selectMyOrders(userid);
    }

    @Override
    public Integer deleteOrderByOrders_no(String orders_no) {
        Orders o=new Orders();
        o.setOrders_no(orders_no);
        o=orderMapper.selectOne(o);
        Example e=new Example(OrderDetail.class);
        Example.Criteria c=e.createCriteria();
        c.andEqualTo("oid",o.getOid());
        orderDetailMapper.deleteByExample(e);
        return orderMapper.deleteByPrimaryKey(o);
    }

    @Override
    public int getTotalRecordCount() {
        return orderMapper.selectBySql("select count(1) from orders");
    }

    @Override
    public List<Orders> getAllByPage() {
        return orderMapper.selectListBySql("select * from orders");
    }

    @Override
    public void deleteById(Orders o) {
        Example e=new Example(OrderDetail.class);
        Example.Criteria c=e.createCriteria();
        c.andEqualTo("oid",o.getOid());
        orderDetailMapper.deleteByExample(e);
        orderMapper.deleteByPrimaryKey(o);
    }

    @Override
    public Orders selectOrderById(Orders o) {
        return orderMapper.selectByPrimaryKey(o);
    }

    @Override
    public void update(Orders orders) {
        orderMapper.updateByPrimaryKeySelective(orders);
    }
}
