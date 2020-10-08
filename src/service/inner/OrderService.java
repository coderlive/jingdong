package service.inner;

import vo.Orders;

public interface OrderService {
    void addOrder(Orders o) throws Exception;

    Integer selectIdByOrderNo(String str) throws Exception;
}
