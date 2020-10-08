package vo;


import java.math.BigInteger;

public class Orders {
    private Integer oid;//订单主键
    private String orders_no;//订单编号
    private String order_time;//订单生成时间
    private String received_address;//订单地址
    private Integer all_price;//订单总价格
    private Integer userid;//外键，用户id
    private Integer status;//订单状态 0未付款 1已付款 2发货 已完成

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getOrders_no() {
        return orders_no;
    }

    public void setOrders_no(String orders_no) {
        this.orders_no = orders_no;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public String getReceived_address() {
        return received_address;
    }

    public void setReceived_address(String received_address) {
        this.received_address = received_address;
    }

    public Integer getAll_price() {
        return all_price;
    }

    public void setAll_price(Integer all_price) {
        this.all_price = all_price;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
