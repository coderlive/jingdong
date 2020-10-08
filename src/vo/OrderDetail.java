package vo;

public class OrderDetail {
    private Integer  detail_id;
    private Integer order_sum;
    private Integer oid;
    private Integer pid;

    public Integer getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(Integer detail_id) {
        this.detail_id = detail_id;
    }

    public Integer getOrder_sum() {
        return order_sum;
    }

    public void setOrder_sum(Integer order_sum) {
        this.order_sum = order_sum;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
