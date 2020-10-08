package service.impl;

import dao.impl.OrderDetailDaoImpl;
import dao.inner.OrderDetailDao;
import service.inner.OrderDetailService;
import vo.OrderDetail;

import java.util.List;

public class OrderDetailServiceImpl implements OrderDetailService {
    private OrderDetailDao odd=new OrderDetailDaoImpl();

    @Override
    public void addOrderDetail(OrderDetail od) throws Exception {
        odd.add(od);
    }

    @Override
    public List<OrderDetail> selectOrderDetailByOrderId(String oid) throws Exception {
        String sql = "select * from orderdetail where oid="+oid;
        return odd.getPageByQuery(sql,OrderDetail.class);
    }
}
