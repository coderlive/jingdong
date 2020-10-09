package servlet;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import page.OrderCondition;
import page.PageInfo;
import service.impl.AttributeServiceImpl;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.ProperselectServiceImpl;
import service.inner.AttributeService;
import service.inner.CategoryService;
import service.inner.ProductService;
import service.inner.ProperselectService;
import util.ProductDictionary;
import vo.Categorys;
import vo.Products;
import vo.Properties;
import vo.Properties_select;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns ="/ProductServlet",initParams = {@WebInitParam(name="productImageUploadPath",value="E:/gitProject/jingdong/web/img/productImage")})
public class ProductServlet extends HttpServlet {
    private ProductService ps=new ProductServiceImpl();
    private CategoryService cs=new CategoryServiceImpl();
    private AttributeService attributeService = new AttributeServiceImpl();
    private ProperselectService properselectService = new ProperselectServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("您执行了"+action+"操作");
        if (action.equals("add"))//添加商品
        {
            add(request,response);
        }else if (action.equals("getPageByQuery"))//分页查询
        {
            getPageByQuery(request,response);
        }else if(action.equals("getOneForUpdate"))//获取要修改的商品并跳到修改页面
        {
            getOneForUpdate(request,response);
        }else if(action.equals("updateProduct"))//更新商品
        {
            updateProduct(request,response);//更新内容
        }else if(action.equals("delete"))//删除商品
        {
            delete(request,response);
        }else if(action.equals("upperOrLower"))//上架或者下架
        {
            upperOrLower(request,response);
        }else if(action.equals("getOneForUpload"))//先查出图片数据再跳到要上传图片的页面
        {
            getOneForUpload(request,response);
        }else if(action.equals("uploadImage"))//上传图片的功能
        {
            uploadImage(request,response);
        }else if(action.equals("selectAllProduct"))//查询所有的商品,根据cid查询所有商品
        {
            selectAllProduct(request,response);
        }else if(action.equals("salesVolume"))
        {
            salesVolume(request,response);//查询商品销量，返回json数据
        }
    }

    private void salesVolume(HttpServletRequest request, HttpServletResponse response) {
        List<Products> list=null;
        String row=request.getParameter("row");
        Gson gson=new Gson();
        try {
             list=ps.salesVolume(row);
             response.setContentType("application/json");
             PrintWriter pw= response.getWriter();
             pw.print(gson.toJson(list));
             pw.flush();
             pw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //这个方法暂时不用
    private void selectAllProduct(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("cid");
        int cid=Integer.parseInt(id);
        List<Products> list= null;
        try {
            list = ps.selectAllProduct(cid);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("list",list);
        try {
            request.getRequestDispatcher("/WEB-INF/jsp/admin/product/Productlist.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void uploadImage(HttpServletRequest request, HttpServletResponse response) {
//        String target = "/WEB-INF/jsp/msg.jsp";//错误的就转发到错误的视图
        // 一.填充数据
        // 二.调用业务逻辑
        ServletConfig servletConfig = this.getServletConfig();
        String productListUploadPath = servletConfig
                .getInitParameter("productImageUploadPath");
        System.out.println("productListUploadPath=" + productListUploadPath);//获取页面上传的路径
        if(productListUploadPath==null||productListUploadPath.trim().equals("")){
            request.setAttribute("msg", "系统未指定上传路径");
        }else{
            try {
                ps.upload(request, productListUploadPath);
                request.setAttribute("msg", "上传图片成功");
            } catch (Exception e) {

                request.setAttribute("msg", "上传图片失败");
                try {
                    request.getRequestDispatcher("/WEB-INF/jsp/msg.jsp").forward(request, response);
                } catch (ServletException e1) {
                    e1.printStackTrace();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
                e.printStackTrace();
            }
        }
        // 三.转发视图
        try {//跳转到商品管理的页面了
            response.sendRedirect("http://localhost:8080/HelloWorld/ProductServlet?action=getPageByQuery&target=/admin/product/productMain&requestPage=1");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void getOneForUpload(HttpServletRequest request, HttpServletResponse response)  {
        String target=request.getParameter("target");
        String Page=request.getParameter("requestPage");
        String searchCondition=request.getParameter("searchCondition");
        String id=request.getParameter("pid");
        int pid=Integer.parseInt(id);
        int requestPage;
        if (Page==null) {
            requestPage= 1;
        }else {
            requestPage=Integer.parseInt(Page);
        }
        PageInfo pageInfo=new PageInfo(requestPage);
        Properties properties = null;
        Properties_select properties_select =null;
        Products p= null;//查询出这个东西
        Categorys c = new Categorys();
        List<Properties> prop_list = new ArrayList<>();
//        List all_list=new ArrayList();//用来存储所有的数据
        Map<Properties,List<Properties_select>> map=new LinkedHashMap<>();
        try {
            p = ps.selectById(pid);
            c = cs.selectById(p.getCid());
            prop_list =  attributeService.getPropertiesByCid(c.getCid());//获取商品属性的集合


            for(Properties pp:prop_list){
                List<Properties_select> pro_selects = new ArrayList<>();
                Integer prp_id = pp.getPrp_id();//获取商品属性的选项
                pro_selects = properselectService.getPropertiesByPrp_id(prp_id);
                map.put(pp,pro_selects);
//                all_list.add(map);
            }
//            System.out.println(all_list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        target="WEB-INF/jsp/admin"+target+".jsp";
        request.setAttribute("target",target);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("product",p);
        request.setAttribute("all_map",map);
        request.setAttribute("searchCondition",searchCondition);
        try {
            request.getRequestDispatcher(target).forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void upperOrLower(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//上下架合到一起写了
        String updowm=request.getParameter("updowm");
        String pid=request.getParameter("pid");
        Integer action=Integer.parseInt(updowm);//1表示上架,0表示下架
        int count=ps.upperOrLower(action,pid);//更新商品上下架
        getPageByQuery(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map= request.getParameterMap();
        Products p=new Products();
        try {
            BeanUtils.populate(p,map);
            System.out.println(p);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            ps.deleteProduct(p);
            getPageByQuery(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map= request.getParameterMap();
        Products p=new Products();
        try {
            BeanUtils.populate(p,map);
            System.out.println(p);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
                ps.updateProduct(p);
                getPageByQuery(request,response);//添加成功后跳转页面
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void getOneForUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid=Integer.parseInt(request.getParameter("pid"));
        String searchCondition=request.getParameter("searchCondition");
        String requestPage=request.getParameter("requestPage");
        String target=request.getParameter("target");
        Products p=null;
        Categorys c=null;
        try {
            p=ps.selectById(pid);
            c=cs.selectById(p.getCid());

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("target",target);
        request.setAttribute("product",p);
        request.setAttribute("category",c);
        request.setAttribute("searchCondition",searchCondition);
        request.setAttribute("requestPage",requestPage);
        request.getRequestDispatcher("WEB-INF/jsp/admin/product/updateProduct.jsp").forward(request,response);
    }

    //下面这个是分页查询
    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> list=new ArrayList<>();
        String searchCondition=request.getParameter("searchCondition");
        String target=request.getParameter("target");
        //下面这个是设置分页的个数的,一页8个
        String perPageRecordCount=request.getParameter("perPageRecordCount");
        //下面两个是获取排序的条件
        String orderCondition=request.getParameter("orderCondition");
        String ascOrDesc=request.getParameter("ascOrDesc");
        Integer intOnsale= ProductDictionary.onsaleStrToInt(searchCondition);//根据查询条件获取上下架的状态
        if (searchCondition==null)
            searchCondition="";
        System.out.println("查询条件为："+searchCondition);
        String Page=request.getParameter("requestPage");
        int requestPage;
        if (Page==null) {
            requestPage= 1;
        }else {
            requestPage=Integer.parseInt(Page);
        }
        PageInfo pageInfo=new PageInfo(requestPage);
        if (perPageRecordCount!=null)
        {
            pageInfo.setPerPageRecordCount(Integer.parseInt(perPageRecordCount));
        }
        Products p=new Products();
        try {
            List<Categorys> lc_list=cs.selectByName(searchCondition);
            if (lc_list.size()!=0)//根据查询条件查看是不是有这个cid的商品
            {
                Categorys category=lc_list.get(0);
                p.setCid(lc_list.get(0).getCid());
                request.setAttribute("category",category);
            }
            String cid=request.getParameter("cid");//获取cid，如果是根据cid来查询的话就直接把cid放进去
            if (cid!=null&&!"".equals(cid))
            {
                p.setCid(Integer.parseInt(cid));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        p.setPname(searchCondition);
        p.setDianpu_name(searchCondition);
        p.setOnsale(intOnsale);
        OrderCondition oc=new OrderCondition();//这个是排序的类
        if (orderCondition!=null&&!orderCondition.equals(""))
        {
            oc.setOrderCondition(orderCondition);
        }if (ascOrDesc!=null&&!ascOrDesc.equals(""))
        {
            oc.setAscOrDesc(ascOrDesc);
        }
        try {
            int count=ps.getPageQueryByCount(p);
            pageInfo.setTotalRecordCount(count);
            list=ps.getPageQuery(pageInfo,p,oc);
            System.out.println(list);
            target="WEB-INF/jsp"+target+".jsp";
            request.setAttribute("orderConditionObj",oc);
            request.setAttribute("list",list);
            if(list.size()!=0)
            {
                request.setAttribute("product",list.get(0));//把第一个放进去好算一点
            }
            request.setAttribute("pageInfo",pageInfo);
            request.setAttribute("requestPage",requestPage);
            request.setAttribute("searchCondition",searchCondition);
            request.getRequestDispatcher(target).forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    protected void add(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> map= request.getParameterMap();
        Products p=new Products();
        try {
            BeanUtils.populate(p,map);
            System.out.println(p);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        try {
            String sql="select * from products where pname='"+p.getPname()+"'";
            int isactive= ps.selectIsActive(sql);//这个方法是查看表里面是否存在这个商品的信息
            if (isactive>0)
            {
                System.out.println("已经有这个用户了,不能再添加");
                request.setAttribute("msg","已经有这个用户了,不能再添加");
                request.getRequestDispatcher("WEB-INF/jsp/msg.jsp").forward(request,response);
            }else {
                ps.addProduct(p);
                getPageByQuery(request,response);//添加成功后跳转页面
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
