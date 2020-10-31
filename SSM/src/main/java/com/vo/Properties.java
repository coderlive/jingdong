package com.vo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Properties {
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator = "select seq_properties.nextval from dual")
    @Id
    private Integer prp_id;
    private Integer cid;
    private String pname;

    public Integer getPrp_id() {
        return prp_id;
    }

    public void setPrp_id(Integer prp_id) {
        this.prp_id = prp_id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }


}
