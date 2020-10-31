package com.vo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "orderdetail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator = "select seq_OrderDetail.nextval from dual")
    private Integer  detail_id;
    private Integer order_sum;
    private Integer oid;
    private Integer pid;
    private Products p;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

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

    public Products getP() {
        return p;
    }

    public void setP(Products p) {
        this.p = p;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "detail_id=" + detail_id +
                ", order_sum=" + order_sum +
                ", oid=" + oid +
                ", pid=" + pid +
                ", p=" + p +
                ", pid=" + pid +
                '}';
    }
}
