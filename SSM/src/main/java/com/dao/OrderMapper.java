package com.dao;


import com.vo.Orders;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface OrderMapper extends Mapper<Orders> {
    List<Orders> selectMyOrders(Integer userid);
    @Select("${sql}")
    int selectBySql(String s);
    @Select("${sql}")
    List<Orders> selectListBySql(String s);
}
