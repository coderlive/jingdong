package service.impl;

import dao.impl.OrderDetailDaoImpl;
import dao.inner.OrderDetailDao;
import service.inner.OrderDetailService;
import vo.OrderDetail;

public class OrderDetailServiceImpl implements OrderDetailService {
    private OrderDetailDao odd=new OrderDetailDaoImpl();

    @Override
    public void addOrderDetail(OrderDetail od) throws Exception {
        odd.add(od);
    }
}
