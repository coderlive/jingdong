package com.vo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
public class Properties_select {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator = "select seq_properties_select.nextval from dual")
    private Integer psid;
    private Integer pid;
    private String psname;

    public Integer getPsid() {
        return psid;
    }

    public void setPsid(Integer psid) {
        this.psid = psid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPsname() {
        return psname;
    }

    public void setPsname(String psname) {
        this.psname = psname;
    }

    @Override
    public String toString() {
        return "Properties_select{" +
                "psid=" + psid +
                ", pid=" + pid +
                ", psname='" + psname + '\'' +
                '}';
    }
}
