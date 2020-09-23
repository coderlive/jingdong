package vo;

public class Products {
    private Integer pid;//商品id
    private String pname;//商品名称
    private Float price;//商品价格
    private Float pingjia_sum;//评价数
    private String dianpu_name;//店铺名
    private String product_list_large_image;//列表页大图
    private String product_list_small_image1;//列表页小图
    private String product_list_small_image2;
    private String product_list_small_image3;
    private String pdesc;//商品描述
    private Integer product_sum;//商品数量
    private String detail_large_img;//详情页大图
    private String detail_small_img1;//详情页小图
    private String detail_small_img2;
    private String detail_small_img3;
    private String detail_small_img4;
    private String detail_small_img5;
    private String shopping_car_img;//购物车商品图片
    private Integer onsale;//1 表示上架  0 表示下架
    private Integer cid;//所属二级商品种类id

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getPingjia_sum() {
        return pingjia_sum;
    }

    public void setPingjia_sum(Float pingjia_sum) {
        this.pingjia_sum = pingjia_sum;
    }

    public String getDianpu_name() {
        return dianpu_name;
    }

    public void setDianpu_name(String dianpu_name) {
        this.dianpu_name = dianpu_name;
    }

    public String getProduct_list_large_image() {
        return product_list_large_image;
    }

    public void setProduct_list_large_image(String product_list_large_image) {
        this.product_list_large_image = product_list_large_image;
    }

    public String getProduct_list_small_image1() {
        return product_list_small_image1;
    }

    public void setProduct_list_small_image1(String product_list_small_image1) {
        this.product_list_small_image1 = product_list_small_image1;
    }

    public String getProduct_list_small_image2() {
        return product_list_small_image2;
    }

    public void setProduct_list_small_image2(String product_list_small_image2) {
        this.product_list_small_image2 = product_list_small_image2;
    }

    public String getProduct_list_small_image3() {
        return product_list_small_image3;
    }

    public void setProduct_list_small_image3(String product_list_small_image3) {
        this.product_list_small_image3 = product_list_small_image3;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public Integer getProduct_sum() {
        return product_sum;
    }

    public void setProduct_sum(Integer product_sum) {
        this.product_sum = product_sum;
    }

    public String getDetail_large_img() {
        return detail_large_img;
    }

    public void setDetail_large_img(String detail_large_img) {
        this.detail_large_img = detail_large_img;
    }

    public String getDetail_small_img1() {
        return detail_small_img1;
    }

    public void setDetail_small_img1(String detail_small_img1) {
        this.detail_small_img1 = detail_small_img1;
    }

    public String getDetail_small_img2() {
        return detail_small_img2;
    }

    public void setDetail_small_img2(String detail_small_img2) {
        this.detail_small_img2 = detail_small_img2;
    }

    public String getDetail_small_img3() {
        return detail_small_img3;
    }

    public void setDetail_small_img3(String detail_small_img3) {
        this.detail_small_img3 = detail_small_img3;
    }

    public String getDetail_small_img4() {
        return detail_small_img4;
    }

    public void setDetail_small_img4(String detail_small_img4) {
        this.detail_small_img4 = detail_small_img4;
    }

    public String getDetail_small_img5() {
        return detail_small_img5;
    }

    public void setDetail_small_img5(String detail_small_img5) {
        this.detail_small_img5 = detail_small_img5;
    }

    public String getShopping_car_img() {
        return shopping_car_img;
    }

    public void setShopping_car_img(String shopping_car_img) {
        this.shopping_car_img = shopping_car_img;
    }

    public Integer getOnsale() {
        return onsale;
    }

    public void setOnsale(Integer onsale) {
        this.onsale = onsale;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "products{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", price=" + price +
                ", pingjia_sum=" + pingjia_sum +
                ", dianpu_name='" + dianpu_name + '\'' +
                ", product_list_large_image='" + product_list_large_image + '\'' +
                ", product_list_small_image1='" + product_list_small_image1 + '\'' +
                ", product_list_small_image2='" + product_list_small_image2 + '\'' +
                ", product_list_small_image3='" + product_list_small_image3 + '\'' +
                ", pdesc='" + pdesc + '\'' +
                ", product_sum=" + product_sum +
                ", detail_large_img='" + detail_large_img + '\'' +
                ", detail_small_img1='" + detail_small_img1 + '\'' +
                ", detail_small_img2='" + detail_small_img2 + '\'' +
                ", detail_small_img3='" + detail_small_img3 + '\'' +
                ", detail_small_img4='" + detail_small_img4 + '\'' +
                ", detail_small_img5='" + detail_small_img5 + '\'' +
                ", shopping_car_img='" + shopping_car_img + '\'' +
                ", onsale=" + onsale +
                ", cid=" + cid +
                '}';
    }
}
