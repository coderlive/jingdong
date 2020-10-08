package service.inner;

import vo.OrderDetail;

import java.util.List;

public interface OrderDetailService {
    void addOrderDetail(OrderDetail od) throws Exception;

    List<OrderDetail> selectOrderDetailByOrderId(String oid) throws Exception;
}
