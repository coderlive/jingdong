package com.service.impl;

import com.dao.OrderDetailMapper;
import com.service.inner.OrderDetailService;
import com.vo.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    private OrderDetailMapper odd;

    @Override
    public void addOrderDetail(OrderDetail od) {
        odd.insertSelective(od);
    }
}
