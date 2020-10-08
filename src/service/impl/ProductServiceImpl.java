package service.impl;

import dao.impl.ProductDaoImpl;
import dao.inner.ProductDao;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import page.OrderCondition;
import page.PageInfo;
import service.inner.ProductService;
import vo.Products;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

public class ProductServiceImpl implements ProductService {
    private ProductDao pd=new ProductDaoImpl();

    @Override
    public int selectIsActive(String sql) throws Exception {
        return pd.getTotalRecordCount(sql);
    }

    @Override
    public void addProduct(Products p) throws Exception {
        pd.add(p);
    }

    @Override
    public int getPageQueryByCount(Products p) throws Exception {
        String sql="select count(1) from products where 1=1";;
        String pname=p.getPname();
        String dianpu_name=p.getDianpu_name();
        Integer cid=p.getCid();
        Integer onsale=p.getOnsale();
        if (pname!=null&&!pname.trim().equals(""))
        {
            sql+=" and pname='"+pname+"'";
        }
        if (dianpu_name!=null&&!dianpu_name.trim().equals(""))
        {
            sql+=" or dianpu_name like '%"+dianpu_name+"%'";
        }
        if (onsale!=null)
        {
            sql+=" or onsale="+onsale;
        }
        if (cid!=null)
        {
            sql+=" and cid="+cid;
        }
        System.out.println(sql);
        return pd.getTotalRecordCount(sql);
    }

    @Override
    public List<Products> getPageQuery(PageInfo pageInfo, Products p, OrderCondition oc) throws Exception {
//        select * from (select c.*,rownum r from (select * from products order by price) c where 1=1 and rownum<=8 ) where r>=1 ;
        String sql="select * from (select c.*,rownum r from (select * from products ";
        String pname=p.getPname();
        String dianpu_name=p.getDianpu_name();
        Integer cid=p.getCid();
        Integer onsale=p.getOnsale();
        sql+=" order by "+oc.getOrderCondition()+" "+oc.getAscOrDesc();
        sql+=") c where 1=1 ";
        if (pname!=null&&!pname.trim().equals(""))
        {
            sql+=" and pname='"+pname+"'";
        }
        if (dianpu_name!=null&&!dianpu_name.trim().equals(""))
        {
            sql+=" or dianpu_name like '%"+dianpu_name+"%'";
        }
        if (onsale!=null)
        {
            sql+=" or onsale="+onsale;
        }
        if (cid!=null)
        {
            sql+=" and cid="+cid;
        }
        sql+=" and rownum<="+pageInfo.getEnd();
        sql+=") where r>="+pageInfo.getBegin();
        System.out.println(sql);
        return pd.getPageByQuery(sql,Products.class);
    }

    @Override
    public Products selectById(int pid) throws Exception {
        return pd.getOneById(pid,Products.class);
    }

    @Override
    public int updateProduct(Products p) throws Exception {
        return pd.update(p);
    }

    @Override
    public int deleteProduct(Products p) throws Exception {
        return pd.delete(p);
    }

    @Override
    public int upperOrLower(Integer action,String pid) {
        return pd.updateOrLower(action,pid);
    }

    @Override
    public void upload(HttpServletRequest request, String productListUploadPath) {
        String pid = "";

        DiskFileItemFactory itemFactory = new DiskFileItemFactory();
        // 设置内存缓冲区的阀值为512K
        itemFactory.setSizeThreshold(0x80000);

        File tempDir = new File("E:\\temp");//设置临时的文件存储空间
        if (!tempDir.exists()) {//如果文件不存在就创建这个文件
            tempDir.mkdirs();
        }

        // 设置临时存储文件的目录为D:\\temp
        itemFactory.setRepository(tempDir);

        ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
        //设置上传文件的最大数据量为10M
        fileUpload.setSizeMax(0xA00000);

        //解析上传文件流，得到FileItem对象的列表
        List<String> fileNameList = new ArrayList<String>();// 存文件名

        try {
            List<FileItem> fileItems = fileUpload.parseRequest(request);//把表单域转换为文件选项
            System.out.println("size=" + fileItems.size());//查看表单域的数量
            Iterator<FileItem> it = fileItems.iterator();

            boolean flag = true;//一个产品的图片  放到一个文件夹 为了保证后面标注 “只执行一次”的代码 只执行一次

            while (it.hasNext()) {


                FileItem item = it.next();
                // 判断是否是文件域
                if (!item.isFormField()) {
                    System.out.println("是文件");

                    String name = item.getName();//获取文件项的名字

                    long size = item.getSize();//获取文件项的大小

                    if ((name == null || name.equals("")) && size == 0) {//名字为空或者大小为0的时候退出
                        fileNameList.add("");
                        continue;
                    }

                    System.out.println("name=" + item.getName());//打印名字
                    System.out.println("size=" + item.getSize());//打印大小

                    // 保存上传的文件到指定的目录
                    if(flag){

                        productListUploadPath = productListUploadPath + "/product" + pid; //只执行一次
                        flag = false;//路径只拼接一次，根据路径的拼接来获取一个路径
                    }

                    File uploadFileDir = new File(productListUploadPath);
                    System.out.println("uploadFileDir=" + uploadFileDir);
                    if (!uploadFileDir.exists()) {//如果文件夹不存在就创建这个文件夹
                        uploadFileDir.mkdirs();
                    }

                    // 如果浏览器传送的文件名是全路径名，则取出文件名
                    // 图片本身的名字_当前时间距离1970年毫秒数_随机数1_随机数2
                    // d:\\......\\1.jpg
                    int index = name.lastIndexOf(File.separator);
                    if (index > 0) {
                        name = name.substring(index + 1, name.length());
                    }

                    // 解决同名文件覆盖问题:随机生成一个 唯一 的名字 用来替换上传文件的名字即可
                    System.out.println("*********look here*********");

                    long currentTime = System.currentTimeMillis();

                    Random random = new Random();

                    int num1 = random.nextInt(10000);
                    int num2 = random.nextInt(10000);

                    int dotPosition = name.lastIndexOf(".");

                    String fileBeginName = name.substring(0, dotPosition);
                    String fileEndName = name.substring(dotPosition);
                    name = fileBeginName + "_" + currentTime + "_" + num1 + "_"
                            + num2 + fileEndName;//在这里生成的路径都要传入fileNameList对象当中

                    System.out.println("afterName=" + name);
                    fileNameList.add(name);

                    File file = new File(uploadFileDir, name);
                    item.write(file);// 上传文件 就这一句

                } else {
                    System.out.println("不是文件 是普通的表单域");
                    // 得到所有非文件域 的表单域,例如文本框等,这里得到pid 和 pname 这两个文本框的值
                    String fieldName = item.getFieldName();
                    String value = item.getString("utf-8");
                    System.out.println("fieldName=" + fieldName);//pid
                    System.out.println("value=" + value);//180
                    if ("pid".equals(fieldName)) {//获取pid的名称
                        pid = value;
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("**********look here***************");
        System.out.println("pid=" + pid);
        for (String str : fileNameList) {//查看文件的选项
            System.out.println(str);
        }
        //---------------------------2.把上传的文件名 保存到数据库对应的字段中------------------------------
        List<String> fileNameWithDirectoryList = new ArrayList<String>();//带文件夹的文件名 例如 product2\\图片名
        for(String fileName:fileNameList){

            String fileNameWithDirectory = "";

            if(!fileName.trim().equals("")){
                fileNameWithDirectory = "product" + pid + "/" + fileName;
            }

            fileNameWithDirectoryList.add(fileNameWithDirectory);

        }


        try {
            saveImagePathInTable(pid, fileNameWithDirectoryList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        tempDir.delete();//用完这个文件夹你就给我清楚了他
    }

    @Override
    public List<Products> selectAllProduct(int cid) throws Exception {
        String sql="select * from products where cid="+cid;
        return pd.getPageByQuery(sql,Products.class);
    }

    @Override
    public List<Products> salesVolume(String row) throws Exception {
        String sql="select * from (select * from products order by xiao_liang desc) where rownum<="+row;
        return pd.getPageByQuery(sql,Products.class);
    }

    @Override
    public void updateProductByOid(String no_id,int status) {
        String sql="update orders set status="+status+" where ORDERS_NO='"+no_id+"'";
        pd.updateProductByOid(sql);
    }

    public void saveImagePathInTable(String pid,List<String> fileNameWithDirectoryList) throws Exception{
        System.out.println("fileNameWithDirectoryList size=" + fileNameWithDirectoryList.size());
        //先把以前的查出来
        Products product;
        try {
            product = pd.getOneById(Integer.parseInt(pid),Products.class);//先查出来再覆盖
        } catch (Exception e1) {
            e1.printStackTrace();
            throw new Exception("保存商品图片路径时 查询单一商品失败!");
        }
        String[] imgNameArr = {"product_list_large_image","product_list_small_image1","product_list_small_image2","product_list_small_image3","detail_large_img","detail_small_img1","detail_small_img2","detail_small_img3","detail_small_img4","detail_small_img5","shopping_car_img"};

        //也可以使用BeanUtils工具类的 setProperty(对象,属性名,属性值)这个方法为product修改属性值
        for(int i=0;i<imgNameArr.length;i++) {
            String imgLocation = fileNameWithDirectoryList.get(i);
            if (!imgLocation.equals("")) {//老师的代码这里有bug，坑了我，可恶
                //相当于product.setProductListLargeImage(imgLocation);
                BeanUtils.setProperty(product, imgNameArr[i], imgLocation);//使用反射来设置对象的图片属性
            }
        }


        //保存图片路径到指定字段
        pd.update(product);
    }
}
