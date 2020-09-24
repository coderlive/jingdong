package servlet;

import org.apache.commons.beanutils.BeanUtils;
import page.PageInfo;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import service.inner.CategoryService;
import service.inner.ProductService;
import util.ProductDictionary;
import vo.Categorys;
import vo.Products;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns ="/ProductServlet",initParams = {@WebInitParam(name="productImageUploadPath",value="E:/gitProject/jingdong/web/img/productImage")})
public class ProductServlet extends HttpServlet {
    private ProductService ps=new ProductServiceImpl();
    private CategoryService cs=new CategoryServiceImpl();
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
        }
    }
    private void uploadImage(HttpServletRequest request, HttpServletResponse response) {
        String target = "/WEB-INF/jsp/msg.jsp";//错误的就转发到错误的视图
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
                e.printStackTrace();
            }
        }
        // 三.转发视图
        try {
            request.getRequestDispatcher(target).forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
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
        Products p= null;//查询出这个东西
        try {
            p = ps.selectById(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        target="WEB-INF/jsp/admin/product/"+target+".jsp";
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("product",p);
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
        Products p=null;
        Categorys c=null;
        try {
            p=ps.selectById(pid);
            c=cs.selectById(p.getCid());

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("product",p);
        request.setAttribute("category",c);
        request.setAttribute("searchCondition",searchCondition);
        request.setAttribute("requestPage",requestPage);
        request.getRequestDispatcher("WEB-INF/jsp/admin/product/updateProduct.jsp").forward(request,response);
    }

    //下面这个是分页查询
    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchCondition=request.getParameter("searchCondition");
        String target=request.getParameter("target");
        Integer intOnsale= ProductDictionary.onsaleStrToInt(searchCondition);//根据查询条件获取上下架的状态
        if (searchCondition==null)
            searchCondition="";
        System.out.println("查询条件为："+searchCondition);
        List<Products> list=new ArrayList<>();
        String Page=request.getParameter("requestPage");
        int requestPage;
        if (Page==null) {
            requestPage= 1;
        }else {
            requestPage=Integer.parseInt(Page);
        }

        PageInfo pageInfo=new PageInfo(requestPage);
        Products p=new Products();
        try {
            List<Categorys> lc_list=cs.selectByName(searchCondition);
            if (lc_list.size()!=0)
            {
                Categorys category=lc_list.get(0);
                p.setCid(lc_list.get(0).getCid());
                request.setAttribute("category",category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        p.setPname(searchCondition);
        p.setDianpu_name(searchCondition);
        p.setOnsale(intOnsale);
        try {
            int count=ps.getPageQueryByCount(p);
            pageInfo.setTotalRecordCount(count);
            list=ps.getPageQuery(pageInfo,p);
            System.out.println(list);
            target="WEB-INF/jsp/admin/product/"+target+".jsp";
            request.setAttribute("list",list);
            request.setAttribute("pageInfo",pageInfo);
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
                request.getRequestDispatcher("jsp/showmessage.jsp").forward(request,response);
            }else {
                ps.addProduct(p);
//                getPageByQuery(request,response);//添加成功后跳转页面
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
