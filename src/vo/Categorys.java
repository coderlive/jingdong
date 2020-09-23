package vo;

public class Categorys {
    private Integer cid;//商品id
    private Integer cparent;//商品的父级id
    private Integer clevel;//商品层级
    private String cname;//商品名称
    private String cdesc;//商品描述

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCparent() {
        return cparent;
    }

    public void setCparent(Integer cparent) {
        this.cparent = cparent;
    }

    public Integer getClevel() {
        return clevel;
    }

    public void setClevel(Integer clevel) {
        this.clevel = clevel;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdesc() {
        return cdesc;
    }

    public void setCdesc(String cdesc) {
        this.cdesc = cdesc;
    }

    @Override
    public String toString() {
        return "Categorys{" +
                "cid=" + cid +
                ", cparent=" + cparent +
                ", clevel=" + clevel +
                ", cname='" + cname + '\'' +
                ", cdesc='" + cdesc + '\'' +
                '}';
    }
}
