package servlet;

import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;
import page.PageInfo;
import service.impl.CategoryServiceImpl;
import service.inner.CategoryService;
import vo.Categorys;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.security.Key;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(urlPatterns ="/CategoryServlet")
public class CateGoryServlet extends HttpServlet {
    public CategoryService cs= new CategoryServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("您执行了"+action+"操作");
        if (action.equals("add"))
        {
            add(request,response);
        }else if (action.equals("deleteById"))
        {
            deleteById(request,response);
        }else if (action.equals("modify"))
        {
            modify(request,response);
        }
        else if(action.equals("deleteNoId"))
        {
            deleteNoId(request,response);
        }else if(action.equals("getPageByQuery"))
        {
            getPageByQuery(request,response);
        }else if (action.equals("getLevelCategory"))//获取商品种类
        {
            getLevelCategory(request,response);
        }
    }

    protected void getLevelCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //调用ajax方法返回当前商品级别的所有数据
        String sql="select * from categorys where clevel=";//查询一级商品
        String clevel=request.getParameter("clevel");
        sql+=clevel;
        String cparent=request.getParameter("cparent");
        if (cparent!=null)
            sql+=" and cparent="+cparent;
//        System.out.println(sql);
        try {
            List<Categorys> list=cs.selectAll(sql);
//            System.out.println(list);
            Gson gson=new Gson();
//            gson.toJson(list);
            PrintWriter pw= response.getWriter();
           pw.print(gson.toJson(list));
           pw.flush();
           pw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //下面这个是分页查询
    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchCondition=request.getParameter("searchCondition");
        if (searchCondition==null)
            searchCondition="";
        System.out.println("查询条件为："+searchCondition);
        List<Categorys> list=new ArrayList<>();
        String Page=request.getParameter("requestPage");
        int requestPage;
        if (Page==null) {
            requestPage= 1;
        }else {
            requestPage=Integer.parseInt(Page);
        }
        String clevel=request.getParameter("clevel");
        int level=0;
        if (clevel!=null)
        {
            level=Integer.parseInt(clevel);
        }
        PageInfo pageInfo=new PageInfo(requestPage);
        Categorys c=new Categorys();
        c.setCname(searchCondition);
        c.setCdesc(searchCondition);
        c.setClevel(level);
        try {
            int count=cs.getPageQueryByCount(c);
            pageInfo.setTotalRecordCount(count);
            list=cs.getPageQuery(pageInfo,c);
            request.setAttribute("list",list);
            request.setAttribute("pageInfo",pageInfo);
            request.setAttribute("searchCondition",searchCondition);
            request.setAttribute("clevel",clevel);
            request.getRequestDispatcher("WEB-INF/jsp/admin/category/categoryMain.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //自己的的方法，删除一个数据，不用id，用商品名称就可以删除
    protected void deleteNoId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map= request.getParameterMap();
        Categorys c=new Categorys();
        try {
            BeanUtils.populate(c,map);
            cs.deleteNoId(c);
            System.out.println(c);

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //添加一个数据
    protected void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            Map<String, String[]> map= request.getParameterMap();
        Categorys c=new Categorys();
        try {
            BeanUtils.populate(c,map);
            System.out.println(c);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(c);
        try {
            String sql="select * from categorys where cname='"+c.getCname()+"'";
            int isactive= cs.selectIsActive(sql);
            if (isactive>0)
            {
                System.out.println("已经有这个用户了,不能再添加");
                request.setAttribute("msg","已经有这个用户了,不能再添加");
                request.getRequestDispatcher("jsp/showmessage.jsp").forward(request,response);
            }else {
                cs.addCategory(c);
                getPageByQuery(request,response);//添加成功后跳转页面
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        doPost(request,response);
    }
    //用id值删除一个数据
    protected void deleteById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map= request.getParameterMap();
        Categorys c=new Categorys();
        try {
            BeanUtils.populate(c,map);
            cs.delete(c);
            getPageByQuery(request,response);//直接调用这个方法重新查询页面
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //修改数据
    protected void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map= request.getParameterMap();
        Categorys c=new Categorys();
        try {
            BeanUtils.populate(c,map);
//            System.out.println(c);
            Categorys c1=cs.selectById(c.getCid());;
            if (c1!=null)
            {

                int i = cs.updateCate(c);
//                System.out.println("修改是否成功" + i);
                getPageByQuery(request, response);//直接调用这个方法重新查询页面
            }
            else {
                System.out.println("要修改的用户不存在");
                request.setAttribute("msg","要修改的用户不存在");
                request.getRequestDispatcher("jsp/showmessage.jsp").forward(request,response);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
